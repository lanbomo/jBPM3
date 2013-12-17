package org.jbpm.command;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.jbpm.JbpmContext;
import org.jbpm.graph.def.ProcessDefinition;
import org.jbpm.graph.exe.ProcessInstance;

/**
 * Abstract base class for all commands working on {@link org.jbpm.graph.exe.ProcessInstance}s. The
 * {@link ProcessInstance} can either be specified by id or multiple ids. The alternative is to
 * specify a {@link ProcessDefinition} name and version. In this case <b>all</b> found
 * {@link ProcessInstance}s are processed. If no version is specified, <b>all</b> versions are taken
 * into account. if onlyRunning is set to false (default is true) already ended
 * {@link ProcessInstance}s are processed too.
 * 
 * @author bernd.ruecker@camunda.com
 */
public abstract class AbstractProcessInstanceBaseCommand extends AbstractBaseCommand
{
  private static final long serialVersionUID = 1L;
  protected Log log = LogFactory.getLog(this.getClass());

  private long[] processInstanceIds = null;
  private String processName = null;
  private int processVersion = 0;
  private boolean onlyRunning = true;

  /**
   * indicator if exactly one token is targeted with the command
   */
  private boolean operateOnSingleObject;

  private transient JbpmContext jbpmContext;

  public AbstractProcessInstanceBaseCommand()
  {
    super();
  }

  protected JbpmContext getJbpmContext()
  {
    return jbpmContext;
  }

  public Object execute(JbpmContext jbpmContext) throws Exception
  {
    ArrayList result = new ArrayList();
    this.jbpmContext = jbpmContext;
    try
    {
      log.debug("executing " + this);

      // batch tokens
      if (processInstanceIds != null && processInstanceIds.length > 0)
      {
        for (int i = 0; i < processInstanceIds.length; i++)
        {
          ProcessInstance pi = jbpmContext.loadProcessInstanceForUpdate(processInstanceIds[i]);
          result.add(execute(pi));
        }
      }

      // search for ProcessInstances according to parameters
      if (processName != null)
      {
        operateOnSingleObject = false;

        GetProcessInstancesCommand cmd = new GetProcessInstancesCommand();
        cmd.setProcessDefinitionName(processName);
        cmd.setOnlyRunning(onlyRunning);
        if (processVersion > 0) cmd.setVersion(String.valueOf(processVersion));

        List processInstanceList = (List) cmd.execute(jbpmContext);

        Iterator iter = processInstanceList.iterator();
        while (iter.hasNext())
        {
          ProcessInstance pi = (ProcessInstance) iter.next();
          result.add(
              execute(pi));
        }
      }

      if (operateOnSingleObject)
      {
        if (result.size() < 1)
          return null;
        else
          return result.get(0);
      }
      else
      {
        return result;
      }
    }
    finally
    {
      this.jbpmContext = null;
    }
  }

  public abstract ProcessInstance execute(ProcessInstance processInstance);

  public void setProcessInstanceIds(long[] processInstanceIds)
  {
    this.operateOnSingleObject = false;
    this.processInstanceIds = processInstanceIds;
  }

  public void setProcessInstanceId(long processInstanceId)
  {
    this.operateOnSingleObject = true;
    this.processInstanceIds = new long[1];
    this.processInstanceIds[0] = processInstanceId;
  }

  /**
   * Overwrite toString to keep semantic of getAdditionalToStringInformation
   */
  public String toString()
  {
    if (processName != null)
    {
      return this.getClass().getName()
          + " [tokenIds="
          + Arrays.toString(processInstanceIds)
          + ";processName="
          + processName
          + ";processVersion="
          + (processVersion > 0 ? processVersion : "NA")
          + getAdditionalToStringInformation()
          + "]";
    }
    else
    {
      return this.getClass().getName()
          + " [tokenIds="
          + Arrays.toString(processInstanceIds)
          + ";operateOnSingleObject="
          + operateOnSingleObject
          + getAdditionalToStringInformation()
          + "]";
    }
  }

  public String getProcessName()
  {
    return processName;
  }

  public void setProcessName(String processName)
  {
    this.processName = processName;
  }

  public int getProcessVersion()
  {
    return processVersion;
  }

  public void setProcessVersion(int processVersion)
  {
    this.processVersion = processVersion;
  }

  public long[] getProcessInstanceIds()
  {
    return processInstanceIds;
  }

  /**
   * return the process instance id in case only one process instance id is set. Otherwise an
   * {@link IllegalStateException} is thrown
   */
  public long getProcessInstanceId()
  {
    if (processInstanceIds == null || processInstanceIds.length != 1)
    {
      throw new IllegalStateException("exactly one process instance id must be set on "
          + this
          + " to get processInstanceId property; found "
          + Arrays.toString(processInstanceIds));
    }
    return processInstanceIds[0];
  }

  public boolean isOnlyRunning()
  {
    return onlyRunning;
  }

  public void setOnlyRunning(boolean onlyRunning)
  {
    this.onlyRunning = onlyRunning;
  }

  // methods for fluent programming

  public AbstractProcessInstanceBaseCommand processInstanceIds(long[] processInstanceIds)
  {
    setProcessInstanceIds(processInstanceIds);
    return this;
  }

  public AbstractProcessInstanceBaseCommand processInstanceId(long processInstanceId)
  {
    setProcessInstanceId(processInstanceId);
    return this;
  }

  public AbstractProcessInstanceBaseCommand processName(String processName)
  {
    setProcessName(processName);
    return this;
  }

  public AbstractProcessInstanceBaseCommand processVersion(int processVersion)
  {
    setProcessVersion(processVersion);
    return this;
  }

  public AbstractProcessInstanceBaseCommand onlyRunning(boolean onlyRunning)
  {
    setOnlyRunning(onlyRunning);
    return this;
  }

  public boolean isOperateOnSingleObject()
  {
    return operateOnSingleObject;
  }
}