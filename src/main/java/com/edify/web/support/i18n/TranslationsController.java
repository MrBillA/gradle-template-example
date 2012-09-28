package com.edify.web.support.i18n;

import com.google.common.collect.Iterables;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

/**
 * This controller serves all i18n properties via JSON to i18next so we can have internationalized strings inside
 * Javascript.
 *
 * @author <a href="https://github.com/jarias">jarias</a>
 */
@Controller
public class TranslationsController {
    @Autowired
    MessageSource messageSource;

    @RequestMapping(value = "/translations/{lang}/{ns}.json")
    @ResponseBody
    public Map<String, Object> translations(@PathVariable("lang") String lang, @PathVariable("ns") String ns) {
        Map<String, Object> t = new HashMap<String, Object>();

        Properties properties = ((CustomReloadableResourceBundleMessageSource) messageSource).getAllProperties(new Locale(lang));
        for (Object key : properties.keySet()) {
            Map<String, Object> m = t;
            List<String> keys = Arrays.asList(((String) key).split("\\."));
            for (String k : keys) {
                if (Iterables.getLast(keys).equals(k)) {
                    String value = i18nextProperValue(properties.getProperty((String) key));
                    m.put(k, StringUtils.isNotEmpty(value) ? value : " ");
                } else {
                    m.put(k, m.get(k) != null ? m.get(k) : new HashMap<String, String>());
                    m = (Map<String, Object>) m.get(k);
                }
            }
        }

        return t;
    }

    private String i18nextProperValue(String value) {
        return value.replaceAll("\\{([0-9])\\}", "__$1__");
    }
}
