package api;

import com.intuit.karate.junit5.Karate;

public class RegresionRunner {

    @Karate.Test
    Karate regresionRunner() {
        return Karate.run("api").tags("regresion").relativeTo(getClass());
    }

}
