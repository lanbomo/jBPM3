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
package org.jbpm.jbpm1707;

import java.io.InputStream;
import java.util.List;

import org.jbpm.AbstractJbpmTestCase;
import org.jbpm.graph.def.ProcessDefinition;
import org.jbpm.jpdl.JpdlException;
import org.jbpm.jpdl.xml.Problem;

/**
 * Pageflow parsing is slow.
 * 
 * https://jira.jboss.org/jira/browse/JBPM-1707
 * 
 * @author Alejandro Guizar
 */
public class JBPM1707Test extends AbstractJbpmTestCase {

  public void testPageflowWithoutNamespace() {
    parseXmlForThisMethod();
  }

  public void testPageflowWithNamespace() {
    try {
      parseXmlForThisMethod();
      fail("expected exception");
    }
    catch (JpdlException e) {
      List problems = e.getProblems();
      assertEquals(1, problems.size());
      Problem problem = (Problem) problems.get(0);
      assertEquals(Problem.LEVEL_ERROR, problem.getLevel());
      assertEquals(3, problem.getLine().intValue());
    }
  }

  public void testPageflowWithSchemaLocation() {
    parseXmlForThisMethod();
  }

  private ProcessDefinition parseXmlForThisMethod() {
    InputStream xmlStream = getClass().getResourceAsStream(getName() + ".xml");
    return ProcessDefinition.parseXmlInputStream(xmlStream);
  }
}