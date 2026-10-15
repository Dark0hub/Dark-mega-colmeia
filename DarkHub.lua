--[[ DARK HUB v34 - Clique robusto (firesignal/getconnections) + V2 no menu ]]
if _G.DarkHub and _G.DarkHub.Cleanup then pcall(_G.DarkHub.Cleanup) end
local Players=game:GetService("Players")
local UIS=game:GetService("UserInputService")
local Tween=game:GetService("TweenService")
local Run=game:GetService("RunService")
local WS=game:GetService("Workspace")
local LT=game:GetService("Lighting")
local LP=Players.LocalPlayer
local PG=LP:WaitForChild("PlayerGui")
print("[DarkHub] 1/9 - Servicos OK")

local ProjectInfo={Name="Dark Hub",Game="Mega Colmeia",Creator="DARKZINNMVP",Developer="DARKZINNMVP",Version="V2",CreationDate="NÃO DEFINIDA",
Description="Dark Hub - menu organizado para Mega Colmeia.",DiscordLink="https://discord.gg/vh9sy8hbtH"}

local Config={
Title="Dark Hub | Mega Colmeia v2",
TeleportInterval=1.0,VisitCooldown=1.5,ReturnToBaseDistance=200,TeleportHeight=3,RescanInterval=5,MaxBusinessDistance=500,
RejectedContainers={"ExposicaoLuau","ModelosExpostos","SpawnToEvents","PreviewModels","Lojas","TpParts","Super Honey"},
SuperHoneyItems={{name="TpHoney", priority=1, rejectIn="TpParts"}},
Businesses={
["Small Apiary"]={"Small_Apiary","SmallApiary","Small Apiary"},["Little beehive"]={"Little_Beehive","LittleBeehive","Little Beehive"},
["Honeycomb Apiary"]={"Honeycomb_Apiary","HoneycombApiary","Honeycomb Apiary"},["Mister Giant Mustache"]={"Mister_Giant_Mustache","MisterGiantMustache","Mister Giant Mustache"},
["Castle apiary"]={"Castle_Apiary","CastleApiary","Castle Apiary"},["Beekeeping factory"]={"Beekeeping_Factory","BeekeepingFactory","Beekeeping Factory"},
["Apiary tree"]={"Apiary_Tree","ApiaryTree","Apiary Tree"},["Basket Apiary"]={"Basket_Apiary","BasketApiary","Basket Apiary"},
["Swirl apiary"]={"Swirl_Apiary","SwirlApiary","Swirl Apiary"},["Large apiary"]={"Large_Apiary","LargeApiary","Large Apiary"},
["Honey barrel"]={"Honey_Barrel","HoneyBarrel","Honey Barrel"},["Rustic apiary"]={"Rustic_Apiary","RusticApiary","Rustic Apiary"},
["Flowering apiary"]={"Flowering_Apiary","FloweringApiary","Flowering Apiary","Apiary_Flowering","ApiaryFlowering","Apiary Flowering"},
},
WalkSpeed={min=16,max=200,default=16},JumpPower={min=30,max=200,default=50},FOV={min=40,max=140,default=70},
YT={FreeSpeed=60,FreeSpeedFast=180},AutoSell={minPrice=4, farmTime=30},
}

local Themes={}
local function T(n,bg,tb,sb,ct,cd,tg,tx,mu,di,ac,a2,su,dg,br,ic) Themes[n]={windowBg=bg,topbar=tb,sidebar=sb,content=ct,cardBg=cd,toggleOff=tg,text=tx,textMuted=mu,textDim=di,accent=ac,accent2=a2,success=su,danger=dg,border=br,icons=ic} end
T("Dark",Color3.fromRGB(18,18,22),Color3.fromRGB(14,14,18),Color3.fromRGB(22,22,27),Color3.fromRGB(24,24,29),Color3.fromRGB(32,32,38),Color3.fromRGB(55,55,65),Color3.fromRGB(240,240,245),Color3.fromRGB(150,150,165),Color3.fromRGB(95,95,110),Color3.fromRGB(160,120,255),Color3.fromRGB(255,90,150),Color3.fromRGB(90,210,130),Color3.fromRGB(230,70,90),Color3.fromRGB(45,45,55),{Inicio="🏠",AutoSuperHoney="🍯",AutoFarm="🐝",Player="👤",YT="🎬",Shaders="🌅",Settings="⚙",Sobre="ℹ"})
T("Navy",Color3.fromRGB(15,22,38),Color3.fromRGB(11,16,30),Color3.fromRGB(13,19,34),Color3.fromRGB(17,25,42),Color3.fromRGB(25,36,58),Color3.fromRGB(50,68,100),Color3.fromRGB(230,240,255),Color3.fromRGB(140,160,195),Color3.fromRGB(90,110,145),Color3.fromRGB(80,140,255),Color3.fromRGB(255,120,160),Color3.fromRGB(90,210,150),Color3.fromRGB(230,80,100),Color3.fromRGB(40,60,95),{Inicio="🌊",AutoSuperHoney="🍯",AutoFarm="🐋",Player="🐬",YT="🎥",Shaders="🌌",Settings="🧭",Sobre="📘"})
T("Purple",Color3.fromRGB(28,20,40),Color3.fromRGB(22,15,32),Color3.fromRGB(25,17,36),Color3.fromRGB(32,23,46),Color3.fromRGB(44,33,62),Color3.fromRGB(70,55,95),Color3.fromRGB(245,235,255),Color3.fromRGB(175,155,205),Color3.fromRGB(120,100,150),Color3.fromRGB(190,100,255),Color3.fromRGB(255,100,180),Color3.fromRGB(110,220,160),Color3.fromRGB(240,90,110),Color3.fromRGB(62,46,88),{Inicio="🔮",AutoSuperHoney="🍯",AutoFarm="🦄",Player="💫",YT="🎭",Shaders="🌠",Settings="⚙",Sobre="📜"})
T("Green",Color3.fromRGB(18,28,22),Color3.fromRGB(13,22,17),Color3.fromRGB(15,25,19),Color3.fromRGB(20,32,25),Color3.fromRGB(30,46,36),Color3.fromRGB(55,75,62),Color3.fromRGB(230,245,235),Color3.fromRGB(145,175,155),Color3.fromRGB(90,120,100),Color3.fromRGB(80,200,120),Color3.fromRGB(255,130,100),Color3.fromRGB(120,220,150),Color3.fromRGB(230,80,100),Color3.fromRGB(45,65,55),{Inicio="🌿",AutoSuperHoney="🍯",AutoFarm="🐢",Player="🌱",YT="🎬",Shaders="🌲",Settings="🧩",Sobre="📗"})
T("Neon",Color3.fromRGB(8,5,15),Color3.fromRGB(5,3,10),Color3.fromRGB(10,6,18),Color3.fromRGB(12,8,22),Color3.fromRGB(20,12,35),Color3.fromRGB(45,25,70),Color3.fromRGB(240,230,255),Color3.fromRGB(180,130,255),Color3.fromRGB(120,80,200),Color3.fromRGB(0,255,200),Color3.fromRGB(255,0,200),Color3.fromRGB(0,255,120),Color3.fromRGB(255,40,100),Color3.fromRGB(60,20,120),{Inicio="🏠",AutoSuperHoney="🍯",AutoFarm="🤖",Player="🚀",YT="📽",Shaders="🌈",Settings="💻",Sobre="🛰"})
T("Matrix",Color3.fromRGB(5,12,5),Color3.fromRGB(3,8,3),Color3.fromRGB(6,14,6),Color3.fromRGB(7,16,7),Color3.fromRGB(12,25,12),Color3.fromRGB(25,50,25),Color3.fromRGB(180,255,180),Color3.fromRGB(100,200,100),Color3.fromRGB(60,130,60),Color3.fromRGB(0,255,70),Color3.fromRGB(120,255,120),Color3.fromRGB(0,255,100),Color3.fromRGB(200,50,50),Color3.fromRGB(25,60,25),{Inicio="⌂",AutoSuperHoney="🍯",AutoFarm="🟩",Player="⏩",YT="📹",Shaders="🟢",Settings="📟",Sobre="📁"})
T("Ocean",Color3.fromRGB(10,30,40),Color3.fromRGB(6,22,30),Color3.fromRGB(8,26,35),Color3.fromRGB(12,34,45),Color3.fromRGB(18,50,65),Color3.fromRGB(35,80,100),Color3.fromRGB(210,245,255),Color3.fromRGB(120,200,220),Color3.fromRGB(70,140,165),Color3.fromRGB(0,200,220),Color3.fromRGB(120,240,180),Color3.fromRGB(80,230,180),Color3.fromRGB(230,80,110),Color3.fromRGB(30,70,90),{Inicio="🌊",AutoSuperHoney="🍯",AutoFarm="🐙",Player="🏄",YT="🎥",Shaders="🌊",Settings="🧜",Sobre="📘"})

local CurrentTheme="Dark"
local Colors=Themes[CurrentTheme]
local function clamp(v,lo,hi) if v<lo then return lo end if v>hi then return hi end return v end
local mainFrame
local UI
local ThemeTargets={}
local function reg(inst,props) table.insert(ThemeTargets,{inst=inst,props=props}) for p,k in pairs(props) do inst[p]=Colors[k] end return inst end
local themeHooks={}
local function onThemeChanged(fn) table.insert(themeHooks,fn) end
local OpacityTargets={}
local function buildOpacitySnapshot()
OpacityTargets={}
if not mainFrame then return end
for _,obj in ipairs(mainFrame:GetDescendants()) do
if not obj:GetAttribute("SkipOpacity") then
local e={inst=obj}
if obj:IsA("GuiObject") then e.baseBg=obj.BackgroundTransparency end
if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then e.baseTxt=obj.TextTransparency end
if obj:IsA("ImageLabel") or obj:IsA("ImageButton") then e.baseImg=obj.ImageTransparency end
table.insert(OpacityTargets,e)
end
end
end
local CurrentOpacity=100
local function applyOpacity(percent)
CurrentOpacity=percent
local f=1-(percent/100)
for _,e in ipairs(OpacityTargets) do
local obj=e.inst
if obj and obj.Parent then
if e.baseBg~=nil then obj.BackgroundTransparency=clamp(e.baseBg+(1-e.baseBg)*f,0,1) end
if e.baseTxt~=nil then obj.TextTransparency=clamp(e.baseTxt+(1-e.baseTxt)*f,0,1) end
if e.baseImg~=nil then obj.ImageTransparency=clamp(e.baseImg+(1-e.baseImg)*f,0,1) end
end
end
end
local function applyTheme(name)
if not Themes[name] then return end
CurrentTheme=name; Colors=Themes[name]
for _,entry in ipairs(ThemeTargets) do
if entry.inst and entry.inst.Parent then
for p,k in pairs(entry.props) do pcall(function() entry.inst[p]=Colors[k] end) end
end
end
for id,tab in pairs(UI.tabs) do if tab.iconLabel and Colors.icons[id] then tab.iconLabel.Text=Colors.icons[id] end end
for _,fn in ipairs(themeHooks) do pcall(fn) end
buildOpacitySnapshot(); applyOpacity(CurrentOpacity)
end

local Util={}
function Util.create(class,props,children)
local inst=Instance.new(class)
for k,v in pairs(props or {}) do if k~="Parent" then inst[k]=v end end
for _,c in ipairs(children or {}) do c.Parent=inst end
if props and props.Parent then inst.Parent=props.Parent end
return inst
end
function Util.getObjectPosition(obj)
if not obj or not obj.Parent then return nil end
if obj:IsA("BasePart") then return obj.Position end
if obj:IsA("Model") then
local ok,pv=pcall(function() return obj:GetPivot() end)
if ok and pv then return pv.Position end
local parts={}
for _,p in ipairs(obj:GetDescendants()) do if p:IsA("BasePart") then table.insert(parts,p) end end
if #parts==0 then return nil end
local s=Vector3.zero
for _,p in ipairs(parts) do s=s+p.Position end
return s/#parts
end
return nil
end
function Util.teleportTo(pos)
if not pos then return false end
local char=LP.Character; if not char then return false end
local hrp=char:FindFirstChild("HumanoidRootPart"); if not hrp then return false end
local target=CFrame.new(pos+Vector3.new(0,Config.TeleportHeight,0))
if pcall(function() char:PivotTo(target) end) then return true end
return pcall(function() hrp.CFrame=target end)
end
function Util.circleWalk(cp,r,dur)
local char=LP.Character; if not char then return end
local hrp=char:FindFirstChild("HumanoidRootPart"); if not hrp then return end
local t0=tick(); local a=0; local sd=0.03; local sp=(math.pi*2)/math.max(dur,0.1)
while tick()-t0<dur do
if not hrp.Parent then return end
a=a+sp*sd
local off=Vector3.new(math.cos(a)*r,0,math.sin(a)*r)
local np=cp+off
local tan=Vector3.new(-math.sin(a),0,math.cos(a))
pcall(function() hrp.CFrame=CFrame.new(np,np+tan) end)
task.wait(sd)
end
end
function Util.progressMove(targetPos, speed, checkActiveFn)
local char=LP.Character; if not char then return false end
local hrp=char:FindFirstChild("HumanoidRootPart")
local humanoid=char:FindFirstChildOfClass("Humanoid")
if not hrp or not humanoid then return false end
humanoid.PlatformStand=true
local startPos=hrp.Position
local dist=(Vector3.new(targetPos.X,startPos.Y,targetPos.Z)-startPos).Magnitude
local dur=math.max(dist/(speed or 45),0.8)
local t0=tick(); local sd=0.03
while tick()-t0<dur do
if checkActiveFn and not checkActiveFn() then humanoid.PlatformStand=false; return false end
if not hrp.Parent or not char.Parent then humanoid.PlatformStand=false; return false end
local alpha=math.clamp((tick()-t0)/dur,0,1); alpha=alpha*(2-alpha)
local currentPos=startPos:Lerp(targetPos+Vector3.new(0,Config.TeleportHeight,0),alpha)
pcall(function() hrp.CFrame=CFrame.new(currentPos,targetPos) end)
task.wait(sd)
end
pcall(function() hrp.CFrame=CFrame.new(targetPos+Vector3.new(0,Config.TeleportHeight,0),targetPos) end)
humanoid.PlatformStand=false
return true
end
local CollisionManager={originalCollisions={}}
function CollisionManager.disableCollisions()
local char=LP.Character; if not char then return end
CollisionManager.originalCollisions={}
for _,part in ipairs(char:GetDescendants()) do
if part:IsA("BasePart") then
CollisionManager.originalCollisions[part]=part.CanCollide
part.CanCollide=false
end
end
end
function CollisionManager.restoreCollisions()
for part,cc in pairs(CollisionManager.originalCollisions) do
if part and part.Parent then pcall(function() part.CanCollide=cc end) end
end
CollisionManager.originalCollisions={}
end
function Util.normalize(s) return (s:gsub("[%s_%-]","")):lower() end
function Util.isDescendantOf(o,a)
if not o or not a then return false end
local c=o; while c do if c==a then return true end c=c.Parent end return false
end
function Util.parseAssetId(inp)
if not inp or inp=="" then return nil,"vazio" end
inp=inp:gsub("^%s+",""):gsub("%s+$","")
if inp=="" then return nil,"vazio" end
if inp:match("^rbxassetid://") or inp:match("^rbxthumb://") then return inp end
if inp:match("^%d+$") then return "rbxassetid://"..inp end
local id=inp:match("[?&]id=(%d+)")
if id then return "rbxassetid://"..id end
return inp
end
function Util.formatTime(s)
s=math.max(0,math.floor(s))
return string.format("%02d:%02d:%02d",math.floor(s/3600),math.floor((s%3600)/60),s%60)
end
local lastCopy=0
function Util.copyToClipboard(text)
if tick()-lastCopy<2 then return false,"aguarde" end
lastCopy=tick()
local ok=pcall(function()
if setclipboard then setclipboard(text)
elseif toclipboard then toclipboard(text)
else error("indisponivel") end
end)
if ok then return true end
return false,"setclipboard indisponivel"
end

