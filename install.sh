#!/bin/bash


# mass flow control routine
echo "Installing mass flow controller script..."
cp scripts/mfc-control.py /usr/sbin/mfc-control
chmod +x /usr/sbin/mfc-control


# thermocouple logger
echo "Installing thermocouple logging service..."
cp scripts/typek-logger.py /usr/sbin/typek-logger
chmod +x /usr/sbin/typek-logger
cp etc/tracer/typek-logger.conf /etc/tracer/

echo "Registering..."
cp etc/systemd/system/typek-logger.service /etc/systemd/system/

echo "Enabling start at boot..."
systemctl enable typek-logger.service

echo "Starting..."
systemctl restart typek-logger.service


echo "Finished."
