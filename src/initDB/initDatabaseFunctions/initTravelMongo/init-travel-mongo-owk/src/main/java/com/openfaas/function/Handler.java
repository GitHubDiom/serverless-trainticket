
import com.openfaas.function.repository.TripRepository;
import com.openfaas.function.repository.TripRepositoryImpl;
import com.google.gson.JsonObject;
import com.google.gson.Gson;


public class Handler {

    private static TripRepository tripRepository = new TripRepositoryImpl();

    public static JsonObject main(JsonObject args) {                
        JsonObject res = new JsonObject();

        if (tripRepository.init()) {
            res.addProperty("body", "Success");
        } else res.addProperty("body", "Fail");


        return res;
    }
}