--=====================================================================
-- CLIQUE ANTI-CHEAT RESISTANT (nova função central)
--=====================================================================
function Util.isVisibleInHierarchy(obj)
    local cur = obj
    while cur and cur ~= game do
        if cur:IsA("GuiObject") then
            if not cur.Visible then return false end
            if cur.AbsoluteSize.X < 1 or cur.AbsoluteSize.Y < 1 then return false end
        end
        cur = cur.Parent
    end
    return true
end

-- Tenta clicar usando múltiplos métodos em ordem de "menos detectável primeiro"
-- Retorna (sucesso, método_usado)
function Util.clickButton(btn, labelForLog)
    if not btn then return false, "btn nil" end
    labelForLog = labelForLog or btn.Name

    if not Util.isVisibleInHierarchy(btn) then
        return false, labelForLog.." não visível"
    end

    -- MÉTODO 1: firesignal (executor) — dispara o sinal direto na engine
    -- É o menos detectável porque é o mesmo mecanismo que o Roblox usa internamente
    if type(firesignal) == "function" then
        local ok = pcall(function() firesignal(btn.MouseButton1Click) end)
        if ok then return true, "firesignal" end
    end

    -- MÉTODO 2: getconnections + Fire — dispara todas as conexões do sinal
    if type(getconnections) == "function" then
        local ok = pcall(function()
            local conns = getconnections(btn.MouseButton1Click)
            if conns and #conns > 0 then
                for _, c in ipairs(conns) do
                    if c.Fire then c:Fire() end
                end
            else
                error("sem conexões")
            end
        end)
        if ok then return true, "getconnections" end
    end

    -- MÉTODO 3: Fire direto nos eventos (alguns anti-cheats não pegam)
    local ok3 = pcall(function()
        btn.MouseButton1Down:Fire()
        task.wait(0.03)
        btn.MouseButton1Up:Fire()
        task.wait(0.03)
        btn.MouseButton1Click:Fire()
    end)
    if ok3 then return true, "Fire direto" end

    -- MÉTODO 4: :Activate() (fallback padrão, pode ser detectado)
    local ok4 = pcall(function() btn:Activate() end)
    if ok4 then return true, "Activate" end

    -- MÉTODO 5: VirtualInputManager (último recurso — mais detectável)
    local ok5 = pcall(function()
        local vim = game:GetService("VirtualInputManager")
        local pos = btn.AbsolutePosition + btn.AbsoluteSize * 0.5
        vim:SendMouseButtonEvent(pos.X, pos.Y, 0, true, game, 1)
        task.wait(0.05)
        vim:SendMouseButtonEvent(pos.X, pos.Y, 0, false, game, 1)
    end)
    if ok5 then return true, "VIM" end

    return false, "todos os métodos falharam"
end

local PlayerBase=nil
local function findPlayerBase()
local name,id=LP.Name,tostring(LP.UserId)
local pl=WS:FindFirstChild("Plots")
if pl then local p=pl:FindFirstChild(name) or pl:FindFirstChild(id); if p then return p end end
local bn=WS:FindFirstChild(name); if bn and (bn:IsA("Model") or bn:IsA("Folder")) then return bn end
end
PlayerBase=findPlayerBase()

local SpawnCache={position=nil,knownSpawnLocation=nil}
for _,o in ipairs(WS:GetDescendants()) do
if o:IsA("SpawnLocation") then SpawnCache.knownSpawnLocation=o; break end
end
local Connections={}
local function captureSpawn(c)
if not c then return end
local h=c:WaitForChild("HumanoidRootPart",5)
if h then SpawnCache.position=h.Position end
end
if LP.Character then task.spawn(captureSpawn,LP.Character) end
table.insert(Connections,LP.CharacterAdded:Connect(function(c) task.wait(1); captureSpawn(c) end))

local ItemCache,BusinessCache={},{}
local function addToCache(cache,key,inst)
cache[key]=cache[key] or {}
for _,v in ipairs(cache[key]) do if v==inst then return end end
table.insert(cache[key],inst)
end
local function removeFromCache(cache,key,inst)
local l=cache[key]; if not l then return end
for i,v in ipairs(l) do if v==inst then table.remove(l,i); return end end
end

local itemNameSet={}
for _,it in ipairs(Config.SuperHoneyItems) do itemNameSet[it.name]=true end

