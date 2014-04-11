﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Speech_App1" %>

<!DOCTYPE html>
<!-- 
Licensed by AT&T under 'Software Development Kit Tools Agreement.' 2013
TERMS AND CONDITIONS FOR USE, REPRODUCTION, AND DISTRIBUTION: http://developer.att.com/sdk_agreement/
Copyright 2013 AT&T Intellectual Property. All rights reserved. http://developer.att.com
For more information contact developer.support@att.com
-->
<!--[if lt IE 7]> <html class="ie6" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="ie7" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="ie8" lang="en"> <![endif]-->
<!--[if gt IE 8]><!-->
<html lang="en">
<!--<![endif]-->
<head>
    <title>AT&amp;T Sample Speech Application - Speech to Text (Generic) </title>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type" />
    <meta id="viewport" name="viewport" content="width=device-width,minimum-scale=1,maximum-scale=1" />
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" type="text/css" href="style/common.css" />
    <script type="text/javascript">
        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-33466541-1']);
        _gaq.push(['_trackPageview']);

        (function () {
            var ga = document.createElement('script');
            ga.type = 'text/javascript';
            ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl'
                                      : 'http://www')
                                      + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0];
            s.parentNode.insertBefore(ga, s);
        })();
    </script>
</head>
<body>
    <div id="pageContainer" class="pageContainer">
        <div id="header">
            <div class="logo" id="top">
            </div>
            <div id="menuButton" class="hide">
                <a id="jump" href="#nav">Main Navigation</a>
            </div>
            <ul class="links" id="nav">
                
                <li><a id="SourceLink" runat="server" target="_blank">Source<img src="images/source.png"
                    alt="" />
                </a><span class="divider">|&nbsp;</span> </li>
                <li><a id="DownloadLink" runat="server" target="_blank">Download<img src="images/download.png"
                    alt="" />
                </a><span class="divider">|&nbsp;</span> </li>
                <li><a id="HelpLink" runat="server" target="_blank">Help </a></li>
                <li id="back"><a href="#top">Back to top</a></li>
            </ul>
        </div>
        <form id="form1" runat="server">
        <div class="content">
            <div class="contentHeading">
                <h1>
                    AT&amp;T Sample Application - Speech to Text</h1>
                <div id="introtext">
                    <div>
                        <b>Server Time:&nbsp;</b><%= String.Format("{0:ddd, MMMM dd, yyyy HH:mm:ss}", DateTime.UtcNow) + " UTC" %>
                    </div>
                    <div>
                        <b>Client Time:</b>
                        <script language="JavaScript" type="text/javascript">
                            var myDate = new Date();
                            document.write(myDate);
                        </script>
                    </div>
                    <div>
                        <b>User Agent:</b>
                        <script language="JavaScript" type="text/javascript">
                            document.write("" + navigator.userAgent);
                        </script>
                    </div>
                </div>
            </div>
            <div class="formBox" id="formBox">
                <div id="formContainer" class="formContainer">
                    <div id="formData">
                        <h3>
                            Speech Context:
                        </h3>
                        <asp:DropDownList ID="SpeechContext" runat="server" AutoPostBack="true">
                        </asp:DropDownList>
                        <h3>
                            Audio File:
                        </h3>
                        <asp:DropDownList ID="audio_file" runat="server">
                        </asp:DropDownList>
                        <br />
                        <div id="chunked">
                            <b>Send Chunked:</b>
                            <asp:CheckBox ID="chkChunked" runat="server" />
                        </div>
                        <h3>
                            X-Arg:
                        </h3>
                        <asp:TextBox ID="x_arg" type="text" runat="server" TextMode="MultiLine" Enabled="False" Rows="4" name="x_arg"></asp:TextBox>
                        <br />
                        <h3>X-SpeechSubContext</h3>
                        <asp:TextBox ID="x_subContext" type="text" runat="server" TextMode="MultiLine" Enabled="False" Rows="4" name="x_subContext"></asp:TextBox>
                        <br />
                        <button id="btnSubmit" onserverclick="BtnSubmit_Click" runat="server" name="SpeechToText"
                            type="submit">
                            Submit</button>
                    </div>
                </div>
            </div>
            <br clear="all" />
          <% if (!string.IsNullOrEmpty (speechSuccessMessage)){ %>
            <div class="successWide" align="left">
              <strong>SUCCESS:</strong>
              <br />
              Response parameters listed below.
            </div>
            <table class="kvp">
              <thead>
                <tr>
                  <th class="label">Parameter</th>
                  <th class="label">Value</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td class="cell" align="center"><em>ResponseId</em></td>
                  <td class="cell" align="center"><em><%= speechResponseData.Recognition.ResponseId %></em></td>
                </tr>
                <tr>
                  <td class="cell" align="center"><em>Status</em></td>
                  <td class="cell" align="center"><em><%= speechResponseData.Recognition.Status %></em></td>
                </tr>
                <%
                  if ((speechResponseData.Recognition.NBest != null) && (speechResponseData.Recognition.NBest.Count > 0)) {
                   foreach (NBest nbest in speechResponseData.Recognition.NBest){  %>
                      <tr>
                        <td class="cell" align="center"><em>Hypothesis</em></td>
                        <td class="cell" align="center"><em><%= nbest.Hypothesis %></em></td>
                      </tr>
                      <tr>
                        <td class="cell" align="center"><em>LanguageId</em></td>
                        <td class="cell" align="center"><em><%= nbest.LanguageId%></em></td>
                      </tr>
                      <tr>
                        <td class="cell" align="center"><em>Confidence</em></td>
                        <td class="cell" align="center"><em><%= nbest.Confidence  %></em></td>
                      </tr>
                      <tr>
                        <td class="cell" align="center"><em>Grade</em></td>
                        <td class="cell" align="center"><em><%= nbest.Grade  %></em></td>
                      </tr>
                      <tr>
                        <td class="cell" align="center"><em>ResultText</em></td>
                        <td class="cell" align="center"><em><%= nbest.ResultText %></em></td>
                      </tr>
                      <tr>
                        <td class="cell" align="center"><em>Words</em></td>
                        <td class="cell" align="center"><em><%= string.Join(", ", nbest.Words.ToArray())%></em></td>
                      </tr>
                      <tr>
                        <td class="cell" align="center"><em>WordScores</em></td>
                        <td class="cell" align="center"><em><%= string.Join(", ", nbest.WordScores.ToArray())%></em></td>
                      </tr>
                      <% } %>
                      <% if (speechResponseData.Recognition.Info != null)
                         {
                             if (!string.IsNullOrEmpty(speechResponseData.Recognition.Info.version))
                             {
                            %>
                             <tr>
                                <td class="cell" align="center"><em>version</em></td>
                                <td class="cell" align="center"><em><%= speechResponseData.Recognition.Info.version%></em></td>
                            </tr>
                            <%} %>
                            <% if (!string.IsNullOrEmpty(speechResponseData.Recognition.Info.actionType))
                             {
                            %>
                             <tr>
                                <td class="cell" align="center"><em>actionType</em></td>
                                <td class="cell" align="center"><em><%= speechResponseData.Recognition.Info.actionType%></em></td>
                            </tr>
                            <%} %>
                            <% int count = 0; 
                               if ( speechResponseData.Recognition.Info.metrics != null) {
                               foreach (KeyValuePair<string, string> keyitem in speechResponseData.Recognition.Info.metrics)
                               {
                                   if (count == 0)
                                   {%>
                                        <tr>
                                            <td class="cell" align="center"><em>metrics</em></td>
                                            <td class="cell" align="center"><em></em></td>
                                        </tr> 
                                        <%}%>                              
                            <tr>
                                <td class="cell" align="center"><em><%=keyitem.Key%></em></td>
                                <td class="cell" align="center"><em><%=keyitem.Value%></em></td>
                            </tr>
                            <%count++;
                               } count = 0;}%>
                            <% if ( speechResponseData.Recognition.Info.interpretation != null) {
                               foreach (KeyValuePair<string, string> keyitem in speechResponseData.Recognition.Info.interpretation)
                               {
                                   if (count == 0)
                                   {%>
                                        <tr>
                                            <td class="cell" align="center"><em>interpretation</em></td>
                                            <td class="cell" align="center"><em></em></td>
                                        </tr> 
                                        <%}%>                              
                            <tr>
                                <td class="cell" align="center"><em><%=keyitem.Key%></em></td>
                                <td class="cell" align="center"><em><%=keyitem.Value%></em></td>
                            </tr>
                            <%count++;
                               } count = 0;}%>
                            <% if (!string.IsNullOrEmpty(speechResponseData.Recognition.Info.recognized))
                             {
                            %>
                             <tr>
                                <td class="cell" align="center"><em>recognized</em></td>
                                <td class="cell" align="center"><em><%= speechResponseData.Recognition.Info.recognized%></em></td>
                            </tr>
                            <%} %>
                            <% if (speechResponseData.Recognition.Info.search != null)
                               {
								   if ( speechResponseData.Recognition.Info.search.meta != null) {
                                   foreach (KeyValuePair<string, string> keyitem in speechResponseData.Recognition.Info.search.meta)
                                   {
                                       if (count == 0)
                                       {%>
                                        <tr>
                                            <td class="cell" align="center"><em>meta</em></td>
                                            <td class="cell" align="center"><em></em></td>
                                        </tr> 
                                        <%}%>                              
                            <tr>
                                <td class="cell" align="center"><em><%=keyitem.Key%></em></td>
                                <td class="cell" align="center"><em><%=keyitem.Value%></em></td>
                            </tr>
                            <%count++;
                                   } count = 0;}%>
									
                                   <% if ( speechResponseData.Recognition.Info.search.programs != null) {
                                   foreach (KeyValuePair<string, string> keyitem in speechResponseData.Recognition.Info.search.programs)
                                   {
                                       if (count == 0)
                                       {%>
                                        <tr>
                                            <td class="cell" align="center"><em>programs</em></td>
                                            <td class="cell" align="center"><em></em></td>
                                        </tr> 
                                        <%}%>                              
                            <tr>
                                <td class="cell" align="center"><em><%=keyitem.Key%></em></td>
                                <td class="cell" align="center"><em><%=keyitem.Value%></em></td>
                            </tr>
                            <%count++;
                                   } count = 0;}%>

                                   <% if ( speechResponseData.Recognition.Info.search.showTimes != null) {
                                   foreach (KeyValuePair<string, string> keyitem in speechResponseData.Recognition.Info.search.showTimes)
                                   {
                                       if (count == 0)
                                       {%>
                                        <tr>
                                            <td class="cell" align="center"><em>showTimes</em></td>
                                            <td class="cell" align="center"><em></em></td>
                                        </tr> 
                                        <%}%>                              
                            <tr>
                                <td class="cell" align="center"><em><%=keyitem.Key%></em></td>
                                <td class="cell" align="center"><em><%=keyitem.Value%></em></td>
                            </tr>
                            <%count++;
                                   } count = 0;}%>

                               <%} %>

                        <%} %>
                      
                      <%} %>
                    </tbody>
                  </table>
                <% } %>
                <% if (!string.IsNullOrEmpty(speechErrorMessage)){ %>
                  <div class="errorWide">
                    <strong>ERROR:</strong>
                    <br />
                    <%= speechErrorMessage  %>
                  </div>
                <% } %>
        </div>
        </form>
        <div id="footer">
            <div id="ft">
                <div id="powered_by">
                    Powered by AT&amp;T Cloud Architecture
                </div>
                <p>
                    The Application hosted on this site are working examples intended to be used for
                    reference in creating products to consume AT&amp;T Services and not meant to be
                    used as part of your product. The data in these pages is for test purposes only
                    and intended only for use as a reference in how the services perform.
                    <br />
                    <br />
                    For download of tools and documentation, please go to <a href="https://developer.att.com/"
                        target="_blank">https://developer.att.com</a>
                    <br />
                    For more information contact <a href="mailto:developer.support@att.com">developer.support@att.com</a>
                    <br />
                    <br />
                    © 2014 AT&amp;T Intellectual Property. All rights reserved. <a href="https://developer.att.com/"
                        target="_blank">https://developer.att.com</a>
                </p>
            </div>
            <!-- end of ft -->
        </div>
        <!-- end of footer -->
    </div>
</body>
</html>
