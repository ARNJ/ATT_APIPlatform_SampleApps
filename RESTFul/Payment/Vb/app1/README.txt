******************************************************************************************
* Licensed by AT&T under 'Software Development Kit Tools Agreement.' 2013
* TERMS AND CONDITIONS FOR USE, REPRODUCTION, AND DISTRIBUTION: http://developer.att.com/sdk_agreement/
* Copyright 2013 AT&T Intellectual Property. All rights reserved. http://developer.att.com
* For more information contact developer.support@att.com<mailto:developer.support@att.com>
******************************************************************************************

  AT&T API Platform Samples - Payment app 1
 ---------------------------------
This application allows the user to 

  1. Make a new transaction to buy product 1 or product 2
  2. View the details of the notary signPayload request made in the background
  3. Get the transaction status of that transaction
  4. Refund any of the latest five transactions
  5. View the latest five notifications. 

To make a new transaction request, the app uses the Notary app in the background
to sign the payload first.

This file describes how to set up, configure and run the VB Applications of the
AT&T API Platform sample applications. It covers all steps required to register
the application on developer site and, based on the generated API keys and secrets, 
create and run one's own full-fledged sample applications.

  1. Configuration
  2. Installation
  3. Parameters
  4. Running the application


1. Configuration

  Configuration consists of a few steps necessary to get an application registered
  on developer site with the proper services and endpoints, depending on the type of
  client-side application (autonomous/non-autonomous). 

  To register an application, go to https://developer.att.com/ and login with
  your valid username and password. Next, choose "My Apps" from the bar at the top
  of the page and click the "Setup a New Application" button. 

  Fill in the form, in particular all fields marked as "required".

  Be careful while filling in the "OAuth Redirect URL" field. It should contain the
  URL that the oAuth provider will redirect users to when he/she successfully
  authenticates and authorizes your application.

NOTE: You MUST select Payment in the list of services under field 'Services' in
order to use this sample application code. 

  Having your application registered, you will get back an important pair of data:
  an API key and Secret key. They are necessary to get your applications working
  with the AT&T platform APIs. 

  Initially your newly registered application is restricted to the "Sandbox"
  environment only. To move it to production, you may promote it by clicking the
  "Promote to production" button. Notice that you will get a different API key and
  secret, so these values in your application should be adjusted accordingly.

  Depending on the kind of authentication used, an application may be based on
  either the Autonomous Client or the Web-Server Client OAuth flow.



2. Installation

** Requirements

   To run the examples you need an IIS Server. 

   Download the application files from the download link published in AT&T portal
   into webdomain of your IIS server.



3. Parameters

  Each sample application contains an web.config file. This file
  is located in the 'app' folder. This file holds configurable
  parameters described in an easy-to-read format. Please modify the
  web.config file using the comments specified within the file. 

  Note: If your application is promoted from Sandbox environment to Production
  environment and you decide to use production application settings, you must
  update parameters as per production application details.



4. Running the application

Suppose you copied the sample app files in your IIS server webroot/payment/app1/ folder.
In order to run the sample application, type in
'http://IIS_HOSTNAME:8080/payment/app1/Default.aspx'(assuming you're using a HOSTNAME
machine with IIS Server and have not changed the default port number, otherwise adjust
accordingly) on your browser.