local bVSet,bVList={},{}
for comm,vs in pairs(Config.Businesses) do
for _,v in ipairs(vs) do
local n=Util.normalize(v)
bVSet[n]=comm
table.insert(bVList,{normalized=n,commercial=comm})
end
end
table.sort(bVList,function(a,b) return #a.normalized>#b.normalized end)

local function matchBusiness(name)
local n=Util.normalize(name)
if bVSet[n] then return bVSet[n] end
for _,e in ipairs(bVList) do
if #e.normalized>=8 and n:find(e.normalized,1,true) then return e.commercial end
end
return nil
end

local function scanInstance(o)
if not (o:IsA("BasePart") or o:IsA("Model")) then return end
if itemNameSet[o.Name] then addToCache(ItemCache,o.Name,o) end
local c=matchBusiness(o.Name)
if c then addToCache(BusinessCache,c,o) end
end
local function scanAll() for _,o in ipairs(WS:GetDescendants()) do scanInstance(o) end end
table.insert(Connections,WS.DescendantAdded:Connect(scanInstance))
table.insert(Connections,WS.DescendantRemoving:Connect(function(o)
if not (o:IsA("BasePart") or o:IsA("Model")) then return end
if itemNameSet[o.Name] then removeFromCache(ItemCache,o.Name,o) end
local c=matchBusiness(o.Name)
if c then removeFromCache(BusinessCache,c,o) end
end))
scanAll()
task.spawn(function() while true do task.wait(Config.RescanInterval); scanAll() end end)

local function isRejected(o)
local rejectedSet={}
for _,n in ipairs(Config.RejectedContainers) do rejectedSet[n:lower()]=true end
local cur=o
while cur and cur~=game do
if rejectedSet[cur.Name:lower()] then return true end
cur=cur.Parent
end
return false
end
local function isInsideOf(o,parentName)
local target=parentName:lower(); local cur=o
while cur and cur~=game do
if cur.Name:lower()==target then return true end
cur=cur.Parent
end
return false
end
local function passesFilter(o,entry)
if isRejected(o) then return false end
if entry.requireParent and not isInsideOf(o,entry.requireParent) then return false end
if entry.rejectIn and isInsideOf(o,entry.rejectIn) then return false end
return true
end
local function isValidBusiness(o,pos)
if isRejected(o) then return false end
if SpawnCache.position and pos then
if (pos-SpawnCache.position).Magnitude>Config.MaxBusinessDistance then return false end
end
if PlayerBase and PlayerBase.Parent then return Util.isDescendantOf(o,PlayerBase) end
return false
end

print("[DarkHub] 2/9 - Base + caches OK")

local function createAutoSuperHoneyEngine(items,label,defaultStatus)
local Engine={active=false,thread=nil,processed=0,current=nil,isPriority=false,status=defaultStatus or (label.." desativado"),visited={},items=items,label=label}
local function findTarget()
local best,bp=nil,math.huge; local now=tick()
for _,entry in ipairs(Engine.items) do
local l=ItemCache[entry.name]
if l then
for i=#l,1,-1 do
local o=l[i]
if not o or not o.Parent then table.remove(l,i)
else
local passes=passesFilter(o,entry)
if passes then
local last=Engine.visited[o]
if not last or (now-last)>Config.VisitCooldown then
local pos=Util.getObjectPosition(o)
if pos and entry.priority<bp then
best={obj=o,name=entry.name,priority=entry.priority,pos=pos}; bp=entry.priority
end
break
end
else table.remove(l,i) end
end
end
end
end
return best
end
local function countFound()
local n=0
for _,e in ipairs(Engine.items) do
local l=ItemCache[e.name]
if l then for _,o in ipairs(l) do if o and o.Parent and passesFilter(o,e) then n=n+1 end end end
end
return n
end
function Engine.start(onU)
if Engine.active then return end
Engine.active=true; Engine.processed=0; Engine.status="Procurando itens"
Engine.thread=task.spawn(function()
while Engine.active do
local t=findTarget()
if t then
Engine.current=t.name; Engine.isPriority=t.priority<=3
Engine.status="Indo para "..t.name
onU()
if Util.teleportTo(t.pos) then
Engine.processed=Engine.processed+1
Engine.visited[t.obj]=tick()
task.wait(0.1)
if t.obj and t.obj.Parent then
local cp=Util.getObjectPosition(t.obj)
if cp then Util.circleWalk(cp,1.5,0.7) end
end
end
else
Engine.current=nil; Engine.isPriority=false
Engine.status="Procurando itens"
end
onU(); task.wait(0.2)
end
Engine.status=label.." desativado"; Engine.current=nil; onU()
end)
end
function Engine.stop(onU)
Engine.active=false
if Engine.thread then pcall(task.cancel,Engine.thread); Engine.thread=nil end
Engine.status=label.." desativado"
if onU then onU() end
end
function Engine.countFound() return countFound() end
return Engine
end

local AutoSuperHoney=createAutoSuperHoneyEngine(Config.SuperHoneyItems,"Auto Super Honey","Auto Super Honey desativado")

local AutoFarm={active=false,thread=nil,processed=0,current=nil,status="Auto Farm desativado",visited={},state="IDLE",lastTargetPos=nil,lastTargetObj=nil}
local function findBusinessTarget()
local now=tick(); local best,bl=nil,nil
for _,l in pairs(BusinessCache) do
for i=#l,1,-1 do
local o=l[i]
if not o or not o.Parent then table.remove(l,i)
else
local last=AutoFarm.visited[o] or 0
if (now-last)>Config.VisitCooldown then
local pos=Util.getObjectPosition(o)
if pos and isValidBusiness(o,pos) then
if bl==nil or last<bl then bl=last; best={obj=o,name=o.Name,pos=pos} end
end
end
end
end
end
return best
end
local function countBusinessFound()
local n=0
for _,l in pairs(BusinessCache) do
for _,o in ipairs(l) do
if o and o.Parent then
local pos=Util.getObjectPosition(o)
if pos and isValidBusiness(o,pos) then n=n+1 end
end
end
end
return n
end
function AutoFarm.goToSpawn()
AutoFarm.state="GO_TO_BASE"; AutoFarm.status="Etapa 1: Indo para a base..."
local success=false
if SpawnCache.position then success=Util.teleportTo(SpawnCache.position)
elseif SpawnCache.knownSpawnLocation then success=Util.teleportTo(SpawnCache.knownSpawnLocation.Position) end
task.wait(1.0)
return success
end
function AutoFarm.start(onU)
if AutoFarm.active then return end
AutoFarm.active=true; AutoFarm.processed=0; AutoFarm.state="GO_TO_BASE"
AutoFarm.thread=task.spawn(function()
AutoFarm.goToSpawn()
if onU then onU() end
local ec=0
while AutoFarm.active do
local char=LP.Character
if char and char:FindFirstChild("HumanoidRootPart") and SpawnCache.position then
if (char.HumanoidRootPart.Position-SpawnCache.position).Magnitude>Config.ReturnToBaseDistance then
AutoFarm.goToSpawn()
if onU then onU() end
end
end
local t=findBusinessTarget()
if t then
ec=0; AutoFarm.current=t.name; AutoFarm.lastTargetPos=t.pos; AutoFarm.lastTargetObj=t.obj
AutoFarm.state="GO_TO_APIARY"; AutoFarm.status="Etapa 2: Indo ao apiário ("..t.name..")..."
if onU then onU() end
local reached=Util.progressMove(t.pos,50,function() return AutoFarm.active end)
if reached and AutoFarm.active then
AutoFarm.status="Etapa 3: Estabilizando..."
if onU then onU() end
task.wait(0.4)
AutoFarm.state="FARMING"; AutoFarm.status="Etapa 4: Coletando"
if onU then onU() end
AutoFarm.processed=AutoFarm.processed+1
AutoFarm.visited[t.obj]=tick()
local cp=Util.getObjectPosition(t.obj) or t.pos
if cp and AutoFarm.active then Util.circleWalk(cp,2.0,2.5) end
end
else
AutoFarm.current=nil; AutoFarm.state="IDLE"; AutoFarm.status="Procurando apiários..."
ec=ec+1
if ec>=5 then AutoFarm.visited={}; ec=0 end
end
if onU then onU() end
task.wait(0.5)
end
AutoFarm.state="IDLE"; AutoFarm.status="Auto Farm desativado"; AutoFarm.current=nil
if onU then onU() end
end)
end
function AutoFarm.stop(onU)
AutoFarm.active=false; AutoFarm.state="IDLE"
if AutoFarm.thread then pcall(task.cancel,AutoFarm.thread); AutoFarm.thread=nil end
AutoFarm.status="Auto Farm desativado"; AutoFarm.current=nil
if onU then onU() end
end

--=====================================================================
-- AUTO SELL
--=====================================================================
local AutoSell={active=false,thread=nil,status="Auto Sell desativado",minPrice=Config.AutoSell.minPrice,farmTime=Config.AutoSell.farmTime,lastPrice=nil,lastTotal=nil,soldCount=0,phase="IDLE",lastClickMethod="-"}

local function findUrsoPrompt()
for _,obj in ipairs(WS:GetDescendants()) do
if obj:IsA("ProximityPrompt") then
local fn=obj:GetFullName():lower()
local pn=obj.Parent and obj.Parent.Name:lower() or ""
if fn:find("urso") or fn:find("bear") or pn:find("urso") or pn:find("bear") then return obj end
end
end
return nil
end
local function getSellPanel()
local m=PG:FindFirstChild("MainGUI"); if not m then return nil end
local s=m:FindFirstChild("Shops"); if not s then return nil end
local h=s:FindFirstChild("Honey"); if not h then return nil end
return h:FindFirstChild("Background")
end
local function getCurrentPriceLabel()
local p=getSellPanel(); if not p then return nil end
for _,o in ipairs(p:GetDescendants()) do if o:IsA("TextLabel") and o.Name=="CurrentPrice" then return o end end
return nil
end
local function getTotalLabel()
local p=getSellPanel(); if not p then return nil end
for _,o in ipairs(p:GetDescendants()) do if o:IsA("TextLabel") and o.Text:find("Total") then return o end end
return nil
end
local function parsePrice(text)
local n=text:match("%$(%d+)"); return n and tonumber(n) or nil
end
local function getSellButton()
local p=getSellPanel(); if not p then return nil end
local sb=p:FindFirstChild("SellButtonBack"); if not sb then return nil end
return sb:FindFirstChild("Button")
end
local function getCloseButton()
local p=getSellPanel(); if not p then return nil end
local cb=p:FindFirstChild("ButtonCloseBack"); if not cb then return nil end
return cb:FindFirstChild("CloseButton")
end
local function moveToUrso()
AutoSell.phase="SELLING"; AutoSell.status="Etapa 2: Indo até o Urso..."
local prompt=findUrsoPrompt(); if not prompt then return false,"Prompt do Urso não encontrado" end
local urso=prompt.Parent
local part=urso and urso:FindFirstChildWhichIsA("BasePart",true) or urso
if not part then return false,"Urso sem BasePart válida" end
local targetPos=part.Position+Vector3.new(0,3,4)
local reached=Util.progressMove(targetPos,45,function() return AutoSell.active end)
return reached
end
local function fireUrsoPrompt()
local prompt=findUrsoPrompt(); if not prompt then return false end
local ok=pcall(function()
if fireproximityprompt then fireproximityprompt(prompt)
else prompt:InputHoldBegin(); task.wait(0.15); prompt:InputHoldEnd() end
end)
return ok
end

AutoSell.onUpdate=nil
local function notifyUI()
if AutoSell.onUpdate then pcall(AutoSell.onUpdate) end
end

local function runSellCycle()
AutoSell.phase="SELLING"; AutoSell.status="Etapa 2: Indo até o Urso..."; notifyUI()
local okMove,errMove=moveToUrso()
if not okMove then
AutoSell.status="Erro ao mover: "..tostring(errMove); notifyUI(); return false
end
AutoSell.status="Etapa 3: Abrindo loja..."; notifyUI()
fireUrsoPrompt(); task.wait(1.5)

local panel=getSellPanel()
if not panel then AutoSell.status="Painel não abriu"; notifyUI(); return false end

local priceLbl=getCurrentPriceLabel()
local price=priceLbl and parsePrice(priceLbl.Text) or nil
AutoSell.lastPrice=price
local totalLbl=getTotalLabel()
if totalLbl then AutoSell.lastTotal=totalLbl.Text end

-- Botão de FECHAR sempre tenta clicar
local function tentarFechar()
    local cb=getCloseButton()
    if cb then
        local ok,m = Util.clickButton(cb, "Fechar")
        AutoSell.lastClickMethod = "Fechar: "..tostring(m)
        task.wait(0.5)
        return ok
    end
    return false
end

if not price then
    AutoSell.status="Preço não lido — fechando"; notifyUI()
    tentarFechar()
    return false
end

if price < AutoSell.minPrice then
    AutoSell.status=string.format("Preço $%d < min $%d — pulando",price,AutoSell.minPrice); notifyUI()
    tentarFechar()
    return false
end

local sellBtn=getSellButton()
if not sellBtn then
    AutoSell.status="Botão de venda não encontrado"; notifyUI()
    tentarFechar()
    return false
end

-- VENDE! (sem offset — clique direto no centro)
AutoSell.status=string.format("Vendendo a $%d/mel!",price); notifyUI()
local okSell, methodSell = Util.clickButton(sellBtn, "Vender")
AutoSell.lastClickMethod = "Vender: "..tostring(methodSell)
task.wait(1.0)

-- Fecha painel
tentarFechar()

AutoSell.soldCount=AutoSell.soldCount+1
AutoSell.status=string.format("Vendido! (#%d a $%d) via %s",AutoSell.soldCount,price,tostring(methodSell))
notifyUI()
return true
end

local function runFarmPhase(onFarmUpdate)
AutoSell.phase="RETURNING"; AutoSell.status="Etapa 4: Voltando pro apiário..."; notifyUI()
if AutoFarm.lastTargetPos then
Util.progressMove(AutoFarm.lastTargetPos,45,function() return AutoSell.active end)
task.wait(0.5)
else
AutoFarm.goToSpawn(); task.wait(0.8)
end
AutoSell.phase="FARMING"
AutoFarm.start(onFarmUpdate)
local waited=0
while AutoSell.active and waited<AutoSell.farmTime do
task.wait(0.5); waited=waited+0.5
AutoSell.status=string.format("Farmando... (%.0fs / %.0fs)",waited,AutoSell.farmTime)
notifyUI()
end
AutoFarm.stop(onFarmUpdate)
task.wait(0.3)
end

local farmUpdateFn=nil
function AutoSell.start(onU,onFarmUpdate)
if AutoSell.active then return end
AutoSell.active=true; AutoSell.phase="SELLING"; AutoSell.status="Iniciando..."
AutoSell.onUpdate=onU; farmUpdateFn=onFarmUpdate; notifyUI()
CollisionManager.disableCollisions()
AutoSell.thread=task.spawn(function()
while AutoSell.active do
local wasFarmActive=AutoFarm.active
if AutoFarm.active then AutoFarm.stop(farmUpdateFn) end
local okSell=pcall(runSellCycle)
if not AutoSell.active then break end
if okSell and wasFarmActive and AutoSell.active then
pcall(function() runFarmPhase(farmUpdateFn) end)
else
task.wait(1.0)
end
end
CollisionManager.restoreCollisions()
AutoSell.status="Auto Sell desativado"; AutoSell.phase="IDLE"; notifyUI()
end)
end
function AutoSell.stop(onU)
AutoSell.active=false
if AutoSell.thread then pcall(task.cancel,AutoSell.thread); AutoSell.thread=nil end
pcall(function() AutoFarm.stop(farmUpdateFn) end)
CollisionManager.restoreCollisions()
AutoSell.status="Auto Sell desativado"; AutoSell.phase="IDLE"
if onU then onU() end
notifyUI()
end
function AutoSell.setMinPrice(v) AutoSell.minPrice=v end
function AutoSell.setFarmTime(v) AutoSell.farmTime=v end

print("[DarkHub] 3/9 - Modulos OK")

local WalkSpeed={active=false,value=Config.WalkSpeed.default,originalSpeed=nil}
local function applyWS() local c=LP.Character; if not c then return end local h=c:FindFirstChildOfClass("Humanoid"); if not h then return end if WalkSpeed.originalSpeed==nil then WalkSpeed.originalSpeed=h.WalkSpeed end h.WalkSpeed=WalkSpeed.value end
local function restoreWS() local c=LP.Character; if not c then return end local h=c:FindFirstChildOfClass("Humanoid"); if not h then return end if WalkSpeed.originalSpeed then h.WalkSpeed=WalkSpeed.originalSpeed end end
function WalkSpeed.setActive(s) WalkSpeed.active=s; if s then applyWS() else restoreWS() end end
function WalkSpeed.setValue(v) WalkSpeed.value=v; if WalkSpeed.active then applyWS() end end

local Noclip={active=false,original={},conn=nil}
local function applyNC()
if not Noclip.active then return end
local c=LP.Character; if not c then return end
for _,p in ipairs(c:GetDescendants()) do if p:IsA("BasePart") then if Noclip.original[p]==nil then Noclip.original[p]=p.CanCollide end if p.CanCollide then p.CanCollide=false end end end
end
local function restoreNC()
for p,v in pairs(Noclip.original) do if p and p.Parent then pcall(function() p.CanCollide=v end) end end
Noclip.original={}
end
function Noclip.setActive(s)
Noclip.active=s
if s then
if not Noclip.conn then Noclip.conn=Run.Stepped:Connect(applyNC) end
applyNC()
else
if Noclip.conn then Noclip.conn:Disconnect(); Noclip.conn=nil end
restoreNC()
end
end

local JumpPower={active=false,value=Config.JumpPower.default,oP=nil,oH=nil}
local function applyJP()
local c=LP.Character; if not c then return end
local h=c:FindFirstChildOfClass("Humanoid"); if not h then return end
if JumpPower.oP==nil then JumpPower.oP=h.JumpPower or 50 end
if JumpPower.oH==nil then JumpPower.oH=h.JumpHeight or 7.5 end
if h.UseJumpPower then h.JumpPower=JumpPower.value else local g=WS.Gravity; if g>0 then h.JumpHeight=(JumpPower.value*JumpPower.value)/(2*g) end end
end
local function restoreJP()
local c=LP.Character; if not c then return end
local h=c:FindFirstChildOfClass("Humanoid"); if not h then return end
if h.UseJumpPower then if JumpPower.oP then h.JumpPower=JumpPower.oP end else if JumpPower.oH then h.JumpHeight=JumpPower.oH end end
end
function JumpPower.setActive(s) JumpPower.active=s; if s then applyJP() else restoreJP() end end
function JumpPower.setValue(v) JumpPower.value=v; if JumpPower.active then applyJP() end end

local InfJump={active=false,conn=nil}
local function iJump() if not InfJump.active then return end local c=LP.Character; if not c then return end local h=c:FindFirstChildOfClass("Humanoid"); if not h then return end pcall(function() h:ChangeState(Enum.HumanoidStateType.Jumping) end) end
function InfJump.setActive(s) InfJump.active=s; if s then if not InfJump.conn then InfJump.conn=UIS.JumpRequest:Connect(iJump) end else if InfJump.conn then InfJump.conn:Disconnect(); InfJump.conn=nil end end end

local FOV={active=false,value=Config.FOV.default,original=nil}
local function applyFOV() local c=WS.CurrentCamera; if not c then return end if FOV.original==nil then FOV.original=c.FieldOfView end c.FieldOfView=FOV.value end
local function restoreFOV() local c=WS.CurrentCamera; if not c then return end if FOV.original then c.FieldOfView=FOV.original end end
function FOV.setActive(s) FOV.active=s; if s then applyFOV() else restoreFOV() end end
function FOV.setValue(v) FOV.value=v; if FOV.active then applyFOV() end end
table.insert(Connections,WS:GetPropertyChangedSignal("CurrentCamera"):Connect(function() if FOV.active then task.wait(0.1); applyFOV() end end))

local Fullbright={active=false,original={}}
local function applyFB()
if not Fullbright.original.Ambient then Fullbright.original={Ambient=LT.Ambient,OutdoorAmbient=LT.OutdoorAmbient,Brightness=LT.Brightness,ClockTime=LT.ClockTime,FogEnd=LT.FogEnd,GlobalShadows=LT.GlobalShadows,EnvironmentDiffuseScale=LT.EnvironmentDiffuseScale,EnvironmentSpecularScale=LT.EnvironmentSpecularScale} end
LT.Ambient=Color3.fromRGB(178,178,178); LT.OutdoorAmbient=Color3.fromRGB(178,178,178); LT.Brightness=2; LT.ClockTime=12; LT.FogEnd=1e6; LT.GlobalShadows=false
end
local function restoreFB() for k,v in pairs(Fullbright.original) do pcall(function() LT[k]=v end) end Fullbright.original={} end
function Fullbright.setActive(s) Fullbright.active=s; if s then applyFB() else restoreFB() end end

local Waypoints={list={}}
function Waypoints.add(n,p) table.insert(Waypoints.list,{name=n,pos=p}) end
function Waypoints.remove(i) table.remove(Waypoints.list,i) end
function Waypoints.goTo(i) local w=Waypoints.list[i]; if not w then return false end return Util.teleportTo(w.pos) end

local AntiAFK={active=false}
local function onIdled()
if not AntiAFK.active then return end
local vu=game:GetService("VirtualUser")
if vu then pcall(function() vu:CaptureController(); vu:ClickButton2(Vector2.new()) end) end
end
table.insert(Connections,LP.Idled:Connect(onIdled))
function AntiAFK.setActive(s) AntiAFK.active=s end
table.insert(Connections,LP.CharacterAdded:Connect(function()
task.wait(0.5)
Noclip.original={}; WalkSpeed.originalSpeed=nil; JumpPower.oP=nil; JumpPower.oH=nil
if WalkSpeed.active then applyWS() end
if JumpPower.active then applyJP() end
pcall(CollisionManager.restoreCollisions)
if AutoSell.active then AutoSell.stop() end
end))

local YT={recMode=false,freeCam=false,freeCamConn=nil,savedCamType=nil,savedCamSubj=nil,savedFOV=nil,zoomLevel=0,originalFOV=nil,panConn=nil,panActive=false,panIntensity=0.15,transDuration=1.5,transA=nil,transB=nil,markers={},timerRunning=false,timerPaused=false,timerStart=0,timerElapsed=0,sceneName="Cena 1",takeNumber=1,infoVisible=true,thumbnailMode=false,cinematicMode=false,cinematicConn=nil}
local function ytFreeCamStart()
local cam=WS.CurrentCamera; if not cam then return end
YT.savedCamType=cam.CameraType; YT.savedCamSubj=cam.CameraSubject; YT.savedFOV=cam.FieldOfView
local cf=cam.CFrame; cam.CameraType=Enum.CameraType.Scriptable
local keys={}
YT.freeCamConn=Run.RenderStepped:Connect(function(dt)
if not YT.freeCam or not WS.CurrentCamera then return end
local c=WS.CurrentCamera
local speed=UIS:IsKeyDown(Enum.KeyCode.LeftShift) and Config.YT.FreeSpeedFast or Config.YT.FreeSpeed
local mv=Vector3.zero
if keys[Enum.KeyCode.W] then mv=mv+c.CFrame.LookVector end
if keys[Enum.KeyCode.S] then mv=mv-c.CFrame.LookVector end
if keys[Enum.KeyCode.A] then mv=mv-c.CFrame.RightVector end
if keys[Enum.KeyCode.D] then mv=mv+c.CFrame.RightVector end
if keys[Enum.KeyCode.Space] then mv=mv+Vector3.new(0,1,0) end
if keys[Enum.KeyCode.LeftControl] then mv=mv-Vector3.new(0,1,0) end
if mv.Magnitude>0 then cf=cf+mv.Unit*speed*dt end
c.CFrame=cf
end)
YT._kB=UIS.InputBegan:Connect(function(inp,gp) if gp then return end keys[inp.KeyCode]=true end)
YT._kE=UIS.InputEnded:Connect(function(inp) keys[inp.KeyCode]=nil end)
end
local function ytFreeCamStop()
YT.freeCam=false
if YT.freeCamConn then YT.freeCamConn:Disconnect(); YT.freeCamConn=nil end
if YT._kB then YT._kB:Disconnect(); YT._kB=nil end
if YT._kE then YT._kE:Disconnect(); YT._kE=nil end
local c=WS.CurrentCamera
if c then c.CameraType=YT.savedCamType or Enum.CameraType.Custom; if YT.savedCamSubj then c.CameraSubject=YT.savedCamSubj end; if YT.savedFOV then c.FieldOfView=YT.savedFOV end end
end
function YT.setFreeCam(s) if s==YT.freeCam then return end YT.freeCam=s; if s then ytFreeCamStart() else ytFreeCamStop() end end
function YT.zoom(step) local c=WS.CurrentCamera; if not c then return end if YT.originalFOV==nil then YT.originalFOV=c.FieldOfView end YT.zoomLevel=clamp(YT.zoomLevel+step,-30,40); c.FieldOfView=clamp(YT.originalFOV-YT.zoomLevel,20,120) end
function YT.resetZoom() local c=WS.CurrentCamera; if not c then return end YT.zoomLevel=0; if YT.originalFOV then c.FieldOfView=YT.originalFOV end end
function YT.startPan(dir)
local c=WS.CurrentCamera; if not c then return end
if YT.panConn then YT.panConn:Disconnect() end
YT.panActive=true
local base=c.CFrame; local t0=tick()
YT.panConn=Run.RenderStepped:Connect(function()
if not YT.panActive then return end
local t=tick()-t0
local ang=math.sin(t*1.5)*YT.panIntensity*0.05
if dir=="vertical" then c.CFrame=base*CFrame.Angles(ang,0,0) else c.CFrame=base*CFrame.Angles(0,ang,0) end
end)
end
function YT.stopPan() YT.panActive=false; if YT.panConn then YT.panConn:Disconnect(); YT.panConn=nil end end
function YT.transitionCamera(from,to,dur)
local c=WS.CurrentCamera; if not c then return end
local st=c.CameraType; c.CameraType=Enum.CameraType.Scriptable
local t0=tick(); local conn
conn=Run.RenderStepped:Connect(function()
local a=clamp((tick()-t0)/dur,0,1); a=a*a*(3-2*a)
c.CFrame=from:Lerp(to,a)
if a>=1 then conn:Disconnect(); c.CameraType=st end
end)
end
function YT.spectate(target)
local c=WS.CurrentCamera; if not c then return false,"sem camera" end
local ch=target and target.Character; local h=ch and ch:FindFirstChildOfClass("Humanoid")
if not h then return false,"sem humanoid" end
if not YT.savedCamSubj then YT.savedCamSubj=c.CameraSubject end
c.CameraSubject=h; c.CameraType=Enum.CameraType.Custom
return true
end
function YT.stopSpectate()
local c=WS.CurrentCamera; if not c then return end
local myCh=LP.Character; local myH=myCh and myCh:FindFirstChildOfClass("Humanoid")
if myH then c.CameraSubject=myH end
end
function YT.timerStart() YT.timerRunning=true; YT.timerPaused=false; YT.timerStart=tick()-YT.timerElapsed end
function YT.timerPause() if not YT.timerRunning or YT.timerPaused then return end YT.timerElapsed=tick()-YT.timerStart; YT.timerPaused=true end
function YT.timerResume() if not YT.timerPaused then return end YT.timerStart=tick()-YT.timerElapsed; YT.timerPaused=false end
function YT.timerReset() YT.timerElapsed=0; YT.timerRunning=false; YT.timerPaused=false end
function YT.timerGet() if YT.timerRunning and not YT.timerPaused then return tick()-YT.timerStart end return YT.timerElapsed end
function YT.cinematicStart()
local c=WS.CurrentCamera; if not c then return end
if YT.cinematicConn then YT.cinematicConn:Disconnect() end
local base=c.CFrame; local t0=tick()
YT.cinematicConn=Run.RenderStepped:Connect(function()
if not YT.cinematicMode or not WS.CurrentCamera then return end
local ang=math.sin((tick()-t0)*0.3)*0.02
WS.CurrentCamera.CFrame=base*CFrame.Angles(0,ang,0)
end)
end
function YT.cinematicStop() YT.cinematicMode=false; if YT.cinematicConn then YT.cinematicConn:Disconnect(); YT.cinematicConn=nil end end

local Shaders={activePreset=nil,original=nil,owned={},lastProfile="Balanceado"}
local function shSaveOrig()
if Shaders.original then return end
Shaders.original={Ambient=LT.Ambient,OutdoorAmbient=LT.OutdoorAmbient,Brightness=LT.Brightness,ClockTime=LT.ClockTime,GeographicLatitude=LT.GeographicLatitude,FogColor=LT.FogColor,FogStart=LT.FogStart,FogEnd=LT.FogEnd,GlobalShadows=LT.GlobalShadows,EnvironmentDiffuseScale=LT.EnvironmentDiffuseScale,EnvironmentSpecularScale=LT.EnvironmentSpecularScale,ExposureCompensation=LT.ExposureCompensation,ColorShift_Top=LT.ColorShift_Top,ColorShift_Bottom=LT.ColorShift_Bottom}
end
local function shEnsure(cl,name)
local e=LT:FindFirstChild(name); if e and e:IsA(cl) then return e end
local fx=Instance.new(cl); fx.Name=name; fx.Parent=LT; Shaders.owned[name]=fx; return fx
end
local function shClear() for _,fx in pairs(Shaders.owned) do if fx and fx.Parent then fx:Destroy() end end Shaders.owned={} end
local function shRestore()
if not Shaders.original then return end
for k,v in pairs(Shaders.original) do pcall(function() LT[k]=v end) end
shClear(); Shaders.activePreset=nil
end
local function shL(p) for k,v in pairs(p) do pcall(function() LT[k]=v end) end end
local function shCC(p) local cc=shEnsure("ColorCorrectionEffect","DarkHub_CC"); for k,v in pairs(p) do pcall(function() cc[k]=v end) end cc.Enabled=true end
local function shBl(i,s,t) local b=shEnsure("BloomEffect","DarkHub_Bloom"); b.Intensity=i; b.Size=s; b.Threshold=t; b.Enabled=true end
local function shSR(i,s) local sr=shEnsure("SunRaysEffect","DarkHub_SunRays"); sr.Intensity=i; sr.Spread=s; sr.Enabled=true end
local function shDOF(far,foc,rad,near) local d=shEnsure("DepthOfFieldEffect","DarkHub_DOF"); d.FarIntensity=far; d.FocusDistance=foc; d.InFocusRadius=rad; d.NearIntensity=near; d.Enabled=true end
local function shAt(d,h,c) local a=shEnsure("Atmosphere","DarkHub_Atmo"); a.Density=d; a.Haze=h; a.Color=c or Color3.fromRGB(199,199,199); a.Decay=Color3.fromRGB(106,112,125); a.Glare=0.3; a.Offset=0.25 end
local Presets={
Realista=function() shL({Ambient=Color3.fromRGB(80,80,80),OutdoorAmbient=Color3.fromRGB(110,110,110),Brightness=2.2,ClockTime=14,FogEnd=1500,EnvironmentDiffuseScale=0.4,EnvironmentSpecularScale=0.4}) shCC({Brightness=0,Contrast=0.1,Saturation=0.1}) shBl(0.6,20,1.2) shSR(0.08,0.8) shAt(0.3,0.5) end,
Cinematico=function() shL({Ambient=Color3.fromRGB(60,60,70),OutdoorAmbient=Color3.fromRGB(90,90,100),Brightness=1.8,ClockTime=17,FogEnd=1200,EnvironmentDiffuseScale=0.3,EnvironmentSpecularScale=0.5}) shCC({Brightness=0.02,Contrast=0.25,Saturation=0.15,TintColor=Color3.fromRGB(255,240,220)}) shBl(0.9,24,1.0) shSR(0.15,0.9) shAt(0.35,0.6) end,
GoldenHour=function() shL({Ambient=Color3.fromRGB(120,90,60),OutdoorAmbient=Color3.fromRGB(200,140,90),Brightness=2.5,ClockTime=17.8,FogEnd=2000,FogColor=Color3.fromRGB(255,180,120)}) shCC({Brightness=0.05,Contrast=0.15,Saturation=0.25,TintColor=Color3.fromRGB(255,200,140)}) shBl(1.0,26,1.1) shSR(0.25,1.0) shAt(0.4,0.7,Color3.fromRGB(255,200,150)) end,
BlueHour=function() shL({Ambient=Color3.fromRGB(40,50,80),OutdoorAmbient=Color3.fromRGB(70,90,130),Brightness=1.5,ClockTime=19.5,FogEnd=1400,FogColor=Color3.fromRGB(80,110,160)}) shCC({Brightness=-0.02,Contrast=0.15,Saturation=-0.05,TintColor=Color3.fromRGB(180,210,255)}) shBl(0.5,22,1.3) shSR(0.06,0.7) shAt(0.45,0.6,Color3.fromRGB(140,170,220)) end,
Fantasy=function() shL({Ambient=Color3.fromRGB(120,80,160),OutdoorAmbient=Color3.fromRGB(160,120,200),Brightness=2.8,ClockTime=15,FogEnd=1800,FogColor=Color3.fromRGB(200,160,255)}) shCC({Brightness=0.05,Contrast=0.2,Saturation=0.4,TintColor=Color3.fromRGB(230,200,255)}) shBl(1.2,28,0.9) shSR(0.2,1.0) shAt(0.5,0.5,Color3.fromRGB(200,180,255)) end,
UltraRealista=function() shL({Ambient=Color3.fromRGB(50,50,55),OutdoorAmbient=Color3.fromRGB(85,85,90),Brightness=2.0,ClockTime=15.5,FogEnd=2500,EnvironmentDiffuseScale=0.5,EnvironmentSpecularScale=0.6,GlobalShadows=true}) shCC({Brightness=0.02,Contrast=0.3,Saturation=0.2,TintColor=Color3.fromRGB(255,250,240)}) shBl(1.0,25,1.0) shSR(0.18,0.9) shAt(0.4,0.5) shDOF(0.5,40,20,0) end,
}
local Profiles={
Performance=function() shCC({Brightness=0,Contrast=0.08,Saturation=0.08}) shBl(0.3,16,1.5) end,
Balanceado=function() shCC({Brightness=0.02,Contrast=0.15,Saturation=0.15}) shBl(0.7,20,1.1) shSR(0.1,0.8) shAt(0.3,0.5) end,
Ultra=function() shCC({Brightness=0.02,Contrast=0.25,Saturation=0.25}) shBl(1.0,25,1.0) shSR(0.2,1.0) shAt(0.4,0.6) shDOF(0.4,45,25,0) end,
}
function Shaders.setPreset(name)
if name=="Original" then shRestore(); return end
if not Presets[name] then return end
shSaveOrig(); shClear(); Shaders.activePreset=name
pcall(Presets[name])
if Profiles[Shaders.lastProfile] then pcall(Profiles[Shaders.lastProfile]) end
end
function Shaders.setProfile(name) if not Profiles[name] then return end Shaders.lastProfile=name; if Shaders.activePreset then Shaders.setPreset(Shaders.activePreset) end end
function Shaders.cleanup() shRestore() end

print("[DarkHub] 4/9 - Modulos extras OK")

UI={connections={},activeTab="Inicio",tabs={},pages={}}
local screenGui=Util.create("ScreenGui",{Name="DarkHubUI",ResetOnSpawn=false,ZIndexBehavior=Enum.ZIndexBehavior.Sibling,Parent=PG})
local uiScale=Util.create("UIScale",{Scale=1,Parent=screenGui})
local function updateScale() local c=WS.CurrentCamera; if not c then return end uiScale.Scale=clamp(c.ViewportSize.X/620,0.75,1) end
updateScale()
if WS.CurrentCamera then table.insert(UI.connections,WS.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(updateScale)) end

mainFrame=Util.create("Frame",{Name="MainFrame",Size=UDim2.new(0,520,0,340),Position=UDim2.new(0.5,0,0.5,0),AnchorPoint=Vector2.new(0.5,0.5),BorderSizePixel=0,ClipsDescendants=true,Parent=screenGui})
reg(mainFrame,{BackgroundColor3="windowBg"})
Util.create("UICorner",{CornerRadius=UDim.new(0,12),Parent=mainFrame})
reg(Util.create("UIStroke",{Thickness=1,Transparency=0.3,Parent=mainFrame}),{Color="border"})
local bgImage=Util.create("ImageLabel",{Name="CustomBackground",Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,Image="",ImageTransparency=0,ScaleType=Enum.ScaleType.Crop,ZIndex=0,Parent=mainFrame})
Util.create("UICorner",{CornerRadius=UDim.new(0,12),Parent=bgImage})
bgImage:SetAttribute("SkipOpacity",true)

local topBar=Util.create("Frame",{Size=UDim2.new(1,0,0,40),BorderSizePixel=0,ZIndex=2,Parent=mainFrame})
reg(topBar,{BackgroundColor3="topbar"})
Util.create("UICorner",{CornerRadius=UDim.new(0,12),Parent=topBar})
reg(Util.create("Frame",{Size=UDim2.new(1,0,0,12),Position=UDim2.new(0,0,1,-12),BorderSizePixel=0,ZIndex=2,Parent=topBar}),{BackgroundColor3="topbar"})
reg(Util.create("TextLabel",{Size=UDim2.new(0,300,1,0),Position=UDim2.new(0,14,0,0),BackgroundTransparency=1,Font=Enum.Font.GothamBold,Text=Config.Title,TextSize=14,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=3,Parent=topBar}),{TextColor3="text"})

local function makeTopBtn(text,xPos)
local btn=Util.create("TextButton",{Size=UDim2.new(0,24,0,24),Position=UDim2.new(1,xPos,0.5,0),AnchorPoint=Vector2.new(1,0.5),BackgroundTransparency=1,BorderSizePixel=0,Text=text,Font=Enum.Font.GothamBold,TextSize=16,AutoButtonColor=false,Parent=topBar})
reg(btn,{TextColor3="textMuted"})
btn.MouseEnter:Connect(function() btn.TextColor3=Colors.text end)
btn.MouseLeave:Connect(function() btn.TextColor3=Colors.textMuted end)
return btn
end
local closeBtn=makeTopBtn("X",-10)
local minBtn=makeTopBtn("-",-38)
do
local dragging,dragStart,startPos
table.insert(UI.connections,topBar.InputBegan:Connect(function(input)
if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then dragging=true; dragStart=input.Position; startPos=mainFrame.Position end
end))
table.insert(UI.connections,UIS.InputChanged:Connect(function(input)
if dragging and (input.UserInputType==Enum.UserInputType.MouseMovement or input.UserInputType==Enum.UserInputType.Touch) then
local d=input.Position-dragStart
mainFrame.Position=UDim2.new(startPos.X.Scale,startPos.X.Offset+d.X,startPos.Y.Scale,startPos.Y.Offset+d.Y)
end
end))
table.insert(UI.connections,UIS.InputEnded:Connect(function(input)
if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then dragging=false end
end))
end

local sidebar=Util.create("Frame",{Size=UDim2.new(0,140,1,-40),Position=UDim2.new(0,0,0,40),BorderSizePixel=0,ZIndex=2,Parent=mainFrame})
reg(sidebar,{BackgroundColor3="sidebar"})
local sidebarList=Util.create("Frame",{Size=UDim2.new(1,-10,1,-10),Position=UDim2.new(0,5,0,5),BackgroundTransparency=1,ZIndex=3,Parent=sidebar},{Util.create("UIListLayout",{Padding=UDim.new(0,2),SortOrder=Enum.SortOrder.LayoutOrder})})
local contentArea=Util.create("Frame",{Size=UDim2.new(1,-140,1,-40),Position=UDim2.new(0,140,0,40),BackgroundTransparency=1,ZIndex=3,Parent=mainFrame})

local function makeTab(id,icon,label,order)
local btn=Util.create("TextButton",{Size=UDim2.new(1,0,0,32),BackgroundTransparency=1,BorderSizePixel=0,Text="",AutoButtonColor=false,LayoutOrder=order,Parent=sidebarList})
Util.create("UICorner",{CornerRadius=UDim.new(0,6),Parent=btn})
local iconLabel=reg(Util.create("TextLabel",{Size=UDim2.new(0,22,1,0),Position=UDim2.new(0,10,0,0),BackgroundTransparency=1,Font=Enum.Font.GothamBold,Text=icon,TextSize=14,Parent=btn}),{TextColor3="textMuted"})
local labelLabel=reg(Util.create("TextLabel",{Size=UDim2.new(1,-38,1,0),Position=UDim2.new(0,34,0,0),BackgroundTransparency=1,Font=Enum.Font.GothamMedium,Text=label,TextSize=11,TextXAlignment=Enum.TextXAlignment.Left,Parent=btn}),{TextColor3="textMuted"})
local ind=Util.create("Frame",{Size=UDim2.new(0,3,0.55,0),Position=UDim2.new(0,0,0.5,0),AnchorPoint=Vector2.new(0,0.5),BorderSizePixel=0,Visible=false,Parent=btn})
reg(ind,{BackgroundColor3="accent"})
Util.create("UICorner",{CornerRadius=UDim.new(1,0),Parent=ind})
btn.MouseEnter:Connect(function() if UI.activeTab~=id then btn.BackgroundTransparency=0.9 end end)
btn.MouseLeave:Connect(function() if UI.activeTab~=id then btn.BackgroundTransparency=1 end end)
btn.MouseButton1Click:Connect(function()
UI.activeTab=id
for tid,tab in pairs(UI.tabs) do
local a=(tid==id)
tab.indicator.Visible=a; tab.btn.BackgroundTransparency=a and 0.85 or 1
tab.iconLabel.TextColor3=a and Colors.text or Colors.textMuted
tab.labelLabel.TextColor3=a and Colors.text or Colors.textMuted
end
for tid,pg in pairs(UI.pages) do pg.Visible=(tid==id) end
end)
UI.tabs[id]={btn=btn,indicator=ind,iconLabel=iconLabel,labelLabel=labelLabel}
return btn
end

local function makePage(id)
local pg=Util.create("ScrollingFrame",{Size=UDim2.new(1,-16,1,-16),Position=UDim2.new(0,8,0,8),BackgroundTransparency=1,BorderSizePixel=0,CanvasSize=UDim2.new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,ScrollBarThickness=4,Visible=false,Parent=contentArea},{Util.create("UIListLayout",{Padding=UDim.new(0,8),SortOrder=Enum.SortOrder.LayoutOrder})})
UI.pages[id]=pg
return pg
end

local function makeSection(parent,title,order,open)
local sec=Util.create("Frame",{Size=UDim2.new(1,0,0,26),BackgroundTransparency=1,AutomaticSize=Enum.AutomaticSize.Y,LayoutOrder=order,Parent=parent},{Util.create("UIListLayout",{Padding=UDim.new(0,4),SortOrder=Enum.SortOrder.LayoutOrder})})
local hdr=Util.create("TextButton",{Size=UDim2.new(1,0,0,24),BackgroundTransparency=1,Text="",AutoButtonColor=false,LayoutOrder=1,Parent=sec})
reg(Util.create("TextLabel",{Size=UDim2.new(1,-24,1,0),BackgroundTransparency=1,Font=Enum.Font.GothamBold,Text=title,TextSize=13,TextXAlignment=Enum.TextXAlignment.Left,Parent=hdr}),{TextColor3="text"})
local ch=reg(Util.create("TextLabel",{Size=UDim2.new(0,16,1,0),Position=UDim2.new(1,-16,0,0),BackgroundTransparency=1,Font=Enum.Font.GothamBold,Text="v",TextSize=12,Parent=hdr}),{TextColor3="textMuted"})
local body=Util.create("Frame",{Size=UDim2.new(1,0,0,0),BackgroundTransparency=1,AutomaticSize=Enum.AutomaticSize.Y,Visible=(open~=false),LayoutOrder=2,Parent=sec},{Util.create("UIListLayout",{Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder})})
hdr.MouseButton1Click:Connect(function() body.Visible=not body.Visible; ch.Text=body.Visible and "v" or ">" end)
return body
end

local function makeToggle(parent,init,onChanged)
local container=Util.create("Frame",{Size=UDim2.new(0,36,0,20),BackgroundTransparency=1,Parent=parent})
local track=Util.create("Frame",{Size=UDim2.new(1,0,1,0),BorderSizePixel=0,Parent=container})
reg(track,{BackgroundColor3=init and "accent" or "toggleOff"})
Util.create("UICorner",{CornerRadius=UDim.new(1,0),Parent=track})
local knob=Util.create("Frame",{Size=UDim2.new(0,16,0,16),Position=UDim2.new(0,init and 18 or 2,0.5,0),AnchorPoint=Vector2.new(0,0.5),BorderSizePixel=0,BackgroundColor3=Color3.fromRGB(255,255,255),Parent=track})
Util.create("UICorner",{CornerRadius=UDim.new(1,0),Parent=knob})
local state=init
local ca=Util.create("TextButton",{Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,Text="",Parent=container})
ca.MouseButton1Click:Connect(function()
state=not state
Tween:Create(track,TweenInfo.new(0.15),{BackgroundColor3=state and Colors.accent or Colors.toggleOff}):Play()
Tween:Create(knob,TweenInfo.new(0.15),{Position=UDim2.new(0,state and 18 or 2,0.5,0)}):Play()
onChanged(state)
end)
return container
end

local function makeOptionRow(parent,title,desc,order,createR)
local row=Util.create("Frame",{Size=UDim2.new(1,0,0,54),BackgroundTransparency=1,LayoutOrder=order,Parent=parent})
reg(Util.create("TextLabel",{Size=UDim2.new(1,-70,0,18),BackgroundTransparency=1,Font=Enum.Font.GothamBold,Text=title,TextSize=12,TextXAlignment=Enum.TextXAlignment.Left,Parent=row}),{TextColor3="text"})
if desc and desc~="" then reg(Util.create("TextLabel",{Size=UDim2.new(1,-70,0,32),Position=UDim2.new(0,0,0,18),BackgroundTransparency=1,Font=Enum.Font.Gotham,Text=desc,TextSize=10,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,Parent=row}),{TextColor3="textMuted"}) end
if createR then local r=createR(row); if r then r.Position=UDim2.new(1,-6,0,4); r.AnchorPoint=Vector2.new(1,0) end end
return row
end

local function makeSlider(parent,min,max,default,order,onChanged)
local ct=Util.create("Frame",{Size=UDim2.new(1,0,0,26),BackgroundTransparency=1,LayoutOrder=order,Parent=parent})
local track=Util.create("Frame",{Size=UDim2.new(1,-50,0,4),Position=UDim2.new(0,0,0.5,0),AnchorPoint=Vector2.new(0,0.5),BorderSizePixel=0,Parent=ct})
reg(track,{BackgroundColor3="cardBg"})
Util.create("UICorner",{CornerRadius=UDim.new(1,0),Parent=track})
local fill=Util.create("Frame",{Size=UDim2.new(0,0,1,0),BorderSizePixel=0,Parent=track})
reg(fill,{BackgroundColor3="accent"})
Util.create("UICorner",{CornerRadius=UDim.new(1,0),Parent=fill})
local knob=Util.create("Frame",{Size=UDim2.new(0,14,0,14),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0,0,0.5,0),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,Parent=track})
Util.create("UICorner",{CornerRadius=UDim.new(1,0),Parent=knob})
local vl=reg(Util.create("TextLabel",{Size=UDim2.new(0,44,1,0),Position=UDim2.new(1,-44,0,0),BackgroundTransparency=1,Font=Enum.Font.GothamBold,Text=tostring(default),TextSize=11,Parent=ct}),{TextColor3="text"})
local val=default; local dragging=false
local function sync()
local f=(val-min)/math.max(max-min,1)
fill.Size=UDim2.new(f,0,1,0); knob.Position=UDim2.new(f,0,0.5,0); vl.Text=tostring(val)
end
local function upd(x)
local r=x-track.AbsolutePosition.X
local f=clamp(r/math.max(track.AbsoluteSize.X,1),0,1)
val=math.floor(min+(max-min)*f+0.5); sync(); onChanged(val)
end
local ca=Util.create("TextButton",{Size=UDim2.new(1,0,0,24),Position=UDim2.new(0,0,0.5,0),AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency=1,Text="",Parent=ct})
ca.InputBegan:Connect(function(input) if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then dragging=true; upd(input.Position.X) end end)
table.insert(UI.connections,UIS.InputChanged:Connect(function(input) if dragging and (input.UserInputType==Enum.UserInputType.MouseMovement or input.UserInputType==Enum.UserInputType.Touch) then upd(input.Position.X) end end))
table.insert(UI.connections,UIS.InputEnded:Connect(function(input) if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then dragging=false end end))
sync()
return {setValue=function(v) val=v; sync() end,getValue=function() return val end}
end

