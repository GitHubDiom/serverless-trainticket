
import com.openfaas.function.entity.Seat;
import com.openfaas.function.service.SeatService;
import com.openfaas.function.service.SeatServiceImpl;

import com.google.gson.JsonObject;
import com.google.gson.Gson;

import edu.fudan.common.util.JsonUtils;
import edu.fudan.common.util.mResponse;


/**
 * function8 getLeftTicketOfInterval
 * <p>
 * get left tickets in an interval
 * Http Method : POST
 * <p>
 * 原API地址： "http://ts-seat-service:18898/api/v1/seatservice/seats/left_tickets"
 * <p>
 * 输入：(Object)Seat
 * 输出：(int)numOfLeftTicket
 */

 public class Handler {
    private static SeatService seatService = new SeatServiceImpl();

    public static JsonObject main(JsonObject args) {                
        long startTime = System.currentTimeMillis(); 
        Gson gson = new Gson();
        // There must some way to avoid these hard-code things.
        // But I dont care ...
        args.remove("__ow_headers");
        args.remove("__ow_path");
        args.remove("__ow_method");

        String requestBody = gson.toJson(args);
        System.out.println("RequestBody: "+requestBody);

        Seat seatRequest = JsonUtils.json2Object(requestBody, Seat.class);
        mResponse mRes = seatService.getLeftTicketOfInterval(seatRequest);

        JsonObject res = gson.fromJson(JsonUtils.object2Json(mRes), JsonObject.class);

        long duration = System.currentTimeMillis() - startTime; 
        System.out.println("FunctionLog: getLeftTicketOfInterval,"+requestBody.hashCode()+","+JsonUtils.object2Json(mRes).hashCode()+","+duration);
        return res;
    }
}
