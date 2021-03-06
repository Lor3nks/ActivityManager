package formatter;

import java.text.ParseException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.Locale;

import org.springframework.format.Formatter;

public class LocalDateFormatter implements Formatter<LocalDate> {

    private DateTimeFormatter dateFormatter;
    private String datePattern;

    public LocalDateFormatter(String datePattern) {
        this.datePattern = datePattern;
        dateFormatter = DateTimeFormatter.ofPattern(datePattern);
    }

    @Override
    public String print(LocalDate date, Locale locale) {
        System.out.println(date.format(dateFormatter));
        return date.format(dateFormatter);
    }

    @Override
    public LocalDate parse(String s, Locale locale) throws ParseException {
        System.out.println("formatter.parse. s:" + s + ", pattern:" + datePattern);
        try {
            return LocalDate.parse(s, DateTimeFormatter.ofPattern(datePattern));
        } catch (DateTimeParseException e) {
            // the error message will be displayed in <form:errors>
            throw new IllegalArgumentException(
                    "Formato della data non valido. Inserisci la data secondo il formato\""
                            + datePattern + "\"");
        }
    }   
}