local function makeOutlineBtn(parent,text,order,widthScale)
local btn=Util.create("TextButton",{Size=UDim2.new(widthScale or 0.5,-3,0,28),BackgroundTransparency=0.25,BorderSizePixel=0,Text=text,Font=Enum.Font.GothamBold,TextSize=11,AutoButtonColor=false,LayoutOrder=order,Parent=parent})
reg(btn,{BackgroundColor3="cardBg",TextColor3="text"})
Util.create("UICorner",{CornerRadius=UDim.new(0,6),Parent=btn})
btn.MouseEnter:Connect(function() Tween:Create(btn,TweenInfo.new(0.15),{BackgroundTransparency=0}):Play() end)
btn.MouseLeave:Connect(function() Tween:Create(btn,TweenInfo.new(0.15),{BackgroundTransparency=0.25}):Play() end)
return btn
end

local function makeInfoLabel(parent,text,order,colorKey)
return reg(Util.create("TextLabel",{Size=UDim2.new(1,0,0,14),BackgroundTransparency=1,Font=Enum.Font.GothamMedium,Text=text,TextSize=11,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=order,Parent=parent}),{TextColor3=colorKey or "textMuted"})
end

local function makeLabeledSlider(parent,title,desc,min,max,default,order,onChanged)
local w=Util.create("Frame",{Size=UDim2.new(1,0,0,44),BackgroundTransparency=1,LayoutOrder=order,Parent=parent})
reg(Util.create("TextLabel",{Size=UDim2.new(1,0,0,16),BackgroundTransparency=1,Font=Enum.Font.GothamBold,Text=title,TextSize=12,TextXAlignment=Enum.TextXAlignment.Left,Parent=w}),{TextColor3="text"})
if desc then reg(Util.create("TextLabel",{Size=UDim2.new(1,0,0,14),Position=UDim2.new(0,0,0,15),BackgroundTransparency=1,Font=Enum.Font.Gotham,Text=desc,TextSize=10,TextXAlignment=Enum.TextXAlignment.Left,Parent=w}),{TextColor3="textMuted"}) end
local s=makeSlider(w,min,max,default,3,onChanged)
local sf=w:FindFirstChildWhichIsA("Frame"); if sf then sf.Position=UDim2.new(0,0,0,22) end
return s
end

