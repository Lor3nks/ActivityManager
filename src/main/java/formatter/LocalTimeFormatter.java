package formatter;

import java.text.ParseException;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.Locale;

import org.springframework.format.Formatter;

public class LocalTimeFormatter implements Formatter<LocalTime> {

    private DateTimeFormatter dateTimeformatter;
    private String timePattern;

    public LocalTimeFormatter(String timePattern) {
        this.timePattern = timePattern;
        dateTimeformatter = DateTimeFormatter.ofPattern(timePattern);
    }

    @Override
    public String print(LocalTime date, Locale locale) {
        System.out.println(date.format(dateTimeformatter));
        return date.format(dateTimeformatter);
    }

    @Override
    public LocalTime parse(String s, Locale locale) throws ParseException {
        System.out.println("formatter.parse. s:" + s + ", pattern:" + timePattern);
        try {
            return LocalTime.parse(s, DateTimeFormatter.ofPattern(timePattern));
        } catch (DateTimeParseException e) {
            // the error message will be displayed in <form:errors>
            throw new IllegalArgumentException(
                    "Formato dell'ora non valido. Inserisci l'ora secondo il formato\""
                            + timePattern + "\"");
        }
    }   
}