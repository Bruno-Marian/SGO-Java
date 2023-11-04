package utils;

import java.net.Inet4Address;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.net.UnknownHostException;

public class Machine {
	public static String GetMacAddress() {
		String macAddress = null;
		try {
			InetAddress localHost = InetAddress.getLocalHost();
			NetworkInterface ni = NetworkInterface.getByInetAddress(localHost);
			byte[] hardwareAddress = ni.getHardwareAddress();
			
			String[] hexadecimal = new String[hardwareAddress.length];
			for (int i = 0; i < hardwareAddress.length; i++) {
			    hexadecimal[i] = String.format("%02X", hardwareAddress[i]);
			}
			macAddress = String.join("-", hexadecimal);

		} catch (SocketException e) {
			System.err.println(e.getMessage());
		} catch (UnknownHostException e) {
			System.err.println(e.getMessage());
		}
		
		if (macAddress == null) {
			try {
				return Inet4Address.getLocalHost().getHostAddress();
			} catch (UnknownHostException e) {
				System.err.println(e.getMessage());
			}
		}
		
		return macAddress;
	}
}
