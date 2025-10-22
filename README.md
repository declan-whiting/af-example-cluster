## AF-EXAMPLE-CLUSTER

### Getting Started:

```bash
cd af-example-cluser
chmod +x bootstrap.sh
./bootstrap.sh
```

### Cleaning up:

```bash
cd af-example-cluser
chmod +x cleanup.sh
./cleanup.sh
```

### Testing:

This configuration should not allow communincation to the infrabin service except from prometheus or via the ingress gatwway. A quick test can be ran here:

```bash
cd af-example-cluser
chmod +x authTest.sh
./authTest.sh
```

#### Example output:

```bash
Using DST=10.42.0.235
URL=http://10.42.0.235:8080/

...

HTTP_CODE=403
--- headers ---
HTTP/1.1 403 Forbidden
content-length: 19
content-type: text/plain
date: Wed, 22 Oct 2025 07:31:38 GMT
server: envoy
x-envoy-upstream-service-time: 1

--- body (first 200B) ---
RBAC: access denied
pod "ap-deny" deleted from default namespace
```

### Build Architecture's

In `helm/infrabin/values.yaml` you will notice that the image is set to `decw/infrabin` this is a arm64 image for Apple Silicone. Depending on your configuration you may need to switch it to `maruina/infrabin`