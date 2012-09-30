package com.edify.config;

import com.jolbox.bonecp.BoneCPDataSource;
import liquibase.integration.spring.SpringLiquibase;
import org.hibernate.ejb.HibernatePersistence;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.*;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.orm.jpa.JpaDialect;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaDialect;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.persistence.EntityManagerFactory;
import javax.persistence.spi.PersistenceProvider;
import javax.sql.DataSource;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Properties;

/**
 * @author jarias
 * @since 9/2/12 11:25 AM
 */
@Configuration
@ComponentScan(basePackages = "com.edify",
        excludeFilters = @ComponentScan.Filter(type = FilterType.ANNOTATION, value = Configuration.class))
@ImportResource({"classpath:META-INF/spring/applicationContext-security.xml",
        "classpath:META-INF/spring/applicationContext-repositories.xml"})
@EnableTransactionManagement(mode = AdviceMode.ASPECTJ)
public class ApplicationConfig {
    @Value("${DATABASE_URL}")
    private String databaseUrl;
    @Value("${DATABASE_DRIVER_CLASSNAME}")
    private String databaseDriverClassname;
    @Value("${DATABASE_USERNAME}")
    private String databaseUsername;
    @Value("${DATABASE_PASSWORD}")
    private String databasePassword;
    @Value("${HIBERNATE_DIALECT}")
    private String hibernateDialect;

    //DataSource properties
    @Value("${DATASOURCE_BONECP_IDLE_CONNECTION_TEST_PERIOD_IN_MINUTES}")
    private Integer idleConnectionTestPeriodInMinutes;
    @Value("${DATASOURCE_BONECP_IDLE_MAX_AGE_IN_MINUTES}")
    private Integer idleMaxAgeInMinutes;
    @Value("${DATASOURCE_BONECP_MAX_CONNECTIONS_PER_PARTITION}")
    private Integer maxConnectionsPerPartition;
    @Value("${DATASOURCE_BONECP_MIN_CONNECTIONS_PER_PARTITION}")
    private Integer minConnectionsPerPartition;
    @Value("${DATASOURCE_BONECP_PARTITION_COUNT}")
    private Integer partitionCount;
    @Value("${DATASOURCE_BONECP_ACQUIREINCREMENT}")
    private Integer acquireIncrement;
    @Value("${DATASOURCE_BONECP_STATEMENTS_CACHE_SIZE}")
    private Integer statementsCacheSize;
    @Value("${DATASOURCE_BONECP_RELEASE_HELPER_THREADS}")
    private Integer releaseHelperThreads;

    @Value("${MAIL_SMTP_HOST}")
    private String mailSMTPHost;
    @Value("${MAIL_SMTP_PORT}")
    private Integer mailSMTPPort;
    @Value("${MAIL_SMTP_AUTH}")
    private Boolean mailSMTPAuth;
    @Value("${MAIL_SMTP_USERNAME}")
    private String mailSMTPUsername;
    @Value("${MAIL_SMTP_PASSWORD}")
    private String mailSMTPPassword;

    @Bean
    static public PropertySourcesPlaceholderConfigurer placeholderConfigurer() throws IOException {
        PropertySourcesPlaceholderConfigurer p = new PropertySourcesPlaceholderConfigurer();
        PathMatchingResourcePatternResolver resourcePatternResolver = new PathMatchingResourcePatternResolver();
        p.setIgnoreResourceNotFound(true);
        List<Resource> resourceLocations = new ArrayList<Resource>();
        //Read from class path properties first
        resourceLocations.addAll(Arrays.asList(resourcePatternResolver.getResources("classpath*:META-INF/spring/*.properties")));
        //Read from a file location (user for servers)
        resourceLocations.addAll(Arrays.asList(resourcePatternResolver.getResources("file:/srv/config/*.properties")));
        //This resource allows developers to override any app property for their development environment
        resourceLocations.add(resourcePatternResolver.getResource(String.format("file:%s/.gradle/changeme.properties", System.getProperty("user.home"))));
        Resource[] resources = new Resource[resourceLocations.size()];
        p.setLocations(resourceLocations.toArray(resources));
        return p;
    }

    @Bean
    public DataSource dataSource() {
        BoneCPDataSource ds = new BoneCPDataSource();
        ds.setDriverClass(databaseDriverClassname);
        ds.setJdbcUrl(databaseUrl);
        ds.setUsername(databaseUsername);
        ds.setPassword(databasePassword);
        ds.setIdleConnectionTestPeriodInMinutes(idleConnectionTestPeriodInMinutes);
        ds.setIdleMaxAgeInMinutes(idleMaxAgeInMinutes);
        ds.setMaxConnectionsPerPartition(maxConnectionsPerPartition);
        ds.setMinConnectionsPerPartition(minConnectionsPerPartition);
        ds.setPartitionCount(partitionCount);
        ds.setAcquireIncrement(acquireIncrement);
        ds.setStatementsCacheSize(statementsCacheSize);
        ds.setReleaseHelperThreads(releaseHelperThreads);
        ds.setDefaultAutoCommit(false);
        return ds;
    }

    @Bean
    public PersistenceProvider persistenceProvider() {
        return new HibernatePersistence();
    }

    @Bean
    public JpaDialect jpaDialect() {
        return new HibernateJpaDialect();
    }

    @Bean(name = "entityManagerFactory")
    @DependsOn("liquibase")
    public EntityManagerFactory entityManagerFactory() {
        LocalContainerEntityManagerFactoryBean localContainerEntityManagerFactoryBean = new LocalContainerEntityManagerFactoryBean();
        localContainerEntityManagerFactoryBean.setDataSource(dataSource());
        localContainerEntityManagerFactoryBean.setPersistenceProvider(persistenceProvider());
        localContainerEntityManagerFactoryBean.setPackagesToScan("com.edify.model");
        localContainerEntityManagerFactoryBean.setJpaDialect(jpaDialect());
        Properties jpaProperties = new Properties();
        jpaProperties.setProperty("hibernate.dialect", hibernateDialect);
        jpaProperties.setProperty("hibernate.ejb.naming_strategy", "org.hibernate.cfg.ImprovedNamingStrategy");
        jpaProperties.setProperty("hibernate.connection.charSet", "UTF-8");
        jpaProperties.setProperty("hibernate.hbm2ddl.auto", "validate");
        localContainerEntityManagerFactoryBean.setJpaProperties(jpaProperties);
        localContainerEntityManagerFactoryBean.afterPropertiesSet();
        return localContainerEntityManagerFactoryBean.getObject();
    }

    @Bean(name = "transactionManager")
    public JpaTransactionManager transactionManager() {
        JpaTransactionManager transactionManager = new JpaTransactionManager();
        transactionManager.setEntityManagerFactory(entityManagerFactory());
        return transactionManager;
    }

    @Bean(name = "liquibase")
    public SpringLiquibase springLiquibase() {
        SpringLiquibase springLiquibase = new SpringLiquibase();
        springLiquibase.setDataSource(dataSource());
        springLiquibase.setChangeLog("classpath:db/changelog/db.changelog-master.xml");
        return springLiquibase;
    }

    @Bean(name = "mailSender")
    public JavaMailSenderImpl mailSender() {
        Properties javaMailProperties = new Properties();
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        mailSender.setHost(mailSMTPHost);
        mailSender.setPort(mailSMTPPort);
        if (mailSMTPAuth) {
            mailSender.setUsername(mailSMTPUsername);
            mailSender.setPassword(mailSMTPPassword);
            javaMailProperties.setProperty("mail.smtp.auth", "true");
        } else {
            javaMailProperties.setProperty("mail.smtp.auth", "false");
        }
        mailSender.setJavaMailProperties(javaMailProperties);
        return mailSender;
    }
}