local function makeCard(parent,order,height)
local c=Util.create("Frame",{Size=UDim2.new(1,0,0,height or 60),BackgroundTransparency=0.2,BorderSizePixel=0,LayoutOrder=order,Parent=parent})
reg(c,{BackgroundColor3="cardBg"})
Util.create("UICorner",{CornerRadius=UDim.new(0,8),Parent=c})
reg(Util.create("UIStroke",{Thickness=1,Transparency=0.7,Parent=c}),{Color="border"})
return c
end

local toastFrame=Util.create("Frame",{Size=UDim2.new(0,240,0,40),Position=UDim2.new(0.5,0,1,-60),AnchorPoint=Vector2.new(0.5,1),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=200,Visible=false,Parent=screenGui})
local toastBg=Util.create("Frame",{Size=UDim2.new(1,0,1,0),BackgroundTransparency=0.1,BorderSizePixel=0,Parent=toastFrame})
reg(toastBg,{BackgroundColor3="cardBg"})
Util.create("UICorner",{CornerRadius=UDim.new(0,8),Parent=toastBg})
reg(Util.create("UIStroke",{Thickness=1,Parent=toastBg}),{Color="accent"})
local toastLabel=reg(Util.create("TextLabel",{Size=UDim2.new(1,-20,1,0),Position=UDim2.new(0,10,0,0),BackgroundTransparency=1,Font=Enum.Font.GothamBold,Text="",TextSize=12,TextXAlignment=Enum.TextXAlignment.Center,Parent=toastBg}),{TextColor3="text"})
local toastToken=0
local function showToast(msg,dur)
dur=dur or 2
toastToken=toastToken+1
local my=toastToken
toastLabel.Text=msg
toastFrame.Visible=true
toastFrame.Position=UDim2.new(0.5,0,1,-60)
Tween:Create(toastFrame,TweenInfo.new(0.2),{Position=UDim2.new(0.5,0,1,-80)}):Play()
task.spawn(function()
task.wait(dur)
if toastToken~=my then return end
Tween:Create(toastFrame,TweenInfo.new(0.2),{Position=UDim2.new(0.5,0,1,-60)}):Play()
task.wait(0.2)
if toastToken==my then toastFrame.Visible=false end
end)
end

