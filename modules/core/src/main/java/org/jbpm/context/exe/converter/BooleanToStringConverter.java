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
package org.jbpm.context.exe.converter;

import org.jbpm.context.exe.Converter;
import org.jbpm.db.hibernate.Converters;

public class BooleanToStringConverter implements Converter<Boolean, String> {

  private static final long serialVersionUID = 1L;

  public static final String TRUE_TEXT = "T";
  public static final String FALSE_TEXT = "F";

  public BooleanToStringConverter() {
    Converters.registerConverter("B", this);
  }

  public boolean supports(Object value) {
    return value instanceof Boolean;
  }

  public String convert(Boolean o) {
    String convertedValue = FALSE_TEXT;
    if (o.booleanValue()) {
      convertedValue = TRUE_TEXT;
    }
    return convertedValue;
  }

  public Boolean revert(String o) {
    Boolean revertedValue = Boolean.FALSE;
    if (TRUE_TEXT.equals(o)) {
      revertedValue = Boolean.TRUE;
    }
    return revertedValue;
  }
}