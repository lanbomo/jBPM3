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
package org.jbpm.mail;

import java.io.IOException;
import java.net.ServerSocket;

import org.subethamail.wiser.Wiser;

@SuppressWarnings({
  "rawtypes", "unchecked"
})
public class MailTestSetup {

  public static Wiser getWiser() { 
    int SMTP_PORT = getOpenPort();
    
    Wiser wiser = new Wiser();
    wiser.setPort(SMTP_PORT);
    wiser.start();
    return wiser;
  }
  
  public static int getOpenPort() { 

    ServerSocket socket = null;
    int openPort = -1;
    for( int p = 2525; openPort < 0 && p < 5000; ++p ) { 
      try {
        socket = new ServerSocket(p);
      } catch (IOException e) {
        // do nothing
      } finally { 
        // Clean up
        if (socket != null) { 
          openPort = p;
          try {
            socket.close();
          }
          catch (IOException e) {
            openPort = -1;
            // do nothing
          } 
          if( ! socket.isClosed() ) { 
            throw new RuntimeException("blkah");
          }
        }
      }
    }
    
    return openPort;

  }
  
}