print("[DarkHub] 5/9 - UI base OK")

local restoreBtn=Util.create("TextButton",{Size=UDim2.new(0,110,0,30),Position=UDim2.new(0,20,0,20),BackgroundTransparency=0.1,BorderSizePixel=0,Text="Dark Hub",Font=Enum.Font.GothamBold,TextSize=12,AutoButtonColor=false,Visible=false,Parent=screenGui})
reg(restoreBtn,{BackgroundColor3="cardBg",TextColor3="text"})
Util.create("UICorner",{CornerRadius=UDim.new(0,8),Parent=restoreBtn})
restoreBtn.MouseButton1Click:Connect(function() restoreBtn.Visible=false; mainFrame.Visible=true end)
minBtn.MouseButton1Click:Connect(function() mainFrame.Visible=false; restoreBtn.Visible=true end)

local confirmFrame=Util.create("Frame",{Size=UDim2.new(0,260,0,120),Position=UDim2.new(0.5,0,0.5,0),AnchorPoint=Vector2.new(0.5,0.5),BorderSizePixel=0,Visible=false,ZIndex=80,Parent=screenGui})
reg(confirmFrame,{BackgroundColor3="windowBg"})
Util.create("UICorner",{CornerRadius=UDim.new(0,10),Parent=confirmFrame})
reg(Util.create("UIStroke",{Thickness=1,Parent=confirmFrame}),{Color="border"})
reg(Util.create("TextLabel",{Size=UDim2.new(1,-20,0,22),Position=UDim2.new(0,10,0,14),BackgroundTransparency=1,Font=Enum.Font.GothamBold,Text="Encerrar Dark Hub?",TextSize=14,TextXAlignment=Enum.TextXAlignment.Center,ZIndex=81,Parent=confirmFrame}),{TextColor3="text"})
reg(Util.create("TextLabel",{Size=UDim2.new(1,-20,0,30),Position=UDim2.new(0,10,0,40),BackgroundTransparency=1,Font=Enum.Font.Gotham,Text="Todas as tarefas serao encerradas.",TextSize=10,TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Center,ZIndex=81,Parent=confirmFrame}),{TextColor3="textMuted"})
local cfRow=Util.create("Frame",{Size=UDim2.new(1,-20,0,28),Position=UDim2.new(0,10,1,-38),BackgroundTransparency=1,ZIndex=81,Parent=confirmFrame},{Util.create("UIListLayout",{FillDirection=Enum.FillDirection.Horizontal,Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder})})
local cancelBtn=makeOutlineBtn(cfRow,"Cancelar",1)
local confirmBtn=makeOutlineBtn(cfRow,"Confirmar",2)
confirmBtn.TextColor3=Colors.danger

local function Cleanup()
pcall(AutoSuperHoney.stop)
pcall(AutoFarm.stop)
pcall(AutoSell.stop)
pcall(CollisionManager.restoreCollisions)
pcall(function() WalkSpeed.setActive(false) end)
pcall(function() Noclip.setActive(false) end)
pcall(function() JumpPower.setActive(false) end)
pcall(function() InfJump.setActive(false) end)
pcall(function() FOV.setActive(false) end)
pcall(function() Fullbright.setActive(false) end)
pcall(function() AntiAFK.setActive(false) end)
pcall(function() YT.setFreeCam(false) end)
pcall(function() YT.stopPan() end)
pcall(function() YT.cinematicStop() end)
pcall(function() Shaders.cleanup() end)
for _,c in ipairs(Connections) do pcall(function() c:Disconnect() end) end
for _,c in ipairs(UI.connections) do pcall(function() c:Disconnect() end) end
pcall(function() screenGui:Destroy() end)
_G.DarkHub=nil
end
_G.DarkHub={Cleanup=Cleanup}
closeBtn.MouseButton1Click:Connect(function() confirmFrame.Visible=true end)
cancelBtn.MouseButton1Click:Connect(function() confirmFrame.Visible=false end)
confirmBtn.MouseButton1Click:Connect(function() Cleanup() end)

print("[DarkHub] 6/9 - Iniciando paginas")

-- PÁGINA INÍCIO
do
makeTab("Inicio","🏠","Inicio",0)
local pg=makePage("Inicio")
local card=makeCard(pg,1,110)
local av=Util.create("ImageLabel",{Size=UDim2.new(0,74,0,74),Position=UDim2.new(0,14,0,18),BackgroundColor3=Colors.cardBg,BorderSizePixel=0,Image="rbxassetid://0",ZIndex=2,Parent=card})
Util.create("UICorner",{CornerRadius=UDim.new(1,0),Parent=av})
reg(Util.create("UIStroke",{Thickness=2,Parent=av}),{Color="accent"})
reg(Util.create("TextLabel",{Size=UDim2.new(1,-110,0,20),Position=UDim2.new(0,100,0,18),BackgroundTransparency=1,Font=Enum.Font.GothamBold,Text=LP.DisplayName or LP.Name,TextSize=15,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=2,Parent=card}),{TextColor3="text"})
reg(Util.create("TextLabel",{Size=UDim2.new(1,-110,0,16),Position=UDim2.new(0,100,0,38),BackgroundTransparency=1,Font=Enum.Font.Gotham,Text="@"..LP.Name,TextSize=11,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=2,Parent=card}),{TextColor3="textMuted"})
reg(Util.create("TextLabel",{Size=UDim2.new(1,-110,0,14),Position=UDim2.new(0,100,0,55),BackgroundTransparency=1,Font=Enum.Font.Gotham,Text="ID: "..tostring(LP.UserId).." | Place: "..tostring(game.PlaceId),TextSize=10,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=2,Parent=card}),{TextColor3="textDim"})
local sd=Util.create("Frame",{Size=UDim2.new(0,8,0,8),Position=UDim2.new(0,100,0,78),BackgroundColor3=Colors.success,BorderSizePixel=0,ZIndex=2,Parent=card})
Util.create("UICorner",{CornerRadius=UDim.new(1,0),Parent=sd})
reg(Util.create("TextLabel",{Size=UDim2.new(1,-110,0,14),Position=UDim2.new(0,114,0,75),BackgroundTransparency=1,Font=Enum.Font.GothamBold,Text="Online",TextSize=11,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=2,Parent=card}),{TextColor3="success"})
task.spawn(function()
local ok,t=pcall(function() return Players:GetUserThumbnailAsync(LP.UserId,Enum.ThumbnailType.HeadShot,Enum.ThumbnailSize.Size150x150) end)
if ok and t then av.Image=t end
end)
local tc=makeCard(pg,2,50)
reg(Util.create("TextLabel",{Size=UDim2.new(0.5,0,1,0),Position=UDim2.new(0,14,0,0),BackgroundTransparency=1,Font=Enum.Font.GothamBold,Text="Tempo ativo",TextSize=12,TextXAlignment=Enum.TextXAlignment.Left,Parent=tc}),{TextColor3="text"})
local tl=reg(Util.create("TextLabel",{Size=UDim2.new(0.5,-14,1,0),Position=UDim2.new(0.5,0,0,0),BackgroundTransparency=1,Font=Enum.Font.Code,Text="00:00:00",TextSize=14,TextXAlignment=Enum.TextXAlignment.Right,Parent=tc}),{TextColor3="accent"})
local st=tick()
task.spawn(function() while screenGui.Parent do if tl and tl.Parent then tl.Text=Util.formatTime(tick()-st) end task.wait(1) end end)
local dc=makeCard(pg,3,70)
reg(Util.create("TextLabel",{Size=UDim2.new(1,-28,0,16),Position=UDim2.new(0,14,0,8),BackgroundTransparency=1,Font=Enum.Font.GothamBold,Text="Comunidade",TextSize=12,TextXAlignment=Enum.TextXAlignment.Left,Parent=dc}),{TextColor3="text"})
local db=Util.create("TextButton",{Size=UDim2.new(0,180,0,26),Position=UDim2.new(0,14,0,36),BackgroundColor3=Color3.fromRGB(88,101,242),BorderSizePixel=0,Text="Copiar link do Discord",Font=Enum.Font.GothamBold,TextSize=11,TextColor3=Color3.fromRGB(255,255,255),AutoButtonColor=false,Parent=dc})
Util.create("UICorner",{CornerRadius=UDim.new(0,6),Parent=db})
db.MouseButton1Click:Connect(function() local ok,err=Util.copyToClipboard(ProjectInfo.DiscordLink); if ok then showToast("Discord copiado!",2) else showToast("Falha: "..tostring(err),3) end end)
end

-- AUTO SUPER HONEY
do
makeTab("AutoSuperHoney","🍯","Auto Super Honey",1)
local pg=makePage("AutoSuperHoney")
local s1=makeSection(pg,"Status",1,true)
local sl=makeInfoLabel(s1,"Auto Super Honey desativado",1,"text")
local cl=makeInfoLabel(s1,"Destino atual: -",2)
local fl=makeInfoLabel(s1,"TpHoney encontrados: 0",3)
local pr=makeInfoLabel(s1,"Processados: 0",4)
local s2=makeSection(pg,"Controles",2,true)
local r=Util.create("Frame",{Size=UDim2.new(1,0,0,28),BackgroundTransparency=1,LayoutOrder=1,Parent=s2},{Util.create("UIListLayout",{FillDirection=Enum.FillDirection.Horizontal,Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder})})
local function up()
sl.Text="Status: "..AutoSuperHoney.status
cl.Text="Destino: "..(AutoSuperHoney.current or "-")
fl.Text="TpHoney: "..AutoSuperHoney.countFound()
pr.Text="Processados: "..AutoSuperHoney.processed
end
local b1=makeOutlineBtn(r,"Iniciar",1)
local b2=makeOutlineBtn(r,"Parar",2)
b1.MouseButton1Click:Connect(function() AutoSuperHoney.start(up) end)
b2.MouseButton1Click:Connect(function() AutoSuperHoney.stop(up) end)
task.spawn(function() while screenGui.Parent do up(); task.wait(0.5) end end)
end

-- AUTO FARM + AUTO SELL
do
makeTab("AutoFarm","🐝","Auto Farm",2)
local pg=makePage("AutoFarm")
local s1=makeSection(pg,"Farm",1,true)
local sl=makeInfoLabel(s1,"Auto Farm desativado",1,"text")
local cl=makeInfoLabel(s1,"Negocio atual: -",2)
local fl=makeInfoLabel(s1,"Negocios: 0",3)
local pr=makeInfoLabel(s1,"Processados: 0",4)
local bl=makeInfoLabel(s1,"Base: buscando...",5,"accent2")
local s2=makeSection(pg,"Controles",2,true)
local r=Util.create("Frame",{Size=UDim2.new(1,0,0,28),BackgroundTransparency=1,LayoutOrder=1,Parent=s2},{Util.create("UIListLayout",{FillDirection=Enum.FillDirection.Horizontal,Padding=UDim.new(0,5),SortOrder=Enum.SortOrder.LayoutOrder})})
local function upFarm()
sl.Text="Status: "..AutoFarm.status
cl.Text="Negocio: "..(AutoFarm.current or "-")
fl.Text="Negocios: "..countBusinessFound()
pr.Text="Processados: "..AutoFarm.processed
if PlayerBase and PlayerBase.Parent then bl.Text="Base: "..PlayerBase.Name.." OK"; bl.TextColor3=Colors.success
else bl.Text="Base: NAO ENCONTRADA"; bl.TextColor3=Colors.accent2 end
end
local b1=makeOutlineBtn(r,"Iniciar",1,0.40)
local b2=makeOutlineBtn(r,"Parar",2,0.30)
local b3=makeOutlineBtn(r,"Spawn",3,0.30)
b1.MouseButton1Click:Connect(function() AutoFarm.start(upFarm) end)
b2.MouseButton1Click:Connect(function() AutoFarm.stop(upFarm) end)
b3.MouseButton1Click:Connect(function() if not AutoFarm.goToSpawn() then sl.Text="Spawn nao capturado" end end)

