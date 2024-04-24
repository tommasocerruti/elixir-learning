{application,cc_precompiler,
             [{optional_applications,[]},
              {applications,[kernel,stdlib,elixir,logger,eex]},
              {description,"NIF library Precompiler that uses C/C++ (cross-)compiler."},
              {modules,['Elixir.CCPrecompiler',
                        'Elixir.CCPrecompiler.CompilationScript',
                        'Elixir.CCPrecompiler.UniversalBinary']},
              {registered,[]},
              {vsn,"0.1.10"}]}.
