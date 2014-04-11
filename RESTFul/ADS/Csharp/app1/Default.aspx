﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Ad_App1" %>

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
    <title>AT&amp;T Sample Application - Advertisement</title>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type" />
    <meta id="viewport" name="viewport" content="width=device-width,minimum-scale=1,maximum-scale=1" />
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
<body onload="setup()">
    <form id="form1" runat="server">
    <div id="pageContainer">
        <div id="header">
            <div class="logo">
            </div>
            <div id="menuButton" class="hide">
                <a id="jump" href="#nav">Main Navigation</a></div>
            <ul class="links" id="nav">                
                <li><a runat="server" target="_blank" id="SourceLink">Source<img alt="source" src="images/opensource.png" /></a>
                    <span class="divider">|&nbsp;</span> </li>
                <li><a runat="server" target="_blank" id="DownloadLink">Download<img alt="download"
                    src="images/download.png" /></a> <span class="divider">|&nbsp;</span> </li>
                <li><a runat="server" target="_blank" id="HelpLink">Help</a> </li>
                <li id="back"><a href="#top">Back to top</a></li>
            </ul>
            <!-- end of links -->
        </div>
        <!-- end of header -->
        <div id="content">
            <div id="contentHeading">
                <h1>
                    AT&amp;T Sample Application - Advertisement</h1>
                <div class="border">
                </div>
                <div id="introtext">
                    <div>
                        <b>Server Time:&nbsp;</b><%= String.Format("{0:ddd, MMMM dd, yyyy HH:mm:ss}", DateTime.UtcNow) + " UTC" %></div>
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
                <!-- end of introtext -->
            </div>
            <!-- end of contentHeading -->
            <div class="formBox" id="formBox">
                <div id="formContainer" class="formContainer">
                    <h2>
                        Feature 1: Get Advertisement</h2>
                    <div id="getAds">
                        <label>
                            Category</label>
                        <select name="category" id="category" runat="server">
                            <option value="auto" selected="selected">auto</option>
                            <option value="business">business</option>
                            <option value="chat">chat</option>
                            <option value="communication">communication</option>
                            <option value="community">community</option>
                            <option value="entertainment">entertainment</option>
                            <option value="finance">finance</option>
                            <option value="games">games</option>
                            <option value="health">health</option>
                            <option value="local">local</option>
                            <option value="maps">maps</option>
                            <option value="medical">medical</option>
                            <option value="movies">movies</option>
                            <option value="music">music</option>
                            <option value="news">news</option>
                            <option value="other">other</option>
                            <option value="personals">personals</option>
                            <option value="photos">photos</option>
                            <option value="shopping">shopping</option>
                            <option value="social">social</option>
                            <option value="sports">sports</option>
                            <option value="technology">technology</option>
                            <option value="tools">tools</option>
                            <option value="travel">travel</option>
                            <option value="tv">tv</option>
                            <option value="video">video</option>
                            <option value="weather">weather</option>
                        </select>
                        <div class="inputSeperator">
                        </div>
                        <label>
                            MMA Size:</label>
                        <select name="MMA" id="MMA" runat="server">
                            <option value=""></option>
                            <option value="120 x 20">120 x 20</option>
                            <option value="168 x 28">168 x 28</option>
                            <option value="216 x 36">216 x 36</option>
                            <option value="300 x 50">300 x 50</option>
                            <option value="300 x 250">300 x 250</option>
                            <option value="320 x 50">320 x 50</option>
                        </select>
                        <div class="inputSeperator">
                        </div>
                        <label>
                            Age Group:</label>
                        <select name="ageGroup" id="ageGroup" runat="server">
                            <option value="" selected="selected"></option>
                            <option value="1-13">1-13</option>
                            <option value="14-25" >14-25</option>
                            <option value="26-35">26-35</option>
                            <option value="36-55">36-55</option>
                            <option value="55-100">55-100</option>
                        </select>
                        <div class="inputSeperator">
                        </div>
                        <label>
                            Premium:</label>
                        <select name="Premium" id="Premium" runat="server">
                            <option value=""></option>
                            <option value="0">NonPremium</option>
                            <option value="1">Premium Only</option>
                            <option value="2">Both</option>
                        </select>
                        <div class="inputSeperator">
                        </div>
                        <label>
                            Gender:</label>
                        <select name="gender" id="gender" runat="server">
                            <option value="" selected="selected"></option>
                            <option value="M">Male</option>
                            <option value="F">Female</option>
                        </select>
                        <div class="inputSeperator">
                        </div>
                        <label>
                            Over 18 Ad Content:</label>
                        <select name="over18" id="over18" runat="server">
                            <option value=""></option>
                            <option value="0">Deny Over 18</option>
                            <option value="2">Only Over 18</option>
                            <option value="3">Allow All Ads</option>
                        </select>
                        <div class="inputSeperator">
                        </div>
                        <label>
                            Zip Code:&nbsp;</label><input runat="server" placeholder="Zip Code" type="text" id="zipCode"
                                name="zipCode" />
                        <div class="inputSeperator">
                        </div>
                        <label>
                            City:&nbsp;</label><input runat="server" placeholder="City" type="text" id="city"
                                name="city" />
                        <div class="inputSeperator">
                        </div>
                        <label>
                            Area Code:&nbsp;</label><input runat="server" placeholder="Area Code" type="text"
                                id="areaCode" name="areaCode" />
                        <div class="inputSeperator">
                        </div>
                        <label>
                            Country:&nbsp;</label><input runat="server" placeholder="Country" type="text" id="country"
                                name="country" />
                        <div class="inputSeperator">
                        </div>
                        <label>
                            Latitude:&nbsp;</label><input runat="server" placeholder="Latitude" type="text" id="latitude"
                                name="latitude" />
                        <div class="inputSeperator">
                        </div>
                        <label>
                            Longitude:&nbsp;</label><input runat="server" placeholder="Longitude" type="text"
                                id="longitude" name="longitude" />
                        <div class="inputSeperator">
                        </div>
                        <label>
                            Keywords:&nbsp;</label><input runat="server" placeholder="Keywords" type="text" id="keywords"
                                name="keywords" />
                        <div class="inputSeperator">
                        </div>
                        <button type="submit" name="btnGetAds" runat="server" onserverclick="BtnGetADS_Click">
                            Get Advertisement</button>
                    </div>
                    <!-- end of getAds -->
                    <% if (!string.IsNullOrEmpty(getAdsSuccessResponse))
                       { %>
                    <div class="successWide">
                        <strong>SUCCESS:</strong><br /><%= getAdsSuccessResponse%>
                    </div>
                    <% if (adRequestResponse != null && adRequestResponse.AdsResponse != null && adRequestResponse.AdsResponse.Ads != null)
                       { %>
                       <table class="kvp" id="kvp">
                        <thead>
                            <tr>
                                <th>
                                    Parameter
                                </th>
                                <th>
                                    Value
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <% if (!string.IsNullOrEmpty(adRequestResponse.AdsResponse.Ads.Type))
                               {%>
                            <tr>
                                <td data-value="Parameter">
                                    Type
                                </td>
                                <td data-value="Value">
                                    <%= adRequestResponse.AdsResponse.Ads.Type%>
                                </td>
                            </tr>
                            <% } %>
                            <% if (!string.IsNullOrEmpty(adRequestResponse.AdsResponse.Ads.ClickUrl))
                               {%>
                            <tr>
                                <td data-value="Parameter">
                                    ClickUrl
                                </td>
                                <td data-value="Value">
                                    <%= adRequestResponse.AdsResponse.Ads.ClickUrl%>
                                </td>
                            </tr>
                            <% } %>

                            <% if ( adRequestResponse.AdsResponse.Ads.ImageUrl != null && !string.IsNullOrEmpty(adRequestResponse.AdsResponse.Ads.ImageUrl.Image))
                               {%>
                            <tr>
                                <td data-value="Parameter">
                                    ImageUrl
                                </td>
                                <td data-value="Value">
                                    <%= adRequestResponse.AdsResponse.Ads.ImageUrl.Image %>
                                </td>
                            </tr>
                            <% } %>

                            <% if (!string.IsNullOrEmpty(adRequestResponse.AdsResponse.Ads.Text))
                               {%>
                            <tr>
                                <td data-value="Parameter">
                                    Text
                                </td>
                                <td data-value="Value">
                                    <%= adRequestResponse.AdsResponse.Ads.Text %>
                                </td>
                            </tr>
                            <% } %>

                            <% if (!string.IsNullOrEmpty(adRequestResponse.AdsResponse.Ads.Content))
                               {%>
                            <tr>
                                <td data-value="Parameter">
                                    Content
                                </td>
                                <td data-value="Value">
                                    <%= adRequestResponse.AdsResponse.Ads.Content %>
                                </td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                    <%if ( ((adRequestResponse.AdsResponse.Ads.ImageUrl != null) &&
                           (!string.IsNullOrEmpty(adRequestResponse.AdsResponse.Ads.ImageUrl.Image))) ||
                          !string.IsNullOrEmpty(adRequestResponse.AdsResponse.Ads.Text))
                      {%>
                    <asp:HyperLink ID="hplImage" runat="server" Target="_blank"></asp:HyperLink>
                    <%} %>
                    <%} %>
                    <%} %>
                    <% if (!string.IsNullOrEmpty(getAdsErrorResponse))
                       { %>
                    <div class="errorWide">
                        <strong>ERROR:</strong>
                        <br />
                        <%=getAdsErrorResponse%>
                    </div>
                    <% } %>
                    <!-- SAMPLE APP CONTENT ENDS HERE! -->
                </div>
                <!-- end of formContainer -->
            </div>
            <!-- end of formBox -->
        </div>
        <!-- end of content -->
        <!-- end of formBox -->
        <!-- end of content -->
        <div class="border">
        </div>
        <div id="footer">
            <div id="powered_by">
                Powered by AT&amp;T Cloud Architecture</div>
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
                &copy; 2014 AT&amp;T Intellectual Property. All rights reserved. <a href="https://developer.att.com/"
                    target="_blank">https://developer.att.com</a>
            </p>
        </div>
        <!-- end of footer -->
    </div>
    <!-- end of page_container -->
    </form>
</body>
</html>
