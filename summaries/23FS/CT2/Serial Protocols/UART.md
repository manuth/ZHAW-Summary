# UART

<img src="res/UART/image-20230322101641445.png" alt="image-20230322101641445" style="zoom:67%;" />

UART is an asynchronous protocol and requiring synchronisation at the start of each message. It allows for a cable up to 10m and uses $-3V$ to $-15V$ for `1` and $3V$ to $15V$ for `0`. This increases its reliability.

The diagram below shows an example implementation of a transmitter and receiver for a 9600 baud ($Baud=\frac {Bits} s$). To archive this baud rate with both a 2000 MHz and a 5000 MHz clock, dividers are used.

![image-20230322101813273](res/UART/image-20230322101813273.png)

## Timing

UART starts with a start bit to synchronise the clocks. After the receiver reads the start bit, it waits for $1.5T$ before reading data. This is to ensure that the receiver reads in the middle of the clock signal.

![image-20230322102036563](res/UART/image-20230322102036563.png)

Both clocks needs to in sync enough to stay synchronous for 10 bits by not drifting more than $\pm0.5$bit.

## Stop Bits

To make UART more reliable, the number of stop bits can configured to `1`, `1.5` or `2`. This helps the receiver to parse the start bit. However, even more non-data is sent, reducing the data-throughput even more.

## Parity Data

In UART there is parity-bit before the stop bit(s).

* none
  No parity bit will be sent
* Mark
  The parity bit will always be `1`
* Space
  The parity bit will always be `0`
* Even
  If there is an even number of `1` (incl. the parity bit), then a `1` is sent, otherwise `0`
* Odd
  If there is an odd number of `1` (incl. the parity bit), then a `1` is sent, otherwise `0`

## Differential Transmission

![image-20230322103444625](res/UART/image-20230322103444625.png)

To futher improve the reliability, two cables per line can be used. In one cable the inverted signal is sent. Distortion will apply to both signals in the same way and can be later filtered out.

## STM32F4xxx

![image-20230322103642712](res/UART/image-20230322103642712-1679477804306-1.png)

![image-20230322112004005](res/UART/image-20230322112004005.png)