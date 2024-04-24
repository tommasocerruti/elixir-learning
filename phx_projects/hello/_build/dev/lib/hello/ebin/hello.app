{application,hello,
             [{compile_env,[{hello,['Elixir.HelloWeb.Gettext'],error},
                            {hello,[dev_routes],{ok,true}}]},
              {optional_applications,[]},
              {applications,[kernel,stdlib,elixir,logger,runtime_tools,
                             phoenix,phoenix_ecto,ecto_sql,postgrex,
                             phoenix_html,phoenix_live_reload,
                             phoenix_live_view,phoenix_live_dashboard,esbuild,
                             tailwind,swoosh,finch,telemetry_metrics,
                             telemetry_poller,gettext,jason,dns_cluster,
                             bandit]},
              {description,"hello"},
              {modules,['Elixir.Hello','Elixir.Hello.Application',
                        'Elixir.Hello.Mailer','Elixir.Hello.Pet',
                        'Elixir.Hello.Repo','Elixir.Hello.User',
                        'Elixir.HelloWeb','Elixir.HelloWeb.CoreComponents',
                        'Elixir.HelloWeb.Endpoint',
                        'Elixir.HelloWeb.ErrorHTML',
                        'Elixir.HelloWeb.ErrorJSON','Elixir.HelloWeb.Gettext',
                        'Elixir.HelloWeb.HelloController',
                        'Elixir.HelloWeb.HelloHTML','Elixir.HelloWeb.Layouts',
                        'Elixir.HelloWeb.PageController',
                        'Elixir.HelloWeb.PageHTML',
                        'Elixir.HelloWeb.Plugs.Locale',
                        'Elixir.HelloWeb.Router','Elixir.HelloWeb.Telemetry']},
              {registered,[]},
              {vsn,"0.1.0"},
              {mod,{'Elixir.Hello.Application',[]}}]}.