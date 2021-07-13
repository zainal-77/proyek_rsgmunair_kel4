package rsgm_unair.proyek_webapps_kel4.LaboratoriumManagement;

import java.util.*;
import org.json.*;

import lombok.AccessLevel;
import lombok.Setter;
import lombok.Data;
import lombok.ToString;


@Data public class PagingAntri{

    private List<JSONObject> resultList;
    private int totalResults;
    private int resultTo;
    private int resultFrom;
    private boolean hasNext;
    private boolean hasPrevious;
    private int previousOffset;
    private int nextOffset;

}