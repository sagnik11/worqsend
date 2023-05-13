# Introduction

WorqSend employs a highly secure communication protocol, facilitating seamless device-to-device interaction through a REST API. The transmission of data occurs exclusively over HTTPS, guaranteeing a robust layer of protection. Notably, the TLS/SSL certificate dynamically generates on each device, reinforcing the utmost level of security.

The primary objective of the file sharing app is to establish a simple and self-contained REST protocol that operates independently without relying on external servers. Given the inherent complexity of computer networks, it is crucial to account for potential limitations in network capabilities. Not all devices may support multicast functionality, and certain devices might be restricted from running an HTTP server.

To address these challenges, the protocol employs a clever approach by incorporating multiple methods for both discovery and file transfer among WorqSend members. By leveraging diverse techniques, the protocol aims to ensure that file sharing remains accessible and effective across a wide range of network configurations.

The protocol operates on the principle that only one participant needs to establish an HTTP server, which serves as a key component of the file sharing process. This HTTP server facilitates seamless communication and enables the exchange of files between connected users. By reducing the reliance on external servers and leveraging internal resources, the protocol promotes a decentralized and resilient approach to file sharing.

Furthermore, the file sharing app emphasizes security by ensuring that all data is transmitted securely over HTTPS. To enhance the level of protection, the app generates a unique TLS/SSL certificate on the fly for each device involved in the file sharing process. This dynamic certificate generation approach enhances security by ensuring that each communication session has a distinct and temporary certificate.

By adopting this approach, the app maximizes the security of file transfers, reducing the risk of unauthorized access and data interception. The on-the-fly certificate generation strategy adds an additional layer of protection by eliminating the potential vulnerabilities associated with sharing and reusing static certificates. Users can have confidence that their files are being transmitted with the highest level of encryption and integrity, reinforcing the overall security of the file sharing protocol.

## Default Values and Settings

WorqSend offers a flexible configuration approach that allows users to adapt the app to their specific network environment. The app does not require a fixed port or multicast address but instead provides a default configuration for seamless operation.

In cases where the default port or address is unavailable or blocked, WorqSend allows users to modify these settings within the app. This ensures that users can overcome any restrictions imposed by their network setup and still enjoy the benefits of the file sharing protocol.

By default, WorqSend employs the multicast (UDP) method for efficient communication. The default multicast group used is 224.0.0.0/24, as certain Android devices may reject other multicast groups. This selection ensures compatibility across a wide range of devices and avoids potential connectivity issues.

For multicast communication, WorqSend utilizes port 53317, allowing devices within the network to discover and connect with each other seamlessly. Additionally, the app employs HTTP (TCP) for file transfers, utilizing port 53317 for reliable and secure data exchange between connected devices.

## Device Fingerprints for Security

To enhance security and facilitate device recognition, WorqSend utilizes fingerprints. These fingerprints serve two primary purposes: preventing self-discovery and enabling device identification and recognition.

When encryption is enabled, and communication occurs over HTTPS, WorqSend generates the fingerprint by calculating the SHA-256 hash of the device's certificate. This approach ensures that each device has a unique and verifiable fingerprint based on its certificate. By using a cryptographic hash function, WorqSend guarantees the integrity and non-repudiation of the fingerprint, providing a reliable means of identifying and verifying devices during encrypted communication.

On the other hand, when encryption is disabled, and communication takes place over HTTP, WorqSend generates a fingerprint using a randomly generated string. This random string serves as a unique identifier for the device, enabling device recognition and differentiation within the network. While the cryptographic strength of a certificate-based fingerprint is not present in this scenario, the random string still provides a practical and effective means of distinguishing devices during unencrypted communication.

By employing these fingerprinting techniques, WorqSend ensures that devices can be identified and remembered accurately, regardless of the encryption settings. This helps to prevent self-discovery within the network and enables efficient communication and file sharing between recognized devices.

## New Receiver Announcement

At the start of the app, the following message will be sent to the group that includes all the devices connected on the Same network:

````json
{
  "alias": "Cute Rabbit",
  "version": "2.0", // protocol version 
  "deviceModel": "Samsung", // nullable
  "deviceType": "mobile", // mobile | desktop | web | headless | server, nullable
  "fingerprint": "random string",
  "port": 53317,
  "protocol": "https", // http | https
  "download": true, // if the auto download setting has been enabled
  "announce": true
}
````

### Response

Other WorqSend members on the Current Network will notice this message and will reply with their respective information.

First, an HTTP/TCP request is sent to the origin:

POST `/api/worqsend/v2/register`

A response is only triggered when announce or visibility is true.

````json
{
  "alias": "Secret Banana",
  "version": "2.0",
  "deviceModel": "Windows",
  "deviceType": "desktop",
  "fingerprint": "random string", // ignored in HTTPS mode
  "port": 53317,
  "protocol": "https",
  "download": true, // if the download API (5.2 and 5.3) is active (optional, default: false)
}
````

In HTTP Mode

Request

````Json
{
  "alias": "Cute Rabbit",
  "version": "2.0", 
  "deviceModel": "Windows",
  "deviceType": "desktop",
  "fingerprint": "random string", // ignored in HTTPS mode
  "port": 53317,
  "protocol": "https", // http | https
  "download": true, // if the download is active (optional, default: false)
}
````

Response
````JSON5
{
  "alias": "Big Whale",
  "version": "2.0",
  "deviceModel": "Samsung",
  "deviceType": "mobile",
  "fingerprint": "random string", // ignored in HTTPS mode
  "download": true, // if the download is active (optional, default: false)
}
````

## File transfer (HTTP)

This is the default method.

The receiver setups the HTTP server.

The sender (i.e. HTTP client) sends files to the HTTP server.

### 1 Preparation (Metadata only)

Sends only the metadata to the receiver.

The receiver will decide if this request gets accepted, partially accepted or rejected.

`POST /api/worqsend/v2/prepare-upload`

Request

```json5
{
  "info": {
    "alias": "Cute Rabbit",
    "version": "2.0",
    "deviceModel": "Samsung", // nullable
    "deviceType": "mobile", // mobile | desktop | web | headless | server, nullable
    "fingerprint": "random string", // ignored in HTTPS mode
    "port": 53317,
    "protocol": "https", // http | https
    "download": true, // if the download is active (optional, default: false)
  },
  "files": {
    "some file id": {
      "id": "some file id",
      "fileName": "my image.png",
      "size": 324242, // bytes
      "fileType": "image/jpeg",
      "sha256": "*sha256 hash*", // nullable
      "preview": "*preview data*" // nullable
    },
    "another file id": {
      "id": "another file id",
      "fileName": "another image.jpg",
      "size": 1234,
      "fileType": "image/jpeg",
      "sha256": "*sha256 hash*",
      "preview": "*preview data*"
    }
  }
}
```

Response

```json5
{
  "sessionId": "mySessionId",
  "files": {
    "someFileId": "someFileToken",
    "someOtherFileId": "someOtherFileToken"
  }
}
```

Errors

| HTTP code | Message                            |
|-----------|------------------------------------|
| 204       | Finished (No file transfer needed) |
| 400       | Invalid body                       |
| 403       | Rejected                           |
| 500       | Unknown error by receiver          |
 
### 2 Send File

The file transfer.

Use the `sessionId`, the `fileId` and its file-specific `token` from `/prepare-upload`.

This route can be called in parallel.

`POST /api/worqsend/v2/upload?sessionId=mySessionId&fileId=someFileId&token=someFileToken`

Request

```text
Binary data
```

Response

```text
No body
```

Errors

| HTTP code | Message                     |
|-----------|-----------------------------|
| 400       | Missing parameters          |
| 403       | Invalid token or IP address |
| 409       | Blocked by another session  |
| 500       | Unknown error by receiver   |

### 3 Cancel

This route will be called when the sender wants to cancel the session.

Use the `sessionId` from `/send-request`.

`POST /api/worqsend/v2/cancel?sessionId=mySessionId`

Response

```text
No body
```

## Reverse file transfer (HTTP)

In situations where WorqSend is not available on the receiver's device, an alternative method can be employed to facilitate file transfer. In this approach, the sender sets up an HTTP server and provides a specific URL to the receiver for downloading the file.

To initiate the file transfer, the sender establishes an HTTP server that hosts the file to be shared. The sender then shares the corresponding URL with the intended receiver. The receiver, upon receiving the URL, can open a web browser and navigate to the provided address.

Using the web browser, the receiver can access the HTTP server hosted by the sender and initiate the file download. The file can be downloaded directly through the browser interface, allowing for convenient and straightforward access to the shared content.

It's important to note that this alternative method uses the unencrypted HTTP protocol for file transfer. This choice is made because browsers typically reject self-signed certificates, which would otherwise be necessary to establish secure HTTPS connections. Although the use of unencrypted HTTP introduces potential security considerations, it provides a practical solution for scenarios where WorqSend is not available on the receiver's device.

By utilizing this sender-initiated HTTP server approach, WorqSend offers a flexible and accessible file sharing option that accommodates varying device configurations and network constraints.

### 1 Browser URL

The receiver can open the following URL in the browser to download the file.

```text
http://<sender-ip>:<sender-port>
```

### 2 Receive Request (Metadata only)

Send to the sender a request to get a list of file metadata.

The downloader may add `?sessionId=mySessionId`. In this case, the request should be accepted if it is the same session.

This is needed if the user refreshes the browser page.

`POST /api/worqsend/v2/prepare-download`

Request

```text
No body
```

Response

```json5
{
  "info": {
    "alias": "Cute Rabbit",
    "version": "2.0",
    "deviceModel": "Samsung", // nullable
    "deviceType": "mobile", // mobile | desktop | web | headless | server, nullable
    "fingerprint": "random string", // ignored in HTTPS mode
    "download": true, // if the download API (5.2 and 5.3) is active (optional, default: false)
  },
  "sessionId": "mySessionId",
  "files": {
    "some file id": {
      "id": "some file id",
      "fileName": "my image.png",
      "size": 324242, // bytes
      "fileType": "image/jpeg",
      "sha256": "*sha256 hash*", // nullable
      "preview": "*preview data*" // nullable
    },
    "another file id": {
      "id": "another file id",
      "fileName": "another image.jpg",
      "size": 1234,
      "fileType": "image/jpeg",
      "sha256": "*sha256 hash*",
      "preview": "*preview data*"
    }
  }
}
```

### 5.3 Receive File

The file transfer.

Use the `sessionId`, the `fileId` from `/receive-request`.

This route can be called in parallel.

`GET /api/worqsend/v2/download?sessionId=mySessionId&fileId=someFileId`

Request

```text
No body
```

Response

```text
Binary data
```

## 6. Additional API

### 1 Info

This particular route provides information about the send functionality within the application. By sending a GET request to this endpoint, users can retrieve relevant details and insights related to the local send feature.

However, it is important to note that this route is intended for debugging purposes only and should not be accessed or utilized in a production or public-facing environment. Exposing debugging routes in a production environment can potentially pose security risks and compromise the stability and security of the application.

Therefore, this route can solely be used for debugging scenarios, where developers can leverage the provided information to diagnose and address any issues or concerns within the application's local send functionality. It can be accessed from the debugging page

`GET /api/worqsend/v2/info`

Response

```json5
{
  "alias": "Cute Rabbit",
  "version": "2.0",
  "deviceModel": "Samsung", // nullable
  "deviceType": "mobile", // mobile | desktop | web | headless | server, nullable
  "fingerprint": "random string",
  "download": true, // if the download API (5.2 and 5.3) is active (optional, default: false)
}
```

## Enums

In this project, enums are used to define the possible values of some fields.

### 1 Device Type

Device types are only used for UI purposes like showing an icon.

There is no difference in the protocol between the different device types.

| Value    | Description                               |
|----------|-------------------------------------------|
| mobile   | mobile device (Android, iOS, FireOS)      |
| desktop  | desktop (Windows, macOS, Linux)           |
| web      | web browser (Firefox, Chrome)             |
| headless | program without GUI running on a terminal (In Development) |

The implementation handle unknown values. The official implementation falls back to `desktop`.
