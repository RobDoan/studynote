# Microservice Orchestrator
	
	- TODO: should reserach apache camel
	- Should not operate delete operation on orchestration service
	- fitness function: test and send notification if percent of orchestration services > 10%

	- Orchestartion not work well if have many services. Imagine if we have 100 serivces, and 1 service time out, it cost a lot. So that we have aggregator service

# Service aggregation 
	
	- Aggreator is also dangerous, because we could not store all data. If we duplicate data, it would be impossible (return to monolothic problem)


OTMA(Open Transaction Manager Access)
	+ ISAM
	+ JT400