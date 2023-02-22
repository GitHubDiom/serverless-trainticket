
import com.openfaas.function.repository.PriceConfigRepository;
import com.openfaas.function.repository.PriceConfigRepositoryImpl;
import com.google.gson.JsonObject;
import com.google.gson.Gson;


public class Handler {

    private static PriceConfigRepository priceConfigRepository = new PriceConfigRepositoryImpl();

    public static JsonObject main(JsonObject args) {                
        JsonObject res = new JsonObject();

        if (priceConfigRepository.init()) {
            res.addProperty("body", "Success");
        } else res.addProperty("body", "Fail");


        return res;
    }
}
