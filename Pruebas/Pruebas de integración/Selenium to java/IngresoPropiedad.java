package com.example.tests;

import java.util.regex.Pattern;
import java.util.concurrent.TimeUnit;
import org.junit.*;
import static org.junit.Assert.*;
import static org.hamcrest.CoreMatchers.*;
import org.openqa.selenium.*;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.support.ui.Select;

public class IngresoPropiedad {
  private WebDriver driver;
  private String baseUrl;
  private boolean acceptNextAlert = true;
  private StringBuffer verificationErrors = new StringBuffer();

  @Before
  public void setUp() throws Exception {
    driver = new FirefoxDriver();
    baseUrl = "http://localhost:8080/Viaje_feliz/Bootstrap/index.html";
    driver.manage().timeouts().implicitlyWait(30, TimeUnit.SECONDS);
  }

  @Test
  public void testIngresoPropiedad() throws Exception {
    driver.get(baseUrl + "/Viaje_feliz/Bootstrap/Pages/Visibles/MenuUsuario.jsp");
    driver.findElement(By.xpath("(//button[@type='submit'])[3]")).click();
    driver.findElement(By.name("Region_propiedad")).clear();
    driver.findElement(By.name("Region_propiedad")).sendKeys("Andina");
    driver.findElement(By.name("Ciudad_propiedad")).clear();
    driver.findElement(By.name("Ciudad_propiedad")).sendKeys("Chia");
    driver.findElement(By.name("Barrio_propiedad")).clear();
    driver.findElement(By.name("Barrio_propiedad")).sendKeys("Centro");
    driver.findElement(By.name("Direccion_propiedad")).clear();
    driver.findElement(By.name("Direccion_propiedad")).sendKeys("Calle 1 # 2-3");
    driver.findElement(By.name("Descripcion_propiedad")).clear();
    driver.findElement(By.name("Descripcion_propiedad")).sendKeys("Primer piso");
    driver.findElement(By.name("NumMaxPersonas_propiedad")).clear();
    driver.findElement(By.name("NumMaxPersonas_propiedad")).sendKeys("4");
    driver.findElement(By.name("NumHabitaciones_propiedad")).clear();
    driver.findElement(By.name("NumHabitaciones_propiedad")).sendKeys("2");
    driver.findElement(By.name("NumBaños_propiedad")).clear();
    driver.findElement(By.name("NumBaños_propiedad")).sendKeys("1");
    new Select(driver.findElement(By.name("comboCalefaccion"))).selectByVisibleText("Si");
    driver.findElement(By.name("PrecioBase_propiedad")).clear();
    driver.findElement(By.name("PrecioBase_propiedad")).sendKeys("140000");
    driver.findElement(By.xpath("//button[@type='submit']")).click();
  }

  @After
  public void tearDown() throws Exception {
    driver.quit();
    String verificationErrorString = verificationErrors.toString();
    if (!"".equals(verificationErrorString)) {
      fail(verificationErrorString);
    }
  }

  private boolean isElementPresent(By by) {
    try {
      driver.findElement(by);
      return true;
    } catch (NoSuchElementException e) {
      return false;
    }
  }

  private boolean isAlertPresent() {
    try {
      driver.switchTo().alert();
      return true;
    } catch (NoAlertPresentException e) {
      return false;
    }
  }

  private String closeAlertAndGetItsText() {
    try {
      Alert alert = driver.switchTo().alert();
      String alertText = alert.getText();
      if (acceptNextAlert) {
        alert.accept();
      } else {
        alert.dismiss();
      }
      return alertText;
    } finally {
      acceptNextAlert = true;
    }
  }
}
