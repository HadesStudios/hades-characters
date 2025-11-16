AddEventHandler('Characters:Shared:DependencyUpdate', RetrieveComponents)
function RetrieveComponents()
	Middleware = exports['hades-base']:FetchComponent('Middleware')
	Database = exports['hades-base']:FetchComponent('Database')
	Callbacks = exports['hades-base']:FetchComponent('Callbacks')
	DataStore = exports['hades-base']:FetchComponent('DataStore')
	Logger = exports['hades-base']:FetchComponent('Logger')
	Database = exports['hades-base']:FetchComponent('Database')
	Fetch = exports['hades-base']:FetchComponent('Fetch')
	Logger = exports['hades-base']:FetchComponent('Logger')
	Chat = exports['hades-base']:FetchComponent('Chat')
	GlobalConfig = exports['hades-base']:FetchComponent('Config')
	Routing = exports['hades-base']:FetchComponent('Routing')
	Sequence = exports['hades-base']:FetchComponent('Sequence')
	Reputation = exports['hades-base']:FetchComponent('Reputation')
	Apartment = exports['hades-base']:FetchComponent('Apartment')
	RegisterCommands()
	_spawnFuncs = {}
end

AddEventHandler('Core:Shared:Ready', function()
	exports['hades-base']:RequestDependencies('Characters', {
		'Callbacks',
		'Database',
		'Middleware',
		'DataStore',
		'Logger',
		'Database',
		'Fetch',
		'Logger',
		'Chat',
		'Config',
		'Routing',
		'Sequence',
		'Reputation',
		'Apartment',
	}, function(error)
		if #error > 0 then return end -- Do something to handle if not all dependencies loaded
		RetrieveComponents()
		RegisterCallbacks()
		RegisterMiddleware()
		Startup()
	end)
end)