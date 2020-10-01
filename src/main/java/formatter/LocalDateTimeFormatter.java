package formatter;

import java.text.ParseException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.Locale;

import org.springframework.format.Formatter;

public class LocalDateTimeFormatter implements Formatter<LocalDateTime> {

    private DateTimeFormatter dateTimeformatter;
    private String timePattern;

    public LocalDateTimeFormatter(String timePattern) {
        this.timePattern = timePattern;
        dateTimeformatter = DateTimeFormatter.ofPattern(timePattern);
    }

    @Override
    public String print(LocalDateTime date, Locale locale) {
        System.out.println(date.format(dateTimeformatter));
        return date.format(dateTimeformatter);
    }

    @Override
    public LocalDateTime parse(String s, Locale locale) throws ParseException {
        System.out.println("formatter.parse. s:" + s + ", pattern:" + timePattern);
        try {
            return LocalDateTime.parse(s, DateTimeFormatter.ofPattern(timePattern));
        } catch (DateTimeParseException e) {
            // the error message will be displayed in <form:errors>
            throw new IllegalArgumentException(
                    "Formato dell'ora non valido. Inserisci l'ora secondo il formato\""
                            + timePattern + "\"");
        }
    }   
}