local s3=makeSection(pg,"Auto Sell",3,true)
local asl=makeInfoLabel(s3,"Auto Sell desativado",1,"text")
local apl=makeInfoLabel(s3,"Ultimo preco: -",2)
local atl=makeInfoLabel(s3,"Ultimo total: -",3)
local ascl=makeInfoLabel(s3,"Vendas: 0",4)
local aml=makeInfoLabel(s3,"Metodo: -",5,"accent2")
local as2=makeSection(pg,"Config Auto Sell",4,true)
local function upSell()
    asl.Text="Status: "..AutoSell.status
    asl.TextColor3=AutoSell.active and Colors.success or Colors.textMuted
    if AutoSell.lastPrice then apl.Text="Ultimo preco: $"..AutoSell.lastPrice.."/mel" end
    if AutoSell.lastTotal then atl.Text="Ultimo total: "..AutoSell.lastTotal end
    ascl.Text="Vendas: "..AutoSell.soldCount
    aml.Text="Metodo: "..AutoSell.lastClickMethod
end
makeOptionRow(as2,"Ativar Auto Sell","Vende → farma por X s → vende de novo.",1,function(row)
    return makeToggle(row,false,function(s)
        if s then
            AutoSell.start(upSell, upFarm)
            showToast("Auto Sell ATIVADO",2)
        else
            AutoSell.stop(upSell)
            showToast("Auto Sell DESATIVADO",2)
        end
        upSell()
    end)
end)
makeLabeledSlider(as2,"Preco minimo ($/mel)","So vende se estiver valendo isso OU MAIS.",1,20,Config.AutoSell.minPrice,2,function(v) AutoSell.setMinPrice(v) end)
makeLabeledSlider(as2,"Tempo de Farm (segundos)","Tempo que Auto Farm roda entre cada venda.",5,300,Config.AutoSell.farmTime,3,function(v) AutoSell.setFarmTime(v) end)
makeInfoLabel(as2,"Clique agora usa firesignal/getconnections (anti-cheat resistant).",4,"textMuted")
task.spawn(function() while screenGui.Parent do upFarm(); upSell(); task.wait(0.5) end end)
end

