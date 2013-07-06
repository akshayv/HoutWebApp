package com.hout.external;

import javax.servlet.http.*;
import javax.servlet.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.net.URL;

public class Communication extends HttpServlet {
    static String baseUrl = "http://hout-houtcom.rhcloud.com/rest/hout/";
    private String apiKey = "akshay";
    public static enum MethodName {CREATE_MEETUP,  GET_MEETUPS};

    @Override
    protected void service(HttpServletRequest request,
                           HttpServletResponse response) throws ServletException, IOException, MalformedURLException {

        MethodName methodName = MethodName.valueOf(request.getParameter("methodName").toUpperCase());
        StringBuilder urlBuilder = new StringBuilder().append(baseUrl);

        switch (methodName) {
            case CREATE_MEETUP:
                urlBuilder.append("createMeetup?");

                break;
            case GET_MEETUPS:
                urlBuilder.append("getMeetups?");
                break;
        }
        urlBuilder.append("userId=1");
        urlBuilder.append("&").append("apiKey=").append(apiKey);
        urlBuilder.append("&").append(request.getQueryString());

        URL url = new URL(urlBuilder.toString());

        try {
            String result = convertStreamToString(url.openConnection()
                    .getInputStream());

            response.setContentType("application/json;charset=\"UTF-8\"");
            PrintWriter out = response.getWriter();
            out.println(result);
            out.flush();
        } catch (Throwable ignored) {

        }

    }
    private static String convertStreamToString(java.io.InputStream is) {
        try {
            return new java.util.Scanner(is).useDelimiter("\\A").next();
        } catch (java.util.NoSuchElementException e) {
            return "";
        }
    }

}