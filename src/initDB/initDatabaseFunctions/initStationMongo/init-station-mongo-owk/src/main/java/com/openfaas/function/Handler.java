
import com.openfaas.function.repository.StationRepository;
import com.openfaas.function.repository.StationRepositoryImpl;
import com.google.gson.JsonObject;
import com.google.gson.Gson;

import edu.fudan.common.util.JsonUtils;
import edu.fudan.common.util.mResponse;


public class Handler {

    private static StationRepository stationRepository = new StationRepositoryImpl();

    public static JsonObject main(JsonObject args) {                
        JsonObject res = new JsonObject();

        if (stationRepository.init()) {
            res.addProperty("body", "Success");
        } else res.addProperty("body", "Fail");


        return res;
    }
}
