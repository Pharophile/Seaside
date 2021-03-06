rendering
renderSwaggerPathsOn: swagger

	"Holds the relative paths to the individual endpoints. The path is appended to the basePath in order to construct the full URL. The Paths may be empty, due to ACL constraints."
	
	| theRoutes |
	theRoutes := self swaggerRoutes groupBy: [ :route | route path ] having: [ :route | true ].
	theRoutes keysAndValuesDo: [ :path :routesForPath |
		swagger path: path item: [
			self renderSwaggerPathItemForRoutes: routesForPath on: swagger ] ]