package kr.patpat.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@EnableWebMvc // MVC방식으로 적용될 ServletConfig Class
@Configuration // 다른 클래스에서 불러서 적용시킬 설정파일 명시
@ComponentScan(basePackages = {"kr.patpat.controller"} ) // POJO 찾는 componentScan 설정
public class ServletConfig implements WebMvcConfigurer {
   // servlet-context.xml을 대체할 클래스
   
   @Override
   public void configureViewResolvers(ViewResolverRegistry registry) {
      // ViewResolvers 설정 부분
      InternalResourceViewResolver bean = new InternalResourceViewResolver();
      bean.setPrefix("/WEB-INF/views/");
      bean.setSuffix(".jsp");
      registry.viewResolver(bean);
   }

   @Override
   public void addResourceHandlers(ResourceHandlerRegistry registry) {
      registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
      
   }
   
   
   
   
   
}


