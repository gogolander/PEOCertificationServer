slot.set_layout("custom")
  ui.container{ attr = { class = "row-fluid" }, content = function()
    ui.heading{ level = 1, attr = { class = "span12 text-center" }, content = _"Auditor login" }
--    ui.container{ attr = { class = "span12" }, content = function()
--      ui.svgtxt{ svg_attr={style="height: 100px"}, attr={style="font-size: 55px"},content = _"Auditor login" }
--    end }
  end }

  if app.session.member ~= nil then
    request.redirect { module = "auditor", view = "index" }
    return
  end

  ui.container{ attr = { class = "row-fluid spaceline3" }, content = function ()
    ui.form{
      attr = { id="login_div", class = "well span6 offset3" },
      module = 'auditor',
      action = 'login',
      routing = {
        ok = {
          mode   = 'redirect',
          module = param.get("redirect_module") or "auditor",
          view = param.get("redirect_view") or "index",
          id = param.get("redirect_id"),
        },
        error = {
          mode   = 'forward',
          module = 'auditor',
          view   = 'login',
        }
      }, 
      content = function()
        ui.tag{ tag = "fieldset", content = function()

          ui.container{ attr = { class = "row-fluid" }, content = function()
            ui.tag{ tag = "legend", attr = { class = "span12 text-center" }, content = _"Insert user name and password to access:" }
          end }

          ui.container{ attr = { class = "row-fluid" }, content = function()
            ui.tag{ tag="label", attr = { class = "span4" },content =_'login name' }
            ui.tag{
              tag="input",
              attr = { id="username_field", type="text", placeholder=_'login name', class = "span8 input-large", name="login" },
              content = ''
            }
          end }

          ui.container{ attr = { class = "row-fluid" }, content = function()
            ui.tag{ tag="label",attr = { class = "span4" },  content =_'Password' }
            ui.script{ script = 'document.getElementById("username_field").focus();' }
            ui.tag{ tag="input", attr = { type="password", placeholder=_'Password', class = "span8 input-large", name="password" }, content = '' }
          end }

          ui.container{ attr = { class = "row-fluid text-center" }, content = function()
            ui.container{ attr = { class = "span6 offset3" }, content = function()
              ui.tag{
                tag="button",
                attr = { type="submit", class="btn btn-primary btn-large fixclick" },
                content= function()
                  ui.heading{ level=4, attr = { class="inline-block"}, content= _"Login"}
                end
              }
            end }
          end }
        end }
      end
    }
end }
