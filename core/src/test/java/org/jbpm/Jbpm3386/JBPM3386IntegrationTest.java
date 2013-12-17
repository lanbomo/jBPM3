/*
 * JBoss, Home of Professional Open Source
 * Copyright 2005, JBoss Inc., and individual contributors as indicated
 * by the @authors tag. See the copyright.txt in the distribution for a
 * full listing of individual contributors.
 *
 * This is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License as
 * published by the Free Software Foundation; either version 2.1 of
 * the License, or (at your option) any later version.
 *
 * This software is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this software; if not, write to the Free
 * Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA
 * 02110-1301 USA, or see the FSF site: http://www.fsf.org.
 */
package org.jbpm.Jbpm3386;

import java.io.IOException;
import java.util.Random;

import javax.mail.MessagingException;

import org.jbpm.AbstractJbpmTestCase;
import org.jbpm.JbpmConfiguration;
import org.jbpm.JbpmContext;
import org.jbpm.context.exe.ContextInstance;
import org.jbpm.graph.def.ProcessDefinition;
import org.jbpm.graph.exe.ProcessInstance;
import org.jbpm.mail.Mail;

/**
 * CC support in mail nodes and mail templates.
 * 
 * @see <a href="https://jira.jboss.org/jira/browse/JBPM-3386">JBPM-3386</a>
 */
public class JBPM3386IntegrationTest extends AbstractJbpmTestCase {

  private static Random random = new Random();
  int uniqueTestNum; 
  
  private JbpmContext jbpmContext;
  private ProcessInstance processInstance;

  private static JbpmConfiguration jbpmConfiguration = JbpmConfiguration.parseResource("org/jbpm/jbpm3386/jbpm.integration.cfg.xml");

  protected void setUp() throws Exception {
    super.setUp();
    jbpmContext = jbpmConfiguration.createJbpmContext();

    ProcessDefinition processDefinition = ProcessDefinition.parseXmlResource("org/jbpm/jbpm3386/processdefinition.xml");
    processInstance = new ProcessInstance(processDefinition);

    ContextInstance contextInstance = processInstance.getContextInstance();
    contextInstance.setVariable("to", "mrietvel@redhat.com");
    
    uniqueTestNum = random.nextInt(Integer.MAX_VALUE);
  }

  protected void tearDown() throws Exception {
    jbpmContext.close();
    super.tearDown();
  }

  public void testDoNothing() { 
    
  }
  
  /**
   * This test sends an actual e-mail to a redhat e-mail address via the gmail smtp domain, 
   *  which does NOT permit unauthenticated relaying -- and thus tests what we want it to.
   * @throws MessagingException
   * @throws IOException
   */
  public void dontTestSendViaAnotherDomainGmail() throws MessagingException, IOException {
    String testMethod = (new Throwable()).getStackTrace()[0].getMethodName();
    System.out.println( testMethod + ": " + uniqueTestNum );
    
    String to = "mrietvel@redhat.com";
    String subject = this.getClass().getName() + " test message [" + uniqueTestNum + "]";
    String text = "\nThis is an automatic message generated by the " + testMethod + " test.\n";

    Mail mail = new Mail(null, null, to, subject, text);
    mail.send();
  }

}
