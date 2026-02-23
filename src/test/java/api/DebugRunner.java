package api;

import com.intuit.karate.junit5.Karate;

public class DebugRunner {

    @Karate.Test
    Karate debugRunner(){
        return Karate.run("api").tags("debug").relativeTo(getClass());
    }

}
