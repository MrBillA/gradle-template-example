package com.edify.web.support.i18n;

import org.springframework.context.support.ReloadableResourceBundleMessageSource;

import java.util.Locale;
import java.util.Properties;

/**
 * This CustomReloadableResourceBundleMessageSource allows us to get all the properties form i18n bundle
 * <p/>
 * This is useful for {@link TranslationsController}
 *
 * @author <a href="https://github.com/jarias">jarias</a>
 */
public class CustomReloadableResourceBundleMessageSource extends ReloadableResourceBundleMessageSource {
    public Properties getAllProperties(Locale locale) {
        return this.getMergedProperties(locale).getProperties();
    }
}
