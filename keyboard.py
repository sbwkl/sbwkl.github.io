#coding=utf-8

import win32gui,win32api,win32con 
import time 
import threading 
def key(): 
    interval = 1
    while True: 
        time.sleep(interval) 
        
        win32api.keybd_event(65,0,0,0)
        win32api.keybd_event(65,0,win32con.KEYEVENTF_KEYUP,0) 
        
        win32api.keybd_event(83,0,0,0)
        win32api.keybd_event(83,0,win32con.KEYEVENTF_KEYUP,0) 
        
        win32api.keybd_event(68,0,0,0)
        win32api.keybd_event(68,0,win32con.KEYEVENTF_KEYUP,0) 
        
        win32api.keybd_event(74,0,0,0)
        win32api.keybd_event(74,0,win32con.KEYEVENTF_KEYUP,0)
        
        win32api.keybd_event(75,0,0,0)
        win32api.keybd_event(75,0,win32con.KEYEVENTF_KEYUP,0)
        
        win32api.keybd_event(76,0,0,0)
        win32api.keybd_event(76,0,win32con.KEYEVENTF_KEYUP,0) 
        
t = threading.Thread(target = key)
t.start()