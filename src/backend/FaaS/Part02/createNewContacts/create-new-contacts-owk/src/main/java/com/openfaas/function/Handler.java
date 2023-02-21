// package com.openfaas.function;

import com.openfaas.function.entity.Contacts;
import com.openfaas.function.service.ContactsService;
import com.openfaas.function.service.ContactsServiceImpl;
import com.google.gson.JsonObject;
import com.google.gson.Gson;
import edu.fudan.common.util.JsonUtils;
import edu.fudan.common.util.mResponse;

import java.util.UUID;

public class Handler {

    private static ContactsService contactsService = new ContactsServiceImpl();

    public static JsonObject main(JsonObject args) {
        long startTime=System.currentTimeMillis(); 
        JsonObject res = new JsonObject();
        // res.setHeader("Access-Control-Allow-Origin", "*");
        // res.setHeader("Access-Control-Allow-Methods", "POST");
        // res.setHeader("Access-Control-Allow-Headers", "x-requested-with,Authorization,content-type");

        try {
            Gson gson = new Gson();
            // There must some way to avoid these hard-code things.
            // But I dont care ...
            args.remove("__ow_headers");
            args.remove("__ow_path");
            args.remove("__ow_method");
    
            String requestBody = gson.toJson(args);
            System.out.println("RequestBody: "+requestBody);

            Contacts aci = JsonUtils.json2Object(requestBody, Contacts.class);
            mResponse mRes = contactsService.create(aci);

            res = gson.fromJson(JsonUtils.object2Json(mRes), JsonObject.class);
            long duration = System.currentTimeMillis() - startTime;
            System.out.println("FunctionLog: createNewContacts,"+requestBody.hashCode()+","+JsonUtils.object2Json(mRes).hashCode()+","+duration);
        } catch (Exception e) {
            e.printStackTrace();
        }
	    return res;
    }
}
