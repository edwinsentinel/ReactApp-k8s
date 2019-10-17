docker build -t sentinelwawesh/multi-client:latest -t sentinelwawesh/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t sentinelwawesh/multi-server:latest -t sentinelwawesh/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t sentinelwawesh/multi-worker:latest -t sentinelwawesh/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push sentinelwawesh/multi-client:latest
docker push sentinelwawesh/multi-worker:latest
docker push sentinelwawesh/multi-server:latest
docker push sentinelwawesh/multi-client:$SHA
docker push sentinelwawesh/multi-worker:$SHA
docker push sentinelwawesh/multi-server:$SHA
kubectl apply  -f k8s
kubectl set image deployment/server-deployment server= sentinelwawesh/multi-server:$SHA
kubectl set image deployment/client-deployment client= sentinelwawesh/multi-client:$SHA
kubectl set image deployment/worker-deployment worker= sentinelwawesh/multi-worker:$SHA

