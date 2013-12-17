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
package org.jbpm.instantiation;

import org.jbpm.AbstractJbpmTestCase;

public class ConstructorInstantiatorTest extends AbstractJbpmTestCase {

  ConstructorInstantiator constructorInstantiator = new ConstructorInstantiator();

  public static class StringConstructorClass {
    final String input;

    public StringConstructorClass(String input) {
      this.input = input;
    }
  }

  public void testConstructorInstantiator() {
    String configuration = "hello";
    StringConstructorClass o = constructorInstantiator.instantiate(StringConstructorClass.class, configuration);
    assertEquals(configuration, o.input);
  }

  /**
   * test that {@link ConstructorInstantiator} works also without configuration (config==null)
   * because this is used in some version of the ESB integration, so this should be true for
   * compatibility reasons! See http://www.jboss.com/index.html?module=bb&op=viewtopic&p=4208220
   */
  public void testConstructorInstantiatorWithNullValue() {
    StringConstructorClass o = constructorInstantiator.instantiate(StringConstructorClass.class, null);
    assertNull(o.input);
  }

}
