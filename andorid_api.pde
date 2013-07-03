import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.BufferedInputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.*;
//import android.content.res.Resources;
import android.app.Activity; 
import android.os.Bundle; 
import android.media.*;
import android.media.audiofx.Visualizer;
import android.content.res.AssetFileDescriptor;
import android.hardware.*;


public class ListenSensors 
{

  private SensorManager mSensorManager;
  private List<Sensor> listOfSensors;
  private Sensor sensor;
  private int numberOfSensors;
  private int it=0; //iterator
  
  public ListenSensors()
  {
    mSensorManager=(SensorManager)getSystemService(SENSOR_SERVICE);
    listOfSensors=mSensorManager.getSensorList(Sensor.TYPE_ALL);
    numberOfSensors=listOfSensors.size();
  }
  public int NumberOfSensors()
  {
    return numberOfSensors;
  }
  public boolean SetSensor(int i)
  {
    if(i>=0 || i< numberOfSensors)
      sensor=listOfSensors.get(i);
    else
      return false;
    return true;
  }
  public String GetName()
  {
    return sensor.getName();
  }
  public String GetType()
  {
    int type=sensor.getType();
    if(type==Sensor.TYPE_ACCELEROMETER)
      return "accelerometer";
    else if(type==Sensor.TYPE_GRAVITY)
      return "gravity sensor";
    else if(type==Sensor.TYPE_GYROSCOPE)
      return "gyroscope";
    else if(type==Sensor.TYPE_LIGHT)
      return "light sensor";
    else if(type==Sensor.TYPE_LINEAR_ACCELERATION)
      return "linear acceleration";
    else if(type==Sensor.TYPE_MAGNETIC_FIELD)
      return "magnetic sensor";
    else if(type==Sensor.TYPE_PRESSURE)
      return "pressure sensor";
    else if(type==Sensor.TYPE_PROXIMITY)
      return "proximity sensor";
    else if(type==Sensor.TYPE_ROTATION_VECTOR)
      return "roatation vector sensor";
    else if(type==Sensor.TYPE_TEMPERATURE)
      return "roatation vector sensor";
    return "not implemented";
  }
  public int GetVersion()
  {
    return sensor.getVersion();
  }
  public float GetMaxRange()
  {
    return sensor.getMaximumRange();
  }
  public int GetMinDelay()
  {
    return sensor.getMinDelay();
  }
  public float GetPower()
  {
    return sensor.getPower();
  }

  public void ReadAllSensors()
  { 
    for (Sensor i : listOfSensors) 
    {
      println(i.getName()); 
    }
  }
}

