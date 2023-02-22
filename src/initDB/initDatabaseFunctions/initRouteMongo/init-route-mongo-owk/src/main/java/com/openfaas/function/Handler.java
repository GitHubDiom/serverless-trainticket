
import com.openfaas.function.repository.RouteRepository;
import com.openfaas.function.repository.RouteRepositoryImpl;
import com.google.gson.JsonObject;
import com.google.gson.Gson;



public class Handler {

    private static RouteRepository routeRepository = new RouteRepositoryImpl();

    public static JsonObject main(JsonObject args) {                
        JsonObject res = new JsonObject();

        if (routeRepository.init()) {
            res.addProperty("body", "Success");
        } else res.addProperty("body", "Fail");


        return res;
    }
}
