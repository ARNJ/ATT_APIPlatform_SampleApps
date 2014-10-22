#!/usr/bin/env ruby

# Copyright 2014 AT&T
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'sinatra'
require 'open-uri'
require 'uri'
require 'sinatra/config_file'

# require as a gem file load relative if fails
begin
  require 'att/codekit'
rescue LoadError
  # try relative, fall back to ruby 1.8 method if fails
  begin
    require_relative 'codekit/lib/att/codekit'
  rescue NoMethodError 
    require File.join(File.dirname(__FILE__), 'codekit/lib/att/codekit')
  end
end

include Att::Codekit

enable :sessions

config_file 'config.yml'

set :port, settings.port
set :protection, :except => :frame_options

SCOPE = "STTC"

RestClient.proxy = settings.proxy

AUDIO_DIR = File.join(File.expand_path(File.dirname(__FILE__)), "public/audio")
TEMPLATE_DIR = File.join(File.expand_path(File.dirname(__FILE__)), "public/template")


configure do
  FILE_SUPPORT = (settings.tokens_file && !settings.tokens_file.strip.empty?)
  FILE_EXISTS = FILE_SUPPORT && File.file?(settings.tokens_file)

  OAuth = Auth::ClientCred.new(settings.FQDN, 
                               settings.api_key, 
                               settings.secret_key)
  @@token = nil
end

before do
  drop_down_list
  dict, grammar, afile = load_files
  @mime_data = "x-dictionary:\n" + dict + "\n\nx-grammar:\n" + grammar 

  begin
    if @@token.nil?
      if FILE_EXISTS 
        @@token = Auth::OAuthToken.load(settings.tokens_file)
      else
        @@token = OAuth.createToken(SCOPE)
      end
    end
    Auth::OAuthToken.save(settings.tokens_file, @@token) if FILE_SUPPORT

    if @@token.expired?
      @@token = OAuth.refreshToken(@@token)
      Auth::OAuthToken.save(settings.tokens_file, @@token) if FILE_SUPPORT
    end
  rescue Exception => e
    @error = e.message
  end
end

get '/' do
  erb :speech
end

post '/SpeechToText' do
  begin
    service = Service::SpeechService.new(settings.FQDN, @@token)
    dict, grammar, afile = load_files

    if params[:nameParam] and params[:SpeechContext] == "GenericHints"
      grammar_type = params[:nameParam]
    else
      grammar_type = nil 
    end

    @result = service.speechToText(afile, dict, grammar, 
                                   :context => params[:SpeechContext], 
                                   :grammar => grammar_type,
                                   :xargs => settings.X_arg)

  rescue Exception => e
    @error = e.message
  end
  erb :speech
end


def load_files
  dictionary = File.join(TEMPLATE_DIR, "x-dictionary.txt")
  grammar = File.join(TEMPLATE_DIR, "x-grammar.txt")
  audio_file = File.join(AUDIO_DIR, "pizza-en-US.wav")

  return [dictionary, grammar, audio_file]
end

def drop_down_list
  @context_types = settings.speech_context.split(",")
  @type_list = Array.new
  @audio_file_list = Array.new

  @context_types.each do |p|
    @type_list.push p
  end

  Dir.entries(AUDIO_DIR).sort.each do |x|
    @audio_file_list.push x unless x.match /\A\.+/
  end
end