-- PLAYER
do
makeTab("Player","👤","Player",3)
local pg=makePage("Player")
local sm=makeSection(pg,"Movement",1,true)
makeOptionRow(sm,"WalkSpeed","Velocidade.",1,function(r) return makeToggle(r,false,function(s) WalkSpeed.setActive(s) end) end)
makeLabeledSlider(sm,"Velocidade","Padrao: 16.",Config.WalkSpeed.min,Config.WalkSpeed.max,Config.WalkSpeed.default,2,function(v) WalkSpeed.setValue(v) end)
makeOptionRow(sm,"JumpPower","Forca do pulo.",3,function(r) return makeToggle(r,false,function(s) JumpPower.setActive(s) end) end)
makeLabeledSlider(sm,"Forca","Padrao: 50.",Config.JumpPower.min,Config.JumpPower.max,Config.JumpPower.default,4,function(v) JumpPower.setValue(v) end)
makeOptionRow(sm,"Infinite Jump","Pular no ar.",5,function(r) return makeToggle(r,false,function(s) InfJump.setActive(s) end) end)
makeOptionRow(sm,"Noclip","Atravessa paredes.",6,function(r) return makeToggle(r,false,function(s) Noclip.setActive(s) end) end)
local sc=makeSection(pg,"Camera",2,true)
makeLabeledSlider(sc,"FOV","Padrao: 70.",Config.FOV.min,Config.FOV.max,Config.FOV.default,1,function(v) FOV.setValue(v) end)
makeOptionRow(sc,"Aplicar FOV","Ativa.",2,function(r) return makeToggle(r,false,function(s) FOV.setActive(s) end) end)
local se=makeSection(pg,"Environment",3,true)
makeOptionRow(se,"Fullbright","Iluminacao.",1,function(r) return makeToggle(r,false,function(s) Fullbright.setActive(s) end) end)
local sw=makeSection(pg,"Waypoints",4,true)
local wi=Util.create("TextBox",{Size=UDim2.new(1,0,0,26),BackgroundTransparency=0.15,BorderSizePixel=0,Font=Enum.Font.Gotham,Text="",PlaceholderText="Nome do waypoint",PlaceholderColor3=Color3.fromRGB(130,130,150),TextSize=11,TextXAlignment=Enum.TextXAlignment.Left,ClearTextOnFocus=false,LayoutOrder=1,Parent=sw})
reg(wi,{BackgroundColor3="cardBg",TextColor3="text"})
Util.create("UICorner",{CornerRadius=UDim.new(0,5),Parent=wi})
Util.create("UIPadding",{PaddingLeft=UDim.new(0,8),PaddingRight=UDim.new(0,8),Parent=wi})
local wr=Util.create("Frame",{Size=UDim2.new(1,0,0,28),BackgroundTransparency=1,LayoutOrder=2,Parent=sw},{Util.create("UIListLayout",{FillDirection=Enum.FillDirection.Horizontal,Padding=UDim.new(0,5),SortOrder=Enum.SortOrder.LayoutOrder})})
local ab=makeOutlineBtn(wr,"Salvar",1,0.6)
local cb=makeOutlineBtn(wr,"Limpar",2,0.4)
local wl=Util.create("Frame",{Size=UDim2.new(1,0,0,0),BackgroundTransparency=1,AutomaticSize=Enum.AutomaticSize.Y,LayoutOrder=3,Parent=sw},{Util.create("UIListLayout",{Padding=UDim.new(0,4),SortOrder=Enum.SortOrder.LayoutOrder})})
local wst=makeInfoLabel(sw,"Nenhum waypoint.",4,"textMuted")
local function rebuild()
for _,c in ipairs(wl:GetChildren()) do if c:IsA("GuiObject") then c:Destroy() end end
if #Waypoints.list==0 then wst.Text="Nenhum waypoint."; wst.TextColor3=Colors.textMuted; return end
wst.Text=#Waypoints.list.." salvos."; wst.TextColor3=Colors.success
for i,w in ipairs(Waypoints.list) do
local row=Util.create("Frame",{Size=UDim2.new(1,0,0,26),BackgroundTransparency=0.85,BackgroundColor3=Colors.cardBg,BorderSizePixel=0,LayoutOrder=i,Parent=wl})
Util.create("UICorner",{CornerRadius=UDim.new(0,5),Parent=row})
local l=Util.create("TextLabel",{Size=UDim2.new(1,-100,1,0),Position=UDim2.new(0,8,0,0),BackgroundTransparency=1,Font=Enum.Font.GothamMedium,Text=w.name,TextSize=11,TextXAlignment=Enum.TextXAlignment.Left,Parent=row}); l.TextColor3=Colors.text
local gb=Util.create("TextButton",{Size=UDim2.new(0,44,0,22),Position=UDim2.new(1,-96,0.5,0),AnchorPoint=Vector2.new(0,0.5),BackgroundColor3=Colors.accent,BackgroundTransparency=0.2,BorderSizePixel=0,Text="Ir",Font=Enum.Font.GothamBold,TextSize=10,TextColor3=Color3.fromRGB(255,255,255),AutoButtonColor=false,Parent=row})
Util.create("UICorner",{CornerRadius=UDim.new(0,5),Parent=gb})
gb.MouseButton1Click:Connect(function() Waypoints.goTo(i) end)
local db=Util.create("TextButton",{Size=UDim2.new(0,22,0,22),Position=UDim2.new(1,-46,0.5,0),AnchorPoint=Vector2.new(0,0.5),BackgroundColor3=Colors.danger,BackgroundTransparency=0.2,BorderSizePixel=0,Text="x",Font=Enum.Font.GothamBold,TextSize=12,TextColor3=Color3.fromRGB(255,255,255),AutoButtonColor=false,Parent=row})
Util.create("UICorner",{CornerRadius=UDim.new(0,5),Parent=db})
db.MouseButton1Click:Connect(function() Waypoints.remove(i); rebuild() end)
end
end
ab.MouseButton1Click:Connect(function()
local c=LP.Character; if not c then return end
local h=c:FindFirstChild("HumanoidRootPart"); if not h then return end
local n=wi.Text
if n=="" then n="WP "..(#Waypoints.list+1) end
Waypoints.add(n,h.Position); wi.Text=""; rebuild()
end)
cb.MouseButton1Click:Connect(function() Waypoints.list={}; rebuild() end)
onThemeChanged(rebuild)
local su=makeSection(pg,"Utility",5,true)
makeOptionRow(su,"Anti-AFK","Evita desconexao.",1,function(r) return makeToggle(r,false,function(s) AntiAFK.setActive(s) end) end)
end

print("[DarkHub] 7/9 - Player OK")

-- YT
do
makeTab("YT","🎬","Ferr. YT",4)
local pg=makePage("YT")
local sui=makeSection(pg,"Interface",1,true)
makeOptionRow(sui,"Modo gravacao","Esconde barra lateral.",1,function(r) return makeToggle(r,false,function(s) YT.recMode=s; if s then sidebar.Visible=false; contentArea.Position=UDim2.new(0,0,0,40); contentArea.Size=UDim2.new(1,0,1,-40) else sidebar.Visible=true; contentArea.Position=UDim2.new(0,140,0,40); contentArea.Size=UDim2.new(1,-140,1,-40) end end) end)
makeOptionRow(sui,"Ocultar interface","Esconde o hub.",2,function(r) return makeToggle(r,false,function(s) mainFrame.Visible=not s; restoreBtn.Visible=s end) end)
local ssc=makeSection(pg,"Camera",2,true)
makeOptionRow(ssc,"Camera livre","PC: WASD.",1,function(r) return makeToggle(r,false,function(s) YT.setFreeCam(s) end) end)
makeLabeledSlider(ssc,"FOV (YT)","Padrao: 70.",40,120,70,2,function(v) local c=WS.CurrentCamera; if c then c.FieldOfView=v end end)
reg(Util.create("TextLabel",{Size=UDim2.new(1,0,0,16),BackgroundTransparency=1,Font=Enum.Font.GothamBold,Text="Zoom",TextSize=12,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=3,Parent=ssc}),{TextColor3="text"})
local zr=Util.create("Frame",{Size=UDim2.new(1,0,0,26),BackgroundTransparency=1,LayoutOrder=4,Parent=ssc},{Util.create("UIListLayout",{FillDirection=Enum.FillDirection.Horizontal,Padding=UDim.new(0,5),SortOrder=Enum.SortOrder.LayoutOrder})})
local zi=makeOutlineBtn(zr,"Zoom +",1,0.32); local zo=makeOutlineBtn(zr,"Zoom -",2,0.32); local zz=makeOutlineBtn(zr,"Reset",3,0.32)
zi.MouseButton1Click:Connect(function() YT.zoom(5) end); zo.MouseButton1Click:Connect(function() YT.zoom(-5) end); zz.MouseButton1Click:Connect(function() YT.resetZoom() end)
local sp=makeSection(pg,"Producao",3,true)
reg(Util.create("TextLabel",{Size=UDim2.new(1,0,0,16),BackgroundTransparency=1,Font=Enum.Font.GothamBold,Text="Marcadores",TextSize=12,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=1,Parent=sp}),{TextColor3="text"})
local mr=Util.create("Frame",{Size=UDim2.new(1,0,0,26),BackgroundTransparency=1,LayoutOrder=2,Parent=sp},{Util.create("UIListLayout",{FillDirection=Enum.FillDirection.Horizontal,Padding=UDim.new(0,5),SortOrder=Enum.SortOrder.LayoutOrder})})
local ms=makeOutlineBtn(mr,"Salvar",1,0.32); local mc=makeOutlineBtn(mr,"Limpar",2,0.32); local mv=makeOutlineBtn(mr,"Ver",3,0.32)
ms.MouseButton1Click:Connect(function() local c=WS.CurrentCamera; if not c then return end table.insert(YT.markers,{name="M"..#YT.markers+1,cf=c.CFrame}); showToast("Marcador #"..#YT.markers,1.5) end)
mc.MouseButton1Click:Connect(function() YT.markers={}; showToast("Limpos",1.5) end)
mv.MouseButton1Click:Connect(function() showToast("Marcadores: "..#YT.markers,1.5) end)
reg(Util.create("TextLabel",{Size=UDim2.new(1,0,0,16),BackgroundTransparency=1,Font=Enum.Font.GothamBold,Text="Temporizador",TextSize=12,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=3,Parent=sp}),{TextColor3="text"})
local ty=reg(Util.create("TextLabel",{Size=UDim2.new(1,0,0,20),BackgroundTransparency=1,Font=Enum.Font.Code,Text="00:00:00",TextSize=14,LayoutOrder=4,Parent=sp}),{TextColor3="accent"})
local trow=Util.create("Frame",{Size=UDim2.new(1,0,0,26),BackgroundTransparency=1,LayoutOrder=5,Parent=sp},{Util.create("UIListLayout",{FillDirection=Enum.FillDirection.Horizontal,Padding=UDim.new(0,5),SortOrder=Enum.SortOrder.LayoutOrder})})
local bst=makeOutlineBtn(trow,"Iniciar",1,0.24); local bpa=makeOutlineBtn(trow,"Pausar",2,0.24); local bre=makeOutlineBtn(trow,"Continuar",3,0.24); local bze=makeOutlineBtn(trow,"Zerar",4,0.24)
bst.MouseButton1Click:Connect(function() YT.timerReset(); YT.timerStart() end); bpa.MouseButton1Click:Connect(function() YT.timerPause() end); bre.MouseButton1Click:Connect(function() YT.timerResume() end); bze.MouseButton1Click:Connect(function() YT.timerReset() end)
task.spawn(function() while screenGui.Parent do if ty and ty.Parent then ty.Text=Util.formatTime(YT.timerGet()) end task.wait(0.25) end end)
local scap=makeSection(pg,"Captura",4,true)
local infoOverlay
makeOptionRow(scap,"Captura de infos","Mostra jogo/jogador.",1,function(r) return makeToggle(r,false,function(s) YT.infoVisible=s; if infoOverlay then infoOverlay.Visible=s end end) end)
makeOptionRow(scap,"Modo thumbnail","Prepara a tela.",2,function(r) return makeToggle(r,false,function(s) YT.thumbnailMode=s; mainFrame.Visible=not s; restoreBtn.Visible=s end) end)
local sci=makeSection(pg,"Cinematografia",5,true)
makeOptionRow(sci,"Modo cinematic","Zoom + pan suave.",1,function(r) return makeToggle(r,false,function(s) YT.cinematicMode=s; if s then YT.zoom(10); YT.startPan("horizontal"); YT.cinematicStart(); showToast("Cinematic ON",1.5) else YT.cinematicStop(); YT.stopPan(); YT.resetZoom(); showToast("Cinematic OFF",1.5) end end) end)
infoOverlay=Util.create("Frame",{Size=UDim2.new(0,200,0,60),Position=UDim2.new(0,20,0.5,-30),BackgroundTransparency=0.5,BorderSizePixel=0,ZIndex=150,Visible=false,Parent=screenGui})
reg(infoOverlay,{BackgroundColor3="cardBg"})
Util.create("UICorner",{CornerRadius=UDim.new(0,6),Parent=infoOverlay})
local il=reg(Util.create("TextLabel",{Size=UDim2.new(1,-10,1,0),Position=UDim2.new(0,5,0,0),BackgroundTransparency=1,Font=Enum.Font.GothamBold,Text="",TextSize=10,TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,Parent=infoOverlay}),{TextColor3="text"})
task.spawn(function() while screenGui.Parent do if YT.infoVisible and il and il.Parent then il.Text="Jogo: "..ProjectInfo.Game.."\nJogador: "..LP.Name.."\nHora: "..os.date("%H:%M:%S") end task.wait(1) end end)
end

-- SHADERS
do
makeTab("Shaders","🌅","Shaders",5)
local pg=makePage("Shaders")
local spr=makeSection(pg,"Presets",1,true)
local grid=Util.create("Frame",{Size=UDim2.new(1,0,0,120),BackgroundTransparency=1,LayoutOrder=1,Parent=spr},{Util.create("UIGridLayout",{CellSize=UDim2.new(0,100,0,26),CellPadding=UDim2.new(0,4,0,4),SortOrder=Enum.SortOrder.LayoutOrder})})
local names={"Realista","Cinematico","GoldenHour","BlueHour","Fantasy","UltraRealista","Original"}
local pmap={}
for i,n in ipairs(names) do
local b=Util.create("TextButton",{Size=UDim2.new(0,100,0,26),BackgroundTransparency=0.25,BorderSizePixel=0,Text=n,Font=Enum.Font.GothamBold,TextSize=10,AutoButtonColor=false,LayoutOrder=i,Parent=grid})
reg(b,{BackgroundColor3="cardBg",TextColor3="text"})
Util.create("UICorner",{CornerRadius=UDim.new(0,5),Parent=b})
b.MouseButton1Click:Connect(function()
Shaders.setPreset(n)
for nm,bt in pairs(pmap) do
local a=(nm==n)
bt.BackgroundColor3=a and Colors.accent or Colors.cardBg
bt.TextColor3=a and Color3.fromRGB(255,255,255) or Colors.textMuted
bt.BackgroundTransparency=a and 0 or 0.25
end
showToast("Preset: "..n,1.5)
end)
pmap[n]=b
end
local spf=makeSection(pg,"Perfil",2,true)
local pr=Util.create("Frame",{Size=UDim2.new(1,0,0,28),BackgroundTransparency=1,LayoutOrder=1,Parent=spf},{Util.create("UIListLayout",{FillDirection=Enum.FillDirection.Horizontal,Padding=UDim.new(0,5),SortOrder=Enum.SortOrder.LayoutOrder})})
local pMap={}
for i,n in ipairs({"Performance","Balanceado","Ultra"}) do
local b=makeOutlineBtn(pr,n,i,0.33)
b.MouseButton1Click:Connect(function()
Shaders.setProfile(n)
for nm,bt in pairs(pMap) do
local a=(nm==n)
bt.BackgroundColor3=a and Colors.accent or Colors.cardBg
bt.TextColor3=a and Color3.fromRGB(255,255,255) or Colors.text
end
local m=(n=="Ultra") and "Ultra - FPS pode cair!" or ("Perfil: "..n)
showToast(m,2)
end)
pMap[n]=b
end
local sctrl=makeSection(pg,"Iluminacao",3,true)
makeLabeledSlider(sctrl,"Brilho","Brightness.",0,5,2,1,function(v) pcall(function() LT.Brightness=v end) end)
makeLabeledSlider(sctrl,"Exposicao","ExposureComp.",-2,2,0,2,function(v) pcall(function() LT.ExposureCompensation=v end) end)
makeLabeledSlider(sctrl,"FogEnd","Nevoa.",100,5000,1500,3,function(v) pcall(function() LT.FogEnd=v end) end)
makeLabeledSlider(sctrl,"ClockTime","Hora.",0,24,14,4,function(v) pcall(function() LT.ClockTime=v end) end)
local sfx=makeSection(pg,"Efeitos",4,true)
local function makeEffectToggle(title,desc,order,fxType,fxName,fxProps)
    makeOptionRow(sfx,title,desc,order,function(r) return makeToggle(r,false,function(s)
        local fx=LT:FindFirstChild(fxName)
        if s and not fx then
            fx=Instance.new(fxType); fx.Name=fxName; fx.Parent=LT
            if fxProps then for k,v in pairs(fxProps) do pcall(function() fx[k]=v end) end end
            Shaders.owned[fxName]=fx
        end
        if fx then fx.Enabled=s end
    end) end)
end
makeEffectToggle("Color Correction","Ajuste de cor.",1,"ColorCorrectionEffect","DarkHub_CC",nil)
makeEffectToggle("Bloom","Realca luzes.",2,"BloomEffect","DarkHub_Bloom",{Intensity=0.8,Size=22,Threshold=1})
makeEffectToggle("Sun Rays","Raios de sol.",3,"SunRaysEffect","DarkHub_SunRays",{Intensity=0.1,Spread=0.8})
makeEffectToggle("Depth of Field","Desfoca fundo.",4,"DepthOfFieldEffect","DarkHub_DOF",{FarIntensity=0.3,FocusDistance=40,InFocusRadius=25,NearIntensity=0})
makeEffectToggle("Atmosphere","Nevoa atmosferica.",5,"Atmosphere","DarkHub_Atmo",{Density=0.3,Haze=0.5})
makeEffectToggle("Blur","Desfoque opcional.",6,"BlurEffect","DarkHub_Blur",{Size=6})
local srst=makeSection(pg,"Restauracao",5,true)
local rst=Util.create("Frame",{Size=UDim2.new(1,0,0,28),BackgroundTransparency=1,LayoutOrder=1,Parent=srst})
local rb=makeOutlineBtn(rst,"Restaurar Original",1,1)
rb.Position=UDim2.new(0,0,0,0); rb.Size=UDim2.new(1,0,0,28)
rb.MouseButton1Click:Connect(function()
Shaders.cleanup()
for _,b in pairs(pmap) do b.BackgroundColor3=Colors.cardBg; b.TextColor3=Colors.textMuted; b.BackgroundTransparency=0.25 end
showToast("Shaders restaurados",2)
end)
end

-- SETTINGS
do
makeTab("Settings","⚙","Settings",6)
local pg=makePage("Settings")
local sa=makeSection(pg,"Aparencia",1,true)
reg(Util.create("TextLabel",{Size=UDim2.new(1,0,0,16),BackgroundTransparency=1,Font=Enum.Font.GothamBold,Text="Tema",TextSize=12,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=1,Parent=sa}),{TextColor3="text"})
local tg=Util.create("Frame",{Size=UDim2.new(1,0,0,92),BackgroundTransparency=1,LayoutOrder=2,Parent=sa},{Util.create("UIGridLayout",{CellSize=UDim2.new(0,90,0,28),CellPadding=UDim2.new(0,4,0,4),SortOrder=Enum.SortOrder.LayoutOrder})})
local tn={"Dark","Navy","Purple","Green","Neon","Matrix","Ocean"}
local tmap={}
for i,n in ipairs(tn) do
local b=Util.create("TextButton",{Size=UDim2.new(0,90,0,28),BackgroundTransparency=0.2,BorderSizePixel=0,Text=n,Font=Enum.Font.GothamBold,TextSize=11,AutoButtonColor=false,LayoutOrder=i,Parent=tg})
Util.create("UICorner",{CornerRadius=UDim.new(0,5),Parent=b})
b.MouseButton1Click:Connect(function()
applyTheme(n)
for nm,bt in pairs(tmap) do
local a=(nm==n)
bt.BackgroundColor3=a and Colors.accent or Colors.cardBg
bt.TextColor3=a and Color3.fromRGB(255,255,255) or Colors.textMuted
bt.BackgroundTransparency=a and 0 or 0.2
end
end)
tmap[n]=b
end
makeLabeledSlider(sa,"Opacidade","100=solido / 20=translucido.",20,100,100,3,function(v) applyOpacity(v) end)
local sb=makeSection(pg,"Fundo",2,true)
local bi=Util.create("TextBox",{Size=UDim2.new(1,0,0,30),BackgroundTransparency=0.15,BorderSizePixel=0,Font=Enum.Font.Gotham,Text="",PlaceholderText="ID ou URL",PlaceholderColor3=Color3.fromRGB(130,130,150),TextSize=12,TextXAlignment=Enum.TextXAlignment.Left,ClearTextOnFocus=false,LayoutOrder=1,Parent=sb})
reg(bi,{BackgroundColor3="cardBg",TextColor3="text"})
Util.create("UICorner",{CornerRadius=UDim.new(0,6),Parent=bi})
Util.create("UIPadding",{PaddingLeft=UDim.new(0,10),PaddingRight=UDim.new(0,10),Parent=bi})
local bbr=Util.create("Frame",{Size=UDim2.new(1,0,0,28),BackgroundTransparency=1,LayoutOrder=2,Parent=sb},{Util.create("UIListLayout",{FillDirection=Enum.FillDirection.Horizontal,Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder})})
local ba=makeOutlineBtn(bbr,"Aplicar",1); local bc=makeOutlineBtn(bbr,"Limpar",2)
local bs=makeInfoLabel(sb,"Sem fundo.",3,"textMuted")
ba.MouseButton1Click:Connect(function() local a,e=Util.parseAssetId(bi.Text); if not a then bs.Text="Erro: "..tostring(e); bs.TextColor3=Colors.danger; return end if pcall(function() bgImage.Image=a end) then bs.Text="Aplicado"; bs.TextColor3=Colors.success else bs.Text="Invalido"; bs.TextColor3=Colors.danger end end)
bc.MouseButton1Click:Connect(function() bgImage.Image=""; bi.Text=""; bs.Text="Sem fundo."; bs.TextColor3=Colors.textMuted end)
end

-- SOBRE
do
makeTab("Sobre","ℹ","Sobre",7)
local pg=makePage("Sobre")
local ic=makeCard(pg,1,130)
reg(Util.create("TextLabel",{Size=UDim2.new(1,-28,0,18),Position=UDim2.new(0,14,0,10),BackgroundTransparency=1,Font=Enum.Font.GothamBold,Text="Informacoes",TextSize=13,TextXAlignment=Enum.TextXAlignment.Left,Parent=ic}),{TextColor3="accent"})
local fields={{"Nome",ProjectInfo.Name},{"Jogo",ProjectInfo.Game},{"Criador",ProjectInfo.Creator},{"Developer",ProjectInfo.Developer},{"Versao",ProjectInfo.Version},{"Data",ProjectInfo.CreationDate}}
for i,p in ipairs(fields) do
local y=30+(i-1)*16
reg(Util.create("TextLabel",{Size=UDim2.new(0.5,0,0,14),Position=UDim2.new(0,14,0,y),BackgroundTransparency=1,Font=Enum.Font.GothamMedium,Text=p[1]..":",TextSize=10,TextXAlignment=Enum.TextXAlignment.Left,Parent=ic}),{TextColor3="textMuted"})
reg(Util.create("TextLabel",{Size=UDim2.new(0.5,-14,0,14),Position=UDim2.new(0.5,0,0,y),BackgroundTransparency=1,Font=Enum.Font.GothamBold,Text=p[2],TextSize=10,TextXAlignment=Enum.TextXAlignment.Right,Parent=ic}),{TextColor3="text"})
end
local dc=makeCard(pg,2,140)
reg(Util.create("TextLabel",{Size=UDim2.new(1,-28,0,18),Position=UDim2.new(0,14,0,10),BackgroundTransparency=1,Font=Enum.Font.GothamBold,Text="Sobre o Dark Hub",TextSize=13,TextXAlignment=Enum.TextXAlignment.Left,Parent=dc}),{TextColor3="accent"})
reg(Util.create("TextLabel",{Size=UDim2.new(1,-28,0,100),Position=UDim2.new(0,14,0,34),BackgroundTransparency=1,Font=Enum.Font.Gotham,Text=ProjectInfo.Description,TextSize=10,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,Parent=dc}),{TextColor3="textMuted"})
local dcc=makeCard(pg,3,70)
reg(Util.create("TextLabel",{Size=UDim2.new(1,-28,0,16),Position=UDim2.new(0,14,0,8),BackgroundTransparency=1,Font=Enum.Font.GothamBold,Text="Comunidade",TextSize=12,TextXAlignment=Enum.TextXAlignment.Left,Parent=dcc}),{TextColor3="text"})
local db2=Util.create("TextButton",{Size=UDim2.new(0,180,0,26),Position=UDim2.new(0,14,0,36),BackgroundColor3=Color3.fromRGB(88,101,242),BorderSizePixel=0,Text="Copiar link do Discord",Font=Enum.Font.GothamBold,TextSize=11,TextColor3=Color3.fromRGB(255,255,255),AutoButtonColor=false,Parent=dcc})
Util.create("UICorner",{CornerRadius=UDim.new(0,6),Parent=db2})
db2.MouseButton1
