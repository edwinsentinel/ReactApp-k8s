docker build -t sentinelwawesh/multi-client:latest 
docker build -t sentinelwawesh/multi-server:latest 
docker build -t sentinelwawesh/multi-worker:latest 
docker push sentinelwawesh/multi-client:latest
docker push sentinelwawesh/multi-worker:latest
docker push sentinelwawesh/multi-server:latest
kubectl apply  -f k8s
kubectl set image deployments/server-deployment server= sentinelwawesh/multi-server:latest
kubectl set image deployments/client-deployment client= sentinelwawesh/multi-client:latest
kubectl set image deployments/worker-deployment worker= sentinelwawesh/multi-worker:latest

