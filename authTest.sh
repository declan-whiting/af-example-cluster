DST=$(kubectl -n infrabin get pod -l app=infrabin -o jsonpath='{.items[0].status.podIP}')
echo "Using DST=$DST"

kubectl -n default run ap-deny --image-pull-policy=IfNotPresent --restart=Never --rm --attach -i \
  --image=curlimages/curl --command -- sh -lc '
URL="http://'"$DST"':8080/metrics";
echo "URL=$URL";
curl -v -m 5 -sS -o /tmp/b -D /tmp/h -w "\nHTTP_CODE=%{http_code}\n" "$URL" || true;
echo "--- headers ---"; cat /tmp/h || true;
echo "--- body (first 200B) ---"; head -c 200 /tmp/b 2>/dev/null || true; echo
'