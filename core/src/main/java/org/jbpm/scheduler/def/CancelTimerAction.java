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
package org.jbpm.scheduler.def;

import org.dom4j.Element;

import org.jbpm.graph.def.Action;
import org.jbpm.graph.exe.ExecutionContext;
import org.jbpm.jpdl.xml.JpdlXmlReader;
import org.jbpm.scheduler.SchedulerService;

@SuppressWarnings({
  "rawtypes", "unchecked"
})
public class CancelTimerAction extends Action {

  private static final long serialVersionUID = 1L;

  String timerName;

  public void read(Element actionElement, JpdlXmlReader jpdlReader) {
    timerName = actionElement.attributeValue("name");
    if (timerName == null) {
      jpdlReader.addWarning("timer name not specified on cancel timer: "
        + actionElement.getPath());
    }
  }

  public void execute(ExecutionContext executionContext) throws Exception {
    SchedulerService schedulerService =
        executionContext.getJbpmContext().getServices().getSchedulerService();
    schedulerService.deleteTimersByName(timerName, executionContext.getToken());
  }

  public String toString() {
    return "CancelTimerAction(" + timerName + ')';
  }

  public String getTimerName() {
    return timerName;
  }

  public void setTimerName(String timerName) {
    this.timerName = timerName;
  }
}
