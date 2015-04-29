package com.att.api.mms.controller;

import java.io.BufferedReader;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.att.api.mms.model.MMSDeliveryInfo;
import com.att.api.mms.service.MMSFileUtil;

public class MMSStatusListener extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void doPost(HttpServletRequest request, 
            HttpServletResponse response) {
        try {
            StringBuilder sb = new StringBuilder();
            BufferedReader bReader = request.getReader();
            String line;
            while ((line = bReader.readLine()) != null) {
                sb.append(line);
            }

            final String contentBody = sb.toString();
            JSONObject jobj = new JSONObject(contentBody);
            JSONObject dInfoNotification 
                = jobj.getJSONObject("deliveryInfoNotification");
            JSONObject dInfo = dInfoNotification.getJSONObject("deliveryInfo");

            String address =
                dInfo.getString("address").replaceFirst("...$", "***");
            MMSDeliveryInfo info = new MMSDeliveryInfo
                (
                 dInfoNotification.getString("messageId"),
                 address,
                 dInfo.getString("deliveryStatus")
                );

            MMSFileUtil.addStatus(info);

        } catch (Exception e) {
            // log error
            e.printStackTrace();
        }
    }     

    public void doGet(HttpServletRequest request, 
            HttpServletResponse response) {
        // Accept only POST requests
        return;
    }
}

