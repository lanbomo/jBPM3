package org.jbpm;

@SuppressWarnings({
  "rawtypes", "unchecked"
})
public class JbpmDefaultConfigTest extends AbstractJbpmTestCase {

  // this test should be run without jbpm.cfg.xml on the classpath
  public void testWithoutJbpmCfgXml() {
    JbpmConfiguration.getInstance().createJbpmContext().close();
  }
}
