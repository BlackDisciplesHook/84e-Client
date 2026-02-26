local init = {cache = {}}

do
    do
        local __modImpl = function()
            local assert, type, setfenv = assert, type, setfenv

            LPH_ENCNUM = function(toEncrypt, ...)
                assert(type(toEncrypt) == 'number' and #{...} == 0, [[LPH_ENCNUM only accepts a single constant double or integer as an argument.]])

                return toEncrypt
            end
            LPH_NUMENC = LPH_ENCNUM
            LPH_ENCSTR = function(toEncrypt, ...)
                assert(type(toEncrypt) == 'string' and #{...} == 0, [[LPH_ENCSTR only accepts a single constant string as an argument.]])

                return toEncrypt
            end
            LPH_STRENC = LPH_ENCSTR
            LPH_ENCFUNC = function(toEncrypt, encKey, decKey, ...)
                assert(type(toEncrypt) == 'function' and type(encKey) == 'string' and #{...} == 0, [[LPH_ENCFUNC accepts a constant function, constant string, and string variable as arguments.]])

                return toEncrypt
            end
            LPH_FUNCENC = LPH_ENCFUNC
            LPH_JIT = function(f, ...)
                assert(type(f) == 'function' and #{...} == 0, [[LPH_JIT only accepts a single constant function as an argument.]])

                return f
            end
            LPH_JIT_MAX = LPH_JIT
            LPH_NO_VIRTUALIZE = function(f, ...)
                assert(type(f) == 'function' and #{...} == 0, [[LPH_NO_VIRTUALIZE only accepts a single constant function as an argument.]])

                return f
            end
            LPH_NO_UPVALUES = function(f, ...)
                assert(type(setfenv) == 'function', [[LPH_NO_UPVALUES can only be used on Lua versions with getfenv & setfenv]])
                assert(type(f) == 'function' and #{...} == 0, [[LPH_NO_UPVALUES only accepts a single constant function as an argument.]])

                return f
            end
            LPH_CRASH = function(...)
                assert(#{...} == 0, 'LPH_CRASH does not accept any arguments.')
            end

            if getgenv().Library then
                getgenv().Library:Unload()
            end

            local Library

            LPH_NO_VIRTUALIZE(function()
                do
                    local UserInputService, Players, Workspace, HttpService, TweenService, CoreGui = game:GetService'UserInputService', game:GetService'Players', game:GetService'Workspace', game:GetService'HttpService', game:GetService'TweenService', cloneref and cloneref(game:GetService'CoreGui') or game:GetService'CoreGui'
                    local gethui, LocalPlayer, Camera = gethui or function()
                        return CoreGui
                    end, Players.LocalPlayer, Workspace.CurrentCamera
                    local Mouse, FromRGB, FromHSV, FromHex, RGBSequence, RGBSequenceKeypoint, NumSequence, NumSequenceKeypoint, UDim2New, UDimNew, Vector2New, InstanceNew, MathClamp, MathFloor, TableInsert, TableFind, TableRemove, TableConcat, TableUnpack, StringFormat, StringFind, StringGSub = LocalPlayer:GetMouse(), Color3.fromRGB, Color3.fromHSV, Color3.fromHex, ColorSequence.new, ColorSequenceKeypoint.new, NumberSequence.new, NumberSequenceKeypoint.new, UDim2.new, UDim.new, Vector2.new, Instance.new, math.clamp, math.floor, table.insert, table.find, table.remove, table.concat, table.unpack, string.format, string.find, string.gsub

                    Library = {
                        Flags = {},
                        Theme = {
                            Background = FromRGB(15, 15, 20),
                            Inline = FromRGB(20, 20, 25),
                            ['Page Background'] = FromRGB(30, 30, 35),
                            Border = FromRGB(10, 10, 10),
                            Outline = FromRGB(27, 27, 32),
                            Accent = FromRGB(235, 157, 255),
                            Element = FromRGB(33, 33, 36),
                            ['Hovered Element'] = FromRGB(40, 40, 43),
                            Text = FromRGB(215, 215, 215),
                            ['Text Border'] = FromRGB(0, 0, 0),
                        },
                        MenuKeybind = Enum.KeyCode.Z,
                        Tween = {
                            Time = 0.3,
                            Style = Enum.EasingStyle.Exponential,
                            Direction = Enum.EasingDirection.Out,
                        },
                        Folders = {
                            Directory = '84e Client',
                            Configs = '84e Client/Configs',
                            Assets = '84e Client/Assets',
                        },
                        Images = {
                            Saturation = {
                                'Saturation.png',
                                [[https://github.com/sametexe001/images/blob/main/saturation.png?raw=true]],
                            },
                            Value = {
                                'Value.png',
                                [[https://github.com/sametexe001/images/blob/main/value.png?raw=true]],
                            },
                            Hue = {
                                'Hue.png',
                                [[https://github.com/sametexe001/images/blob/main/hue.png?raw=true]],
                            },
                            Scrollbar = {
                                'Scrollbar.png',
                                [[https://github.com/sametexe001/images/blob/main/scrollbar.png?raw=true]],
                            },
                            Checkers = {
                                'Checkers.png',
                                [[https://github.com/sametexe001/images/blob/main/checkers.png?raw=true]],
                            },
                            Resize = {
                                'Resize.png',
                                [[https://github.com/sametexe001/images/blob/main/resize.png?raw=true]],
                            },
                        },
                        Pages = {},
                        Sections = {},
                        Connections = {},
                        Threads = {},
                        ThemeMap = {},
                        ThemeItems = {},
                        SetFlags = {},
                        UnnamedConnections = 0,
                        UnnamedFlags = 0,
                        Holder = nil,
                        NotifHolder = nil,
                        Font = nil,
                        KeyList = nil,
                        CurrentColorpicker = nil,
                    }
                    Library.__index = Library
                    Library.Sections.__index = Library.Sections
                    Library.Pages.__index = Library.Pages

                    local Keys = {
                        Unknown = 'Unknown',
                        Backspace = 'Back',
                        Tab = 'Tab',
                        Clear = 'Clear',
                        Return = 'Return',
                        Pause = 'Pause',
                        Escape = 'Escape',
                        Space = 'Space',
                        QuotedDouble = '"',
                        Hash = '#',
                        Dollar = '$',
                        Percent = '%',
                        Ampersand = '&',
                        Quote = "'",
                        LeftParenthesis = '(',
                        RightParenthesis = ' )',
                        Asterisk = '*',
                        Plus = '+',
                        Comma = ',',
                        Minus = '-',
                        Period = '.',
                        Slash = '`',
                        Three = '3',
                        Seven = '7',
                        Eight = '8',
                        Colon = ':',
                        Semicolon = ';',
                        LessThan = '<',
                        GreaterThan = '>',
                        Question = '?',
                        Equals = '=',
                        At = '@',
                        LeftBracket = 'LeftBracket',
                        RightBracket = 'RightBracked',
                        BackSlash = 'BackSlash',
                        Caret = '^',
                        Underscore = '_',
                        Backquote = '`',
                        LeftCurly = '{',
                        Pipe = '|',
                        RightCurly = '}',
                        Tilde = '~',
                        Delete = 'Delete',
                        End = 'End',
                        KeypadZero = 'Keypad0',
                        KeypadOne = 'Keypad1',
                        KeypadTwo = 'Keypad2',
                        KeypadThree = 'Keypad3',
                        KeypadFour = 'Keypad4',
                        KeypadFive = 'Keypad5',
                        KeypadSix = 'Keypad6',
                        KeypadSeven = 'Keypad7',
                        KeypadEight = 'Keypad8',
                        KeypadNine = 'Keypad9',
                        KeypadPeriod = 'KeypadP',
                        KeypadDivide = 'KeypadD',
                        KeypadMultiply = 'KeypadM',
                        KeypadMinus = 'KeypadM',
                        KeypadPlus = 'KeypadP',
                        KeypadEnter = 'KeypadE',
                        KeypadEquals = 'KeypadE',
                        Insert = 'Insert',
                        Home = 'Home',
                        PageUp = 'PageUp',
                        PageDown = 'PageDown',
                        RightShift = 'RightShift',
                        LeftShift = 'LeftShift',
                        RightControl = 'RightControl',
                        LeftControl = 'LeftControl',
                        LeftAlt = 'LeftAlt',
                        RightAlt = 'RightAlt',
                    }

                    for _, FileName in Library.Folders do
                        if not isfolder(FileName) then
                            makefolder(FileName)
                        end
                    end
                    for _, ImageData in Library.Images do
                        local ImageName, ImageLink = ImageData[1], ImageData[2]

                        if not isfile(Library.Folders.Assets .. '/' .. ImageName) then
                            writefile(Library.Folders.Assets .. '/' .. ImageName, game:HttpGet(ImageLink))
                        end
                    end

                    local Tween = {}

                    do
                        Tween.__index = Tween
                        Tween.Create = function(self, Item, Info, Goal, IsRawItem)
                            Item = IsRawItem and Item or Item.Instance
                            Info = Info or TweenInfo.new(Library.Tween.Time, Library.Tween.Style, Library.Tween.Direction)

                            local NewTween = {
                                Tween = TweenService:Create(Item, Info, Goal),
                                Info = Info,
                                Goal = Goal,
                                Item = Item,
                            }

                            NewTween.Tween:Play()
                            setmetatable(NewTween, Tween)

                            return NewTween
                        end
                        Tween.Get = function(self)
                            if not self.Tween then
                                return
                            end

                            return self.Tween, self.Info, self.Goal
                        end
                        Tween.Pause = function(self)
                            if not self.Tween then
                                return
                            end

                            self.Tween:Pause()
                        end
                        Tween.Play = function(self)
                            if not self.Tween then
                                return
                            end

                            self.Tween:Play()
                        end
                        Tween.Clean = function(self)
                            if not self.Tween then
                                return
                            end

                            Tween:Pause()

                            self = nil
                        end
                    end

                    local Instances = {}

                    do
                        Instances.__index = Instances
                        Instances.Create = function(self, Class, Properties)
                            local NewItem = {
                                Instance = InstanceNew(Class),
                                Properties = Properties,
                                Class = Class,
                            }

                            setmetatable(NewItem, Instances)

                            for Property, Value in NewItem.Properties do
                                NewItem.Instance[Property] = Value
                            end

                            return NewItem
                        end
                        Instances.Border = function(self)
                            if not self.Instance then
                                return
                            end

                            local Item = self.Instance
                            local UIStroke = Instances:Create('UIStroke', {
                                Parent = Item,
                                Color = Library.Theme.Border,
                                Thickness = 1,
                                LineJoinMode = Enum.LineJoinMode.Miter,
                            })

                            UIStroke:AddToTheme{
                                Color = 'Border',
                            }

                            return UIStroke
                        end
                        Instances.AddToTheme = function(self, Properties)
                            if not self.Instance then
                                return
                            end

                            Library:AddToTheme(self, Properties)
                        end
                        Instances.ChangeItemTheme = function(self, Properties)
                            if not self.Instance then
                                return
                            end

                            Library:ChangeItemTheme(self, Properties)
                        end
                        Instances.Connect = function(self, Event, Callback, Name)
                            if not self.Instance then
                                return
                            end
                            if not self.Instance[Event] then
                                return
                            end

                            return Library:Connect(self.Instance[Event], Callback, Name)
                        end
                        Instances.Tween = function(self, Info, Goal)
                            if not self.Instance then
                                return
                            end

                            return Tween:Create(self, Info, Goal)
                        end
                        Instances.Disconnect = function(self, Name)
                            if not self.Instance then
                                return
                            end

                            return Library:Disconnect(Name)
                        end
                        Instances.Clean = function(self)
                            if not self.Instance then
                                return
                            end

                            self.Instance:Destroy()

                            self = nil
                        end
                        Instances.MakeDraggable = function(self)
                            if not self.Instance then
                                return
                            end

                            local Gui, Dragging, DragStart, StartPosition = self.Instance, false
                            local Set = function(Input)
                                local DragDelta = Input.Position - DragStart

                                self:Tween(TweenInfo.new(0.16, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                                    Position = UDim2New(StartPosition.X.Scale, StartPosition.X.Offset + DragDelta.X, StartPosition.Y.Scale, StartPosition.Y.Offset + DragDelta.Y),
                                })
                            end

                            self:Connect('InputBegan', function(Input)
                                if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                                    Dragging = true
                                    DragStart = Input.Position
                                    StartPosition = Gui.Position
                                end
                            end)
                            self:Connect('InputEnded', function(Input)
                                if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                                    Dragging = false
                                end
                            end)
                            Library:Connect(UserInputService.InputChanged, function(Input)
                                if Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch then
                                    if Dragging then
                                        Set(Input)
                                    end
                                end
                            end)

                            return Dragging
                        end
                        Instances.MakeResizeable = function(self, Minimum, Maximum)
                            if not self.Instance then
                                return
                            end

                            local Gui, Resizing, Start, Delta = self.Instance, false, UDim2New(), UDim2New()
                            local ResizeMax, ResizeButton = Gui.Parent.AbsoluteSize - Gui.AbsoluteSize, Instances:Create('TextButton', {
                                Parent = Gui,
                                AnchorPoint = Vector2New(1, 1),
                                BorderColor3 = FromRGB(0, 0, 0),
                                Size = UDim2New(0, 8, 0, 8),
                                Position = UDim2New(1, 0, 1, 0),
                                Name = '\0',
                                BorderSizePixel = 0,
                                BackgroundTransparency = 1,
                                AutoButtonColor = false,
                                Visible = true,
                                Text = '',
                            })

                            ResizeButton:Connect('InputBegan', function(Input)
                                if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                                    Resizing = true
                                    Start = Gui.Size - UDim2New(0, Input.Position.X, 0, Input.Position.Y)
                                end
                            end)
                            ResizeButton:Connect('InputEnded', function(Input)
                                if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                                    Resizing = false
                                end
                            end)
                            Library:Connect(UserInputService.InputChanged, function(Input)
                                if Input.UserInputType == Enum.UserInputType.MouseMovement and Resizing then
                                    ResizeMax = Maximum or Gui.Parent.AbsoluteSize - Gui.AbsoluteSize
                                    Delta = Start + UDim2New(0, Input.Position.X, 0, Input.Position.Y)
                                    Delta = UDim2New(0, math.clamp(Delta.X.Offset, Minimum.X, ResizeMax.X), 0, math.clamp(Delta.Y.Offset, Minimum.Y, ResizeMax.Y))

                                    Tween:Create(Gui, TweenInfo.new(0.17, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = Delta}, true)
                                end
                            end)

                            return Resizing
                        end
                        Instances.OnHover = function(self, Function)
                            if not self.Instance then
                                return
                            end

                            return Library:Connect(self.Instance.MouseEnter, Function)
                        end
                        Instances.OnHoverLeave = function(self, Function)
                            if not self.Instance then
                                return
                            end

                            return Library:Connect(self.Instance.MouseLeave, Function)
                        end
                    end

                    local CustomFont = {}

                    do
                        function CustomFont.New(self, Name, Weight, Style, Data)
                            if isfile(Library.Folders.Assets .. '/' .. Name .. '.json') then
                                return Font.new(getcustomasset(Library.Folders.Assets .. '/' .. Name .. '.json'))
                            end
                            if not isfile(Library.Folders.Assets .. '/' .. Name .. '.ttf') then
                                writefile(Library.Folders.Assets .. '/' .. Name .. '.ttf', game:HttpGet(Data.Url))
                            end

                            local FontData = {
                                name = Name,
                                faces = {
                                    {
                                        name = 'Regular',
                                        weight = Weight,
                                        style = Style,
                                        assetId = getcustomasset(Library.Folders.Assets .. '/' .. Name .. '.ttf'),
                                    },
                                },
                            }

                            writefile(Library.Folders.Assets .. '/' .. Name .. '.json', HttpService:JSONEncode(FontData))

                            return Font.new(getcustomasset(Library.Folders.Assets .. '/' .. Name .. '.json'))
                        end
                        function CustomFont.Get(self, Name)
                            if isfile(Library.Folders.Assets .. '/' .. Name .. '.json') then
                                return Font.new(getcustomasset(Library.Folders.Assets .. '/' .. Name .. '.json'))
                            end

                            return
                        end

                        CustomFont:New('Windows-XP-Tahoma', 200, 'Regular', {
                            Url = [[https://github.com/sametexe001/luas/raw/refs/heads/main/fonts/windows-xp-tahoma.ttf]],
                        })

                        Library.Font = CustomFont:Get'Windows-XP-Tahoma'
                    end

                    Library.Holder = Instances:Create('ScreenGui', {
                        Parent = gethui(),
                        Name = '\0',
                        ResetOnSpawn = false,
                    })
                    Library.NotifHolder = Instances:Create('Frame', {
                        Parent = Library.Holder.Instance,
                        BorderColor3 = FromRGB(0, 0, 0),
                        AnchorPoint = Vector2New(0.5, 0),
                        BackgroundTransparency = 1,
                        Position = UDim2New(0.5, 0, 0, 0),
                        Name = '\0',
                        Size = UDim2New(0.34, 0, 1, -14),
                        BorderSizePixel = 0,
                        BackgroundColor3 = FromRGB(255, 255, 255),
                    })

                    Instances:Create('UIListLayout', {
                        Parent = Library.NotifHolder.Instance,
                        VerticalAlignment = Enum.VerticalAlignment.Top,
                        SortOrder = Enum.SortOrder.LayoutOrder,
                        HorizontalAlignment = Enum.HorizontalAlignment.Center,
                        Padding = UDimNew(0, 10),
                    })

                    Library.GetImage = function(self, Image)
                        local ImageData = self.Images[Image]

                        if not ImageData then
                            return
                        end

                        return getcustomasset(self.Folders.Assets .. '/' .. ImageData[1])
                    end
                    Library.Round = function(self, Number, Float)
                        local Multiplier = 1 / (Float or 1)

                        return MathFloor(Number * Multiplier) / Multiplier
                    end
                    Library.GetTransparencyPropertyFromItem = function(self, Item)
                        if Item:IsA'Frame' then
                            return {
                                'BackgroundTransparency',
                            }
                        elseif Item:IsA'TextLabel' or Item:IsA'TextButton' then
                            return {
                                'TextTransparency',
                                'BackgroundTransparency',
                            }
                        elseif Item:IsA'ImageLabel' or Item:IsA'ImageButton' then
                            return {
                                'BackgroundTransparency',
                                'ImageTransparency',
                            }
                        elseif Item:IsA'ScrollingFrame' then
                            return {
                                'BackgroundTransparency',
                                'ScrollBarImageTransparency',
                            }
                        elseif Item:IsA'TextBox' then
                            return {
                                'TextTransparency',
                                'BackgroundTransparency',
                            }
                        elseif Item:IsA'UIStroke' then
                            return {
                                'Transparency',
                            }
                        end

                        return
                    end
                    Library.FadeItem = function(self, Item, Property, Visibility, Speed)
                        local OldTransparency = Item[Property]

                        Item[Property] = Visibility and 1 or OldTransparency

                        local NewTween = Tween:Create(Item, TweenInfo.new(Speed or Library.Tween.Time, Library.Tween.Style, Library.Tween.Direction), {
                            [Property] = Visibility and OldTransparency or 1,
                        }, true)

                        Library:Connect(NewTween.Tween.Completed, function()
                            if not Visibility then
                                task.wait()

                                Item[Property] = OldTransparency
                            end
                        end)

                        return NewTween
                    end
                    Library.Unload = function(self)
                        for Index, Value in self.Connections do
                            Value.Connection:Disconnect()
                        end
                        for Index, Value in self.Threads do
                            coroutine.close(Value)
                        end

                        if self.Holder then
                            self.Holder:Clean()
                        end

                        Library = nil
                        getgenv().Library = nil
                    end
                    Library.Thread = function(self, Function)
                        local NewThread = coroutine.create(Function)

                        coroutine.wrap(function()
                            coroutine.resume(NewThread)
                        end)()
                        TableInsert(self.Threads, NewThread)

                        return NewThread
                    end
                    Library.SafeCall = function(self, Function, ...)
                        local Arguements = {...}
                        local Success, Result = pcall(Function, TableUnpack(Arguements))

                        if not Success then
                            Library:Notification('Error caught in function, report this to the devs:\n' .. Result, 5, FromRGB(255, 0, 0))
                            warn(Result)

                            return false
                        end

                        return Success
                    end
                    Library.Connect = function(self, Event, Callback, Name)
                        Name = Name or StringFormat('Connection_%s_%s', self.UnnamedConnections + 1, HttpService:GenerateGUID(false))

                        local NewConnection = {
                            Event = Event,
                            Callback = Callback,
                            Name = Name,
                            Connection = nil,
                        }

                        Library:Thread(function()
                            NewConnection.Connection = Event:Connect(Callback)
                        end)
                        TableInsert(self.Connections, NewConnection)

                        return NewConnection
                    end
                    Library.Disconnect = function(self, Name)
                        for _, Connection in self.Connections do
                            if Connection.Name == Name then
                                Connection.Connection:Disconnect()

                                break
                            end
                        end
                    end
                    Library.NextFlag = function(self)
                        local FlagNumber = self.UnnamedFlags + 1

                        return StringFormat('Flag Number %s %s', FlagNumber, HttpService:GenerateGUID(false))
                    end
                    Library.AddToTheme = function(self, Item, Properties)
                        Item = Item.Instance or Item

                        local ThemeData = {
                            Item = Item,
                            Properties = Properties,
                        }

                        for Property, Value in ThemeData.Properties do
                            if type(Value) == 'string' then
                                Item[Property] = self.Theme[Value]
                            end
                        end

                        TableInsert(self.ThemeItems, ThemeData)

                        self.ThemeMap[Item] = ThemeData
                    end
                    Library.GetConfig = function(self)
                        local Config = {}

                        Library:SafeCall(function()
                            for Index, Value in Library.Flags do
                                if type(Value) == 'table' and Value.Key then
                                    Config[Index] = {
                                        Key = tostring(Value.Key),
                                        Mode = Value.Mode,
                                    }
                                elseif type(Value) == 'table' and Value.Color then
                                    Config[Index] = {
                                        Color = '#' .. Value.HexValue,
                                        Alpha = Value.Alpha,
                                    }
                                else
                                    Config[Index] = Value
                                end
                            end
                        end)

                        return HttpService:JSONEncode(Config)
                    end
                    Library.LoadConfig = function(self, Config)
                        local Decoded = HttpService:JSONDecode(Config)
                        local Success = Library:SafeCall(function()
                            for Index, Value in Decoded do
                                local __DARKLUA_CONTINUE_9 = false

                                repeat
                                    local SetFunction = Library.SetFlags[Index]

                                    if not SetFunction then
                                        __DARKLUA_CONTINUE_9 = true

                                        break
                                    end
                                    if type(Value) == 'table' and Value.Key then
                                        SetFunction(Value)
                                    elseif type(Value) == 'table' and Value.Color then
                                        SetFunction(Value.Color, Value.Alpha)
                                    else
                                        SetFunction(Value)
                                    end

                                    __DARKLUA_CONTINUE_9 = true
                                until true

                                if not __DARKLUA_CONTINUE_9 then
                                    break
                                end
                            end
                        end)

                        if Success then
                            Library:Notification('Successfully loaded config', 5, Color3.fromRGB(0, 255, 0))
                        end
                    end
                    Library.DeleteConfig = function(self, Config)
                        if isfile(Library.Folders.Configs .. '/' .. Config) then
                            delfile(Library.Folders.Configs .. '/' .. Config)
                            Library:Notification('Deleted config ' .. Config .. '.json', 5, Color3.fromRGB(0, 255, 0))
                        end
                    end
                    Library.SaveConfig = function(self, Config)
                        if isfile(Library.Folders.Directory .. '/' .. Library.Folders.Configs .. '/' .. Config .. '.json') then
                            writefile(Library.Folders.Directory .. '/' .. Library.Folders.Configs .. '/' .. Config .. '.json', Library:GetConfig())
                            Library:Notification('Saved config ' .. Config .. '.json', 5, Color3.fromRGB(0, 255, 0))
                        end
                    end
                    Library.RefreshConfigsList = function(self, Element)
                        local CurrentList, List, ConfigFolderName = {}, {}, StringGSub(Library.Folders.Configs, Library.Folders.Directory .. '/', '')

                        for Index, Value in listfiles(Library.Folders.Configs)do
                            local FileName = StringGSub(Value, Library.Folders.Directory .. '\\' .. ConfigFolderName .. '\\', '')

                            List[Index] = FileName
                        end

                        local IsNew = #List ~= CurrentList

                        if not IsNew then
                            for Index = 1, #List do
                                if List[Index] ~= CurrentList[Index] then
                                    IsNew = true

                                    break
                                end
                            end
                        else
                            CurrentList = List

                            Element:Refresh(CurrentList)
                        end
                    end
                    Library.ChangeItemTheme = function(self, Item, Properties)
                        Item = Item.Instance or Item

                        if not self.ThemeMap[Item] then
                            return
                        end

                        self.ThemeMap[Item].Properties = Properties
                        self.ThemeMap[Item] = self.ThemeMap[Item]
                    end
                    Library.ChangeTheme = function(self, Theme, Color)
                        self.Theme[Theme] = Color

                        for _, Item in self.ThemeItems do
                            for Property, Value in Item.Properties do
                                if type(Value) == 'string' and Value == Theme then
                                    Item.Item[Property] = Color
                                end
                            end
                        end
                    end
                    Library.IsMouseOverFrame = function(self, Frame)
                        Frame = Frame.Instance

                        local MousePosition = Vector2New(Mouse.X, Mouse.Y)

                        return MousePosition.X >= Frame.AbsolutePosition.X and MousePosition.X <= Frame.AbsolutePosition.X + Frame.AbsoluteSize.X and MousePosition.Y >= Frame.AbsolutePosition.Y and MousePosition.Y <= Frame.AbsolutePosition.Y + Frame.AbsoluteSize.Y
                    end
                    Library.Watermark = function(self, Name)
                        local Watermark, Items = {}, {}

                        do
                            Items.Watermark = Instances:Create('Frame', {
                                Parent = Library.Holder.Instance,
                                Size = UDim2New(0, 0, 0, 20),
                                Name = '\0',
                                Position = UDim2New(0, 15, 0, 15),
                                BorderColor3 = FromRGB(10, 10, 10),
                                BorderSizePixel = 2,
                                AutomaticSize = Enum.AutomaticSize.X,
                                BackgroundColor3 = FromRGB(15, 15, 20),
                            })

                            Items.Watermark:AddToTheme{
                                BackgroundColor3 = 'Background',
                                BorderColor3 = 'Border',
                            }
                            Items.Watermark:MakeDraggable()
                            Instances:Create('UIStroke', {
                                Parent = Items.Watermark.Instance,
                                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                                LineJoinMode = Enum.LineJoinMode.Miter,
                                Name = '\0',
                                Color = FromRGB(27, 27, 32),
                            }):AddToTheme{
                                Color = 'Outline',
                            }
                            Instances:Create('UIPadding', {
                                Parent = Items.Watermark.Instance,
                                PaddingTop = UDimNew(0, 2),
                                PaddingRight = UDimNew(0, 5),
                                PaddingLeft = UDimNew(0, 5),
                            })

                            Items.Title = Instances:Create('TextLabel', {
                                Parent = Items.Watermark.Instance,
                                FontFace = Library.Font,
                                TextColor3 = FromRGB(215, 215, 215),
                                BorderColor3 = FromRGB(0, 0, 0),
                                Text = Name,
                                Name = '\0',
                                Size = UDim2New(1, 0, 0, 15),
                                BackgroundTransparency = 1,
                                Position = UDim2New(0, 0, 0, 1),
                                BorderSizePixel = 0,
                                AutomaticSize = Enum.AutomaticSize.X,
                                TextSize = 12,
                                BackgroundColor3 = FromRGB(255, 255, 255),
                            })

                            Items.Title:AddToTheme{
                                TextColor3 = 'Text',
                            }
                            Instances:Create('UIStroke', {
                                Parent = Items.Title.Instance,
                                LineJoinMode = Enum.LineJoinMode.Miter,
                                Name = '\0',
                            }):AddToTheme{
                                Color = 'Text Border',
                            }

                            Items.AccentLine = Instances:Create('Frame', {
                                Parent = Items.Watermark.Instance,
                                Name = '\0',
                                Position = UDim2New(0, -5, 0, -2),
                                BorderColor3 = FromRGB(0, 0, 0),
                                Size = UDim2New(1, 10, 0, 2),
                                BorderSizePixel = 0,
                                BackgroundColor3 = FromRGB(235, 157, 255),
                            })

                            Items.AccentLine:AddToTheme{
                                BackgroundColor3 = 'Accent',
                            }
                            Instances:Create('UIGradient', {
                                Parent = Items.AccentLine.Instance,
                                Rotation = 90,
                                Color = RGBSequence{
                                    RGBSequenceKeypoint(0, FromRGB(255, 255, 255)),
                                    RGBSequenceKeypoint(1, FromRGB(65, 65, 65)),
                                },
                            })
                        end

                        function Watermark.SetVisibility(self, Bool)
                            Items.Watermark.Instance.Visible = Bool
                        end

                        return Watermark
                    end
                    Library.Notification = function(self, Text, Duration, Color, Icon)
                        local Items = {}

                        do
                            Items.Notification = Instances:Create('Frame', {
                                Parent = Library.NotifHolder.Instance,
                                Name = '\0',
                                Size = UDim2New(0, 0, 0, 22),
                                BorderColor3 = FromRGB(10, 10, 10),
                                BorderSizePixel = 2,
                                AutomaticSize = Enum.AutomaticSize.X,
                                BackgroundColor3 = FromRGB(15, 15, 20),
                            })

                            Items.Notification:AddToTheme{
                                BackgroundColor3 = 'Background',
                                BorderColor3 = 'Border',
                            }
                            Instances:Create('UIStroke', {
                                Parent = Items.Notification.Instance,
                                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                                LineJoinMode = Enum.LineJoinMode.Miter,
                                Name = '\0',
                                Color = FromRGB(27, 27, 32),
                            }):AddToTheme{
                                Color = 'Outline',
                            }
                            Instances:Create('UIPadding', {
                                Parent = Items.Notification.Instance,
                                PaddingTop = UDimNew(0, 1),
                                PaddingRight = UDimNew(0, 8),
                                PaddingLeft = UDimNew(0, 5),
                            })

                            Items.Title = Instances:Create('TextLabel', {
                                Parent = Items.Notification.Instance,
                                FontFace = Library.Font,
                                TextColor3 = FromRGB(215, 215, 215),
                                BorderColor3 = FromRGB(0, 0, 0),
                                Text = Text,
                                Name = '\0',
                                Size = UDim2New(1, 0, 0, 15),
                                BackgroundTransparency = 1,
                                Position = UDim2New(0, 13, 0, 2),
                                BorderSizePixel = 0,
                                AutomaticSize = Enum.AutomaticSize.X,
                                TextSize = 12,
                                BackgroundColor3 = FromRGB(255, 255, 255),
                            })

                            Items.Title:AddToTheme{
                                TextColor3 = 'Text',
                            }
                            Instances:Create('UIStroke', {
                                Parent = Items.Title.Instance,
                                LineJoinMode = Enum.LineJoinMode.Miter,
                                Name = '\0',
                            }):AddToTheme{
                                Color = 'Text Border',
                            }

                            Items.AccentLine = Instances:Create('Frame', {
                                Parent = Items.Notification.Instance,
                                Name = '\0',
                                Position = UDim2New(0, -5, 0, -1),
                                BorderColor3 = FromRGB(0, 0, 0),
                                Size = UDim2New(1, 13, 0, 2),
                                BorderSizePixel = 0,
                                BackgroundColor3 = Color,
                            })

                            Instances:Create('UIGradient', {
                                Parent = Items.AccentLine.Instance,
                                Rotation = 90,
                                Color = RGBSequence{
                                    RGBSequenceKeypoint(0, FromRGB(255, 255, 255)),
                                    RGBSequenceKeypoint(1, FromRGB(65, 65, 65)),
                                },
                            })

                            Items.Icon = Instances:Create('ImageLabel', {
                                Parent = Items.Notification.Instance,
                                ImageColor3 = FromRGB(255, 255, 255),
                                ScaleType = Enum.ScaleType.Fit,
                                BorderColor3 = FromRGB(0, 0, 0),
                                Name = '\0',
                                Image = 'rbxassetid://94324346713012',
                                BackgroundTransparency = 1,
                                Position = UDim2New(0, -2, 0, 3),
                                Size = UDim2New(0, 13, 0, 13),
                                BorderSizePixel = 0,
                                BackgroundColor3 = FromRGB(255, 255, 255),
                            })

                            if not Icon then
                                Items.Icon:Clean()

                                Items.Title.Instance.Position = UDim2New(0, 1, 0, 2)
                            else
                                Items.Icon.Instance.Image = Icon[1]
                                Items.Icon.Instance.ImageColor3 = Icon[2] or FromRGB(255, 255, 255)
                            end
                        end

                        Items.Notification.Instance.BackgroundTransparency = 1
                        Items.Notification.Instance.Size = UDim2New(0, 0, 0, 0)

                        for Index, Value in Items.Notification.Instance:GetDescendants()do
                            if Value:IsA'UIStroke' then
                                Value.Transparency = 1
                            elseif Value:IsA'TextLabel' then
                                Value.TextTransparency = 1
                            elseif Value:IsA'ImageLabel' then
                                Value.ImageTransparency = 1
                            elseif Value:IsA'Frame' then
                                Value.BackgroundTransparency = 1
                            end
                        end

                        Library:Thread(function()
                            Items.Notification:Tween(nil, {
                                BackgroundTransparency = 0,
                                Size = UDim2New(0, 0, 0, 22),
                            })
                            task.wait(0.06)

                            for Index, Value in Items.Notification.Instance:GetDescendants()do
                                if Value:IsA'UIStroke' then
                                    Tween:Create(Value, nil, {Transparency = 0}, true)
                                elseif Value:IsA'TextLabel' then
                                    Tween:Create(Value, nil, {TextTransparency = 0}, true)
                                elseif Value:IsA'ImageLabel' then
                                    Tween:Create(Value, nil, {ImageTransparency = 0}, true)
                                elseif Value:IsA'Frame' then
                                    Tween:Create(Value, nil, {BackgroundTransparency = 0}, true)
                                end
                            end

                            task.delay(Duration + 0.1, function()
                                for Index, Value in Items.Notification.Instance:GetDescendants()do
                                    if Value:IsA'UIStroke' then
                                        Tween:Create(Value, nil, {Transparency = 1}, true)
                                    elseif Value:IsA'TextLabel' then
                                        Tween:Create(Value, nil, {TextTransparency = 1}, true)
                                    elseif Value:IsA'ImageLabel' then
                                        Tween:Create(Value, nil, {ImageTransparency = 1}, true)
                                    elseif Value:IsA'Frame' then
                                        Tween:Create(Value, nil, {BackgroundTransparency = 1}, true)
                                    end
                                end

                                task.wait(0.06)
                                Items.Notification:Tween(nil, {
                                    BackgroundTransparency = 1,
                                    Size = UDim2New(0, 0, 0, 0),
                                })
                                task.wait(0.5)
                                Items.Notification:Clean()
                            end)
                        end)
                    end
                    Library.KeybindList = function(self)
                        local KeybindList = {}

                        self.KeyList = KeybindList

                        local Items = {}

                        do
                            Items.KeybindList = Instances:Create('Frame', {
                                Parent = Library.Holder.Instance,
                                BorderColor3 = FromRGB(10, 10, 10),
                                AnchorPoint = Vector2New(0, 0.5),
                                Name = '\0',
                                Position = UDim2New(0, 15, 0.5, 0),
                                Size = UDim2New(0, 0, 0, 18),
                                BorderSizePixel = 2,
                                AutomaticSize = Enum.AutomaticSize.XY,
                                BackgroundColor3 = FromRGB(15, 15, 20),
                            })

                            Items.KeybindList:AddToTheme{
                                BackgroundColor3 = 'Background',
                                BorderColor3 = 'Border',
                            }
                            Items.KeybindList:MakeDraggable()
                            Instances:Create('UIStroke', {
                                Parent = Items.KeybindList.Instance,
                                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                                LineJoinMode = Enum.LineJoinMode.Miter,
                                Name = '\0',
                                Color = FromRGB(27, 27, 32),
                            }):AddToTheme{
                                Color = 'Outline',
                            }

                            Items.AccentLine = Instances:Create('Frame', {
                                Parent = Items.KeybindList.Instance,
                                Name = '\0',
                                Position = UDim2New(0, -5, 0, -5),
                                BorderColor3 = FromRGB(0, 0, 0),
                                Size = UDim2New(1, 10, 0, 2),
                                BorderSizePixel = 0,
                                BackgroundColor3 = FromRGB(235, 157, 255),
                            })

                            Items.AccentLine:AddToTheme{
                                BackgroundColor3 = 'Accent',
                            }
                            Instances:Create('UIGradient', {
                                Parent = Items.AccentLine.Instance,
                                Rotation = 90,
                                Color = RGBSequence{
                                    RGBSequenceKeypoint(0, FromRGB(255, 255, 255)),
                                    RGBSequenceKeypoint(1, FromRGB(65, 65, 65)),
                                },
                            })
                            Instances:Create('UIPadding', {
                                Parent = Items.KeybindList.Instance,
                                PaddingTop = UDimNew(0, 5),
                                PaddingBottom = UDimNew(0, 5),
                                PaddingRight = UDimNew(0, 5),
                                PaddingLeft = UDimNew(0, 5),
                            })

                            Items.Title = Instances:Create('TextLabel', {
                                Parent = Items.KeybindList.Instance,
                                FontFace = Library.Font,
                                TextColor3 = FromRGB(215, 215, 215),
                                BorderColor3 = FromRGB(0, 0, 0),
                                Text = 'Keybinds',
                                Name = '\0',
                                Size = UDim2New(0, 100, 0, 15),
                                BackgroundTransparency = 1,
                                TextXAlignment = Enum.TextXAlignment.Left,
                                Position = UDim2New(0, 0, 0, -1),
                                BorderSizePixel = 0,
                                TextSize = 12,
                                BackgroundColor3 = FromRGB(255, 255, 255),
                            })

                            Items.Title:AddToTheme{
                                TextColor3 = 'Text',
                            }
                            Instances:Create('UIStroke', {
                                Parent = Items.Title.Instance,
                                LineJoinMode = Enum.LineJoinMode.Miter,
                                Name = '\0',
                            }):AddToTheme{
                                Color = 'Text Border',
                            }

                            Items.Content = Instances:Create('Frame', {
                                Parent = Items.KeybindList.Instance,
                                Name = '\0',
                                BackgroundTransparency = 1,
                                Position = UDim2New(0, 5, 0, 19),
                                BorderColor3 = FromRGB(0, 0, 0),
                                BorderSizePixel = 0,
                                AutomaticSize = Enum.AutomaticSize.XY,
                                BackgroundColor3 = FromRGB(255, 255, 255),
                            })

                            Instances:Create('UIListLayout', {
                                Parent = Items.Content.Instance,
                                Padding = UDimNew(0, 4),
                                SortOrder = Enum.SortOrder.LayoutOrder,
                            })
                        end

                        function KeybindList.Add(self, Mode, Name, Key)
                            local NewKey = Instances:Create('TextLabel', {
                                Parent = Items.Content.Instance,
                                FontFace = Library.Font,
                                TextColor3 = FromRGB(215, 215, 215),
                                BorderColor3 = FromRGB(0, 0, 0),
                                Text = '(' .. Mode .. ') ' .. Name .. ' - ' .. Key,
                                Name = '\0',
                                Size = UDim2New(0, 0, 0, 15),
                                BackgroundTransparency = 1,
                                TextXAlignment = Enum.TextXAlignment.Left,
                                BorderSizePixel = 0,
                                AutomaticSize = Enum.AutomaticSize.X,
                                TextSize = 12,
                                BackgroundColor3 = FromRGB(255, 255, 255),
                            })

                            NewKey:AddToTheme{
                                TextColor3 = 'Text',
                            }
                            Instances:Create('UIStroke', {
                                Parent = NewKey.Instance,
                                LineJoinMode = Enum.LineJoinMode.Miter,
                                Name = '\0',
                            }):AddToTheme{
                                Color = 'Text Border',
                            }

                            function NewKey.Set(self, Mode, Name, Key)
                                NewKey.Instance.Text = '(' .. Mode .. ') ' .. Name .. ' - ' .. Key
                            end
                            function NewKey.SetStatus(self, Status)
                                if Status == 'Active' then
                                    NewKey:Tween(nil, {
                                        TextColor3 = Library.Theme.Accent,
                                    })
                                    NewKey:ChangeItemTheme{
                                        TextColor3 = 'Accent',
                                    }
                                else
                                    NewKey:Tween(nil, {
                                        TextColor3 = Library.Theme.Text,
                                    })
                                    NewKey:ChangeItemTheme{
                                        TextColor3 = 'Text',
                                    }
                                end
                            end

                            return NewKey
                        end
                        function KeybindList.SetVisibility(self, Bool)
                            Items.KeybindList.Instance.Visible = Bool
                        end

                        return KeybindList
                    end
                    Library.CreateColorpicker = function(self, Data)
                        local Colorpicker = {
                            Hue = 0,
                            Saturation = 0,
                            Value = 0,
                            Alpha = 0,
                            HexValue = '',
                            IsOpen = false,
                            Color = FromRGB(0, 0, 0),
                            Class = 'Colorpicker',
                        }

                        Library.Flags[Data.Flag] = {}

                        local Items = {}

                        do
                            Items.ColorpickerButton = Instances:Create('TextButton', {
                                Parent = Data.Parent.Instance,
                                FontFace = Library.Font,
                                TextColor3 = FromRGB(0, 0, 0),
                                BorderColor3 = FromRGB(0, 0, 0),
                                Text = '',
                                AutoButtonColor = false,
                                AnchorPoint = Vector2New(1, 0.5),
                                Name = '\0',
                                Position = UDim2New(1, 0, 0.5, 0),
                                Size = UDim2New(0, 20, 0, 10),
                                BorderSizePixel = 0,
                                TextSize = 14,
                                BackgroundColor3 = FromRGB(255, 0, 0),
                            })
                            Colorpicker.CalculateCount = function(self, Index, YScale, YOffset)
                                local MaxButtonsAdded = 5
                                local Column, ButtonSize, Spacing = Index % MaxButtonsAdded, Items.ColorpickerButton.Instance.AbsoluteSize, 4
                                local XPosition = (ButtonSize.X + Spacing) * Column - Spacing - 21

                                Items.ColorpickerButton.Instance.Position = UDim2New(1, -XPosition, YScale or 0.5, YOffset or 0)
                            end

                            Colorpicker:CalculateCount(Data.Count)
                            Instances:Create('UIStroke', {
                                Parent = Items.ColorpickerButton.Instance,
                                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                                LineJoinMode = Enum.LineJoinMode.Miter,
                                Name = '\0',
                                Color = FromRGB(27, 27, 32),
                            }):AddToTheme{
                                Color = 'Outline',
                            }
                            Instances:Create('UIGradient', {
                                Parent = Items.ColorpickerButton.Instance,
                                Rotation = 90,
                                Color = RGBSequence{
                                    RGBSequenceKeypoint(0, FromRGB(255, 255, 255)),
                                    RGBSequenceKeypoint(1, FromRGB(100, 100, 100)),
                                },
                            })

                            Items.ColorpickerWindow = Instances:Create('TextButton', {
                                Parent = Library.Holder.Instance,
                                AutoButtonColor = false,
                                Text = '',
                                Name = '\0',
                                Position = UDim2New(0, Data.Parent.Instance.AbsolutePosition.X, 0, Data.Parent.Instance.AbsolutePosition.Y + 15),
                                BorderColor3 = FromRGB(10, 10, 10),
                                Visible = false,
                                Size = UDim2New(0, 238, 0, 224),
                                BorderSizePixel = 2,
                                BackgroundColor3 = FromRGB(15, 15, 20),
                            })

                            Items.ColorpickerWindow:AddToTheme{
                                BackgroundColor3 = 'Background',
                            }
                            Items.ColorpickerWindow:MakeDraggable()
                            Items.ColorpickerWindow:MakeResizeable(Vector2New(200, 180), Vector2New(9999, 9999))
                            Instances:Create('UIStroke', {
                                Parent = Items.ColorpickerWindow.Instance,
                                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                                LineJoinMode = Enum.LineJoinMode.Miter,
                                Name = '\0',
                                Color = FromRGB(27, 27, 32),
                            }):AddToTheme{
                                Color = 'Outline',
                            }

                            Items.Title = Instances:Create('TextLabel', {
                                Parent = Items.ColorpickerWindow.Instance,
                                FontFace = Library.Font,
                                TextColor3 = FromRGB(215, 215, 215),
                                BorderColor3 = FromRGB(0, 0, 0),
                                Text = Data.Name,
                                Name = '\0',
                                Size = UDim2New(1, 0, 0, 15),
                                BackgroundTransparency = 1,
                                TextXAlignment = Enum.TextXAlignment.Left,
                                Position = UDim2New(0, -2, 0, -3),
                                BorderSizePixel = 0,
                                TextSize = 12,
                                BackgroundColor3 = FromRGB(255, 255, 255),
                            })

                            Items.Title:AddToTheme{
                                TextColor3 = 'Text',
                            }
                            Instances:Create('UIStroke', {
                                Parent = Items.Title.Instance,
                                LineJoinMode = Enum.LineJoinMode.Miter,
                                Name = '\0',
                            }):AddToTheme{
                                Color = 'Text Border',
                            }

                            Items.AccentLine = Instances:Create('Frame', {
                                Parent = Items.ColorpickerWindow.Instance,
                                Name = '\0',
                                Position = UDim2New(0, -6, 0, -6),
                                BorderColor3 = FromRGB(0, 0, 0),
                                Size = UDim2New(1, 12, 0, 2),
                                BorderSizePixel = 0,
                                BackgroundColor3 = FromRGB(235, 157, 255),
                            })

                            Items.AccentLine:AddToTheme{
                                BackgroundColor3 = 'Accent',
                            }
                            Instances:Create('UIGradient', {
                                Parent = Items.AccentLine.Instance,
                                Rotation = 90,
                                Color = RGBSequence{
                                    RGBSequenceKeypoint(0, FromRGB(255, 255, 255)),
                                    RGBSequenceKeypoint(1, FromRGB(65, 65, 65)),
                                },
                            })
                            Instances:Create('UIPadding', {
                                Parent = Items.ColorpickerWindow.Instance,
                                PaddingTop = UDimNew(0, 6),
                                PaddingBottom = UDimNew(0, 6),
                                PaddingRight = UDimNew(0, 6),
                                PaddingLeft = UDimNew(0, 6),
                            })

                            Items.Palette = Instances:Create('TextButton', {
                                Parent = Items.ColorpickerWindow.Instance,
                                FontFace = Library.Font,
                                TextColor3 = FromRGB(0, 0, 0),
                                BorderColor3 = FromRGB(0, 0, 0),
                                Text = '',
                                AutoButtonColor = false,
                                Name = '\0',
                                Position = UDim2New(0, 0, 0, 15),
                                Size = UDim2New(1, -26, 1, -40),
                                BorderSizePixel = 0,
                                TextSize = 14,
                                BackgroundColor3 = FromRGB(255, 0, 0),
                            })
                            Items.Saturation = Instances:Create('ImageLabel', {
                                Parent = Items.Palette.Instance,
                                BorderColor3 = FromRGB(0, 0, 0),
                                Image = Library:GetImage'Saturation',
                                BackgroundTransparency = 1,
                                Name = '\0',
                                Size = UDim2New(1, 0, 1, 0),
                                BorderSizePixel = 0,
                                BackgroundColor3 = FromRGB(255, 255, 255),
                            })
                            Items.Value = Instances:Create('ImageLabel', {
                                Parent = Items.Palette.Instance,
                                BorderColor3 = FromRGB(0, 0, 0),
                                Image = Library:GetImage'Value',
                                BackgroundTransparency = 1,
                                Name = '\0',
                                Size = UDim2New(1, 0, 1, 0),
                                BorderSizePixel = 0,
                                BackgroundColor3 = FromRGB(255, 255, 255),
                            })

                            Instances:Create('UIStroke', {
                                Parent = Items.Palette.Instance,
                                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                                LineJoinMode = Enum.LineJoinMode.Miter,
                                Name = '\0',
                                Color = FromRGB(27, 27, 32),
                            }):AddToTheme{
                                Color = 'Outline',
                            }

                            Items.PaletteDragger = Instances:Create('Frame', {
                                Parent = Items.Palette.Instance,
                                Name = '\0',
                                BorderColor3 = FromRGB(0, 0, 0),
                                Size = UDim2New(0, 2, 0, 2),
                                BorderSizePixel = 0,
                                BackgroundColor3 = FromRGB(255, 255, 255),
                            })

                            Instances:Create('UIStroke', {
                                Parent = Items.PaletteDragger.Instance,
                                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                                LineJoinMode = Enum.LineJoinMode.Miter,
                                Name = '\0',
                                Color = FromRGB(27, 27, 32),
                            }):AddToTheme{
                                Color = 'Outline',
                            }

                            Items.Hue = Instances:Create('ImageButton', {
                                Parent = Items.ColorpickerWindow.Instance,
                                BorderColor3 = FromRGB(0, 0, 0),
                                AutoButtonColor = false,
                                AnchorPoint = Vector2New(1, 0),
                                Image = Library:GetImage'Hue',
                                Name = '\0',
                                Position = UDim2New(1, 0, 0, 15),
                                Size = UDim2New(0, 18, 1, -15),
                                BorderSizePixel = 0,
                                BackgroundColor3 = FromRGB(255, 255, 255),
                            })
                            Items.HueDragger = Instances:Create('Frame', {
                                Parent = Items.Hue.Instance,
                                Name = '\0',
                                BorderColor3 = FromRGB(0, 0, 0),
                                Size = UDim2New(1, 0, 0, 1),
                                BorderSizePixel = 0,
                                BackgroundColor3 = FromRGB(255, 255, 255),
                            })

                            Instances:Create('UIStroke', {
                                Parent = Items.HueDragger.Instance,
                                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                                LineJoinMode = Enum.LineJoinMode.Miter,
                                Name = '\0',
                                Color = FromRGB(27, 27, 32),
                            }):AddToTheme{
                                Color = 'Outline',
                            }
                            Instances:Create('UIStroke', {
                                Parent = Items.Hue.Instance,
                                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                                LineJoinMode = Enum.LineJoinMode.Miter,
                                Name = '\0',
                                Color = FromRGB(27, 27, 32),
                            }):AddToTheme{
                                Color = 'Outline',
                            }

                            Items.Alpha = Instances:Create('TextButton', {
                                Parent = Items.ColorpickerWindow.Instance,
                                FontFace = Library.Font,
                                TextColor3 = FromRGB(0, 0, 0),
                                BorderColor3 = FromRGB(0, 0, 0),
                                Text = '',
                                AutoButtonColor = false,
                                AnchorPoint = Vector2New(0, 1),
                                Name = '\0',
                                Position = UDim2New(0, 0, 1, 0),
                                Size = UDim2New(1, -26, 0, 18),
                                BorderSizePixel = 0,
                                TextSize = 14,
                                BackgroundColor3 = FromRGB(255, 0, 0),
                            })

                            Instances:Create('UIStroke', {
                                Parent = Items.Alpha.Instance,
                                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                                LineJoinMode = Enum.LineJoinMode.Miter,
                                Name = '\0',
                                Color = FromRGB(27, 27, 32),
                            }):AddToTheme{
                                Color = 'Outline',
                            }

                            Items.Checkers = Instances:Create('ImageLabel', {
                                Parent = Items.Alpha.Instance,
                                ScaleType = Enum.ScaleType.Tile,
                                BorderColor3 = FromRGB(0, 0, 0),
                                Image = Library:GetImage'Checkers',
                                TileSize = UDim2New(0, 6, 0, 6),
                                Name = '\0',
                                Size = UDim2New(1, 0, 1, 0),
                                BorderSizePixel = 0,
                                BackgroundColor3 = FromRGB(255, 255, 255),
                            })

                            Instances:Create('UIGradient', {
                                Parent = Items.Checkers.Instance,
                                Transparency = NumSequence{
                                    NumSequenceKeypoint(0, 1),
                                    NumSequenceKeypoint(1, 0),
                                },
                            })
                            Instances:Create('UIGradient', {
                                Parent = Items.Alpha.Instance,
                                Color = RGBSequence{
                                    RGBSequenceKeypoint(0, FromRGB(255, 255, 255)),
                                    RGBSequenceKeypoint(1, FromRGB(0, 0, 0)),
                                },
                            })

                            Items.AlphaDragger = Instances:Create('Frame', {
                                Parent = Items.Alpha.Instance,
                                Name = '\0',
                                BorderColor3 = FromRGB(0, 0, 0),
                                Size = UDim2New(0, 1, 1, 0),
                                BorderSizePixel = 0,
                                BackgroundColor3 = FromRGB(255, 255, 255),
                            })

                            Instances:Create('UIStroke', {
                                Parent = Items.AlphaDragger.Instance,
                                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                                LineJoinMode = Enum.LineJoinMode.Miter,
                                Name = '\0',
                                Color = FromRGB(27, 27, 32),
                            }):AddToTheme{
                                Color = 'Outline',
                            }
                        end

                        local SlidingPalette, SlidingHue, SlidingAlpha, Debounce = false, false, false, false

                        function Colorpicker.SetOpen(self, Bool)
                            if Debounce then
                                return
                            end

                            Colorpicker.IsOpen = Bool
                            Debounce = true

                            if Bool then
                                Items.ColorpickerWindow.Instance.Visible = true
                                Items.ColorpickerWindow.Instance.Position = UDim2New(0, Data.Parent.Instance.AbsolutePosition.X, 0, Data.Parent.Instance.AbsolutePosition.Y + 15)

                                if Library.CurrentColorpicker then
                                    Library.CurrentColorpicker:SetOpen(false)

                                    Library.CurrentColorpicker = nil
                                end
                                if not Library.CurrentColorpicker then
                                    Library.CurrentColorpicker = Colorpicker
                                end
                            else
                                Library.CurrentColorpicker = nil
                            end

                            local Descendants = Items.ColorpickerWindow.Instance:GetDescendants()

                            TableInsert(Descendants, Items.ColorpickerWindow.Instance)

                            local NewTween

                            for Index, Value in Descendants do
                                local __DARKLUA_CONTINUE_17 = false

                                repeat
                                    local ValueIndex = Library:GetTransparencyPropertyFromItem(Value)

                                    if not ValueIndex then
                                        __DARKLUA_CONTINUE_17 = true

                                        break
                                    end
                                    if not StringFind(Value.ClassName, 'UI') then
                                        Value.ZIndex = Bool and 10001 or 1
                                    end
                                    if type(ValueIndex) == 'table' then
                                        for _, Property in ValueIndex do
                                            NewTween = Library:FadeItem(Value, Property, Bool, Data.FadeSpeed)
                                        end
                                    else
                                        NewTween = Library:FadeItem(Value, ValueIndex, Bool, Data.FadeSpeed)
                                    end

                                    __DARKLUA_CONTINUE_17 = true
                                until true

                                if not __DARKLUA_CONTINUE_17 then
                                    break
                                end
                            end

                            Library:Connect(NewTween.Tween.Completed, function()
                                Debounce = false
                                Items.ColorpickerWindow.Instance.Visible = Bool
                            end)
                        end
                        function Colorpicker.Get(self)
                            return Colorpicker.Value
                        end
                        function Colorpicker.SetVisibility(self, Bool)
                            Data.Parent.Instance.Visible = Bool
                        end
                        function Colorpicker.Set(self, Color, Alpha)
                            if type(Color) == 'table' then
                                Color = FromRGB(Color[1], Color[2], Color[3])
                                Alpha = Color[4]
                            elseif type(Color) == 'string' then
                                Color = FromHex(Color)
                            end

                            self.Hue, self.Saturation, self.Value = Color:ToHSV()
                            self.Alpha = Alpha or 0
                            self.Color = FromHSV(self.Hue, self.Saturation, self.Value)
                            self.HexValue = self.Color:ToHex()
                            Library.Flags[Data.Flag] = {
                                Color = self.Color,
                                HexValue = self.HexValue,
                                Alpha = self.Alpha,
                            }

                            local ColorPositionX, ColorPositionY = MathClamp(1 - self.Saturation, 0, 0.989), MathClamp(1 - self.Value, 0, 0.989)

                            Items.PaletteDragger:Tween(TweenInfo.new(0.17, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                                Position = UDim2New(ColorPositionX, 0, ColorPositionY, 0),
                            })

                            local HuePositionY = MathClamp(self.Hue, 0, 0.994)

                            Items.HueDragger:Tween(TweenInfo.new(0.17, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                                Position = UDim2New(0, 0, HuePositionY, 0),
                            })

                            local AlphaPositionX = MathClamp(self.Alpha, 0, 0.994)

                            Items.AlphaDragger:Tween(TweenInfo.new(0.17, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                                Position = UDim2New(AlphaPositionX, 0, 0, 0),
                            })
                            self:Update()
                        end
                        function Colorpicker.Update(self, IsFromAlpha)
                            self.Color = FromHSV(self.Hue, self.Saturation, self.Value)
                            self.HexValue = self.Color:ToHex()
                            Library.Flags[Data.Flag] = {
                                Color = self.Color,
                                HexValue = self.HexValue,
                                Alpha = self.Alpha,
                            }

                            Items.ColorpickerButton:Tween(TweenInfo.new(0.17, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                                BackgroundColor3 = self.Color,
                            })
                            Items.Palette:Tween(TweenInfo.new(0.17, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                                BackgroundColor3 = FromHSV(self.Hue, 1, 1),
                            })

                            if not IsFromAlpha then
                                Items.Alpha:Tween(TweenInfo.new(0.17, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                                    BackgroundColor3 = self.Color,
                                })
                            end
                            if Data.Callback then
                                Library:SafeCall(Data.Callback, self.Color, self.Alpha)
                            end
                        end
                        function Colorpicker.SlidePalette(self, Input)
                            if not Input or not SlidingPalette then
                                return
                            end

                            local ValueX, ValueY = MathClamp(1 - (Input.Position.X - Items.Palette.Instance.AbsolutePosition.X) / Items.Palette.Instance.AbsoluteSize.X, 0, 1), MathClamp(1 - (Input.Position.Y - Items.Palette.Instance.AbsolutePosition.Y) / Items.Palette.Instance.AbsoluteSize.Y, 0, 1)

                            self.Saturation = ValueX
                            self.Value = ValueY

                            local SlideX, SlideY = MathClamp((Input.Position.X - Items.Palette.Instance.AbsolutePosition.X) / Items.Palette.Instance.AbsoluteSize.X, 0, 0.989), MathClamp((Input.Position.Y - Items.Palette.Instance.AbsolutePosition.Y) / Items.Palette.Instance.AbsoluteSize.Y, 0, 0.989)

                            Items.PaletteDragger:Tween(TweenInfo.new(0.17, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                                Position = UDim2New(SlideX, 0, SlideY, 0),
                            })
                            self:Update()
                        end
                        function Colorpicker.SlideHue(self, Input)
                            if not Input or not SlidingHue then
                                return
                            end

                            local ValueY = MathClamp((Input.Position.Y - Items.Hue.Instance.AbsolutePosition.Y) / Items.Hue.Instance.AbsoluteSize.Y, 0, 1)

                            self.Hue = ValueY

                            local PositionY = MathClamp((Input.Position.Y - Items.Hue.Instance.AbsolutePosition.Y) / Items.Hue.Instance.AbsoluteSize.Y, 0, 0.994)

                            Items.HueDragger:Tween(TweenInfo.new(0.17, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                                Position = UDim2New(0, 0, PositionY, 0),
                            })
                            self:Update()
                        end
                        function Colorpicker.SlideAlpha(self, Input)
                            if not Input or not SlidingAlpha then
                                return
                            end

                            local ValueX = MathClamp((Input.Position.X - Items.Alpha.Instance.AbsolutePosition.X) / Items.Alpha.Instance.AbsoluteSize.X, 0, 1)

                            self.Alpha = ValueX

                            local PositionX = MathClamp((Input.Position.X - Items.Alpha.Instance.AbsolutePosition.X) / Items.Alpha.Instance.AbsoluteSize.X, 0, 0.994)

                            Items.AlphaDragger:Tween(TweenInfo.new(0.17, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                                Position = UDim2New(PositionX, 0, 0, 0),
                            })
                            self:Update(true)
                        end

                        Items.ColorpickerButton:Connect('MouseButton1Down', function()
                            Colorpicker:SetOpen(not Colorpicker.IsOpen)
                        end)
                        Items.Palette:Connect('InputBegan', function(Input)
                            if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                                SlidingPalette = true

                                Colorpicker:SlidePalette(Input)
                            end
                        end)
                        Items.Palette:Connect('InputEnded', function(Input)
                            if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                                SlidingPalette = false
                            end
                        end)
                        Items.Hue:Connect('InputBegan', function(Input)
                            if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                                SlidingHue = true

                                Colorpicker:SlideHue(Input)
                            end
                        end)
                        Items.Hue:Connect('InputEnded', function(Input)
                            if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                                SlidingHue = false
                            end
                        end)
                        Items.Alpha:Connect('InputBegan', function(Input)
                            if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                                SlidingAlpha = true

                                Colorpicker:SlideAlpha(Input)
                            end
                        end)
                        Items.Alpha:Connect('InputEnded', function(Input)
                            if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                                SlidingAlpha = false
                            end
                        end)
                        Library:Connect(UserInputService.InputChanged, function(Input)
                            if Input.UserInputType == Enum.UserInputType.MouseMovement then
                                if SlidingPalette then
                                    Colorpicker:SlidePalette(Input)
                                end
                                if SlidingHue then
                                    Colorpicker:SlideHue(Input)
                                end
                                if SlidingAlpha then
                                    Colorpicker:SlideAlpha(Input)
                                end
                            end
                        end)
                        Library:Connect(UserInputService.InputBegan, function(Input)
                            if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                                if Library:IsMouseOverFrame(Items.ColorpickerWindow) then
                                    return
                                end

                                Colorpicker:SetOpen(false)
                            end
                        end)

                        if Data.Default then
                            Colorpicker:Set(Data.Default, Data.Alpha)
                        end

                        Library.SetFlags[Data.Flag] = function(Color, Alpha)
                            Colorpicker:Set(Color, Alpha)
                        end

                        return Colorpicker
                    end
                    Library.CreateKeybind = function(self, Data)
                        local Keybind = {
                            Key = nil,
                            Value = '',
                            Mode = '',
                            Toggled = false,
                            IsOpen = false,
                            Picking = false,
                            Class = 'Keybind',
                        }

                        Library.Flags[Data.Flag] = {}

                        local Items, KeyListItem = {}

                        do
                            Items.KeyButton = Instances:Create('TextButton', {
                                Parent = Data.Parent.Instance,
                                FontFace = Library.Font,
                                TextColor3 = FromRGB(0, 0, 0),
                                BorderColor3 = FromRGB(27, 27, 32),
                                Text = '',
                                AutoButtonColor = false,
                                AnchorPoint = Vector2New(1, 0),
                                Size = UDim2New(0, 0, 1, 1),
                                Name = '\0',
                                Position = UDim2New(1, 0, 0, 0),
                                BorderSizePixel = 2,
                                AutomaticSize = Enum.AutomaticSize.X,
                                TextSize = 14,
                                BackgroundColor3 = FromRGB(15, 15, 20),
                            })

                            Items.KeyButton:AddToTheme{
                                BackgroundColor3 = 'Background',
                                BorderColor3 = 'Outline',
                            }

                            if Library.KeyList then
                                KeyListItem = Library.KeyList:Add(Keybind.Mode, Data.Name, Keybind.Value)
                            end

                            Instances:Create('UIStroke', {
                                Parent = Items.KeyButton.Instance,
                                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                                LineJoinMode = Enum.LineJoinMode.Miter,
                                Name = '\0',
                                Color = FromRGB(10, 10, 10),
                            }):AddToTheme{
                                Color = 'Border',
                            }

                            Items.Text = Instances:Create('TextLabel', {
                                Parent = Items.KeyButton.Instance,
                                FontFace = Library.Font,
                                TextColor3 = FromRGB(215, 215, 215),
                                BorderColor3 = FromRGB(0, 0, 0),
                                Text = 'None',
                                Name = '\0',
                                BackgroundTransparency = 1,
                                Position = UDim2New(0, 1, 0, 0),
                                Size = UDim2New(1, 0, 1, 0),
                                BorderSizePixel = 0,
                                TextSize = 12,
                                BackgroundColor3 = FromRGB(255, 255, 255),
                            })

                            Items.Text:AddToTheme{
                                TextColor3 = 'Text',
                            }
                            Instances:Create('UIStroke', {
                                Parent = Items.Text.Instance,
                                LineJoinMode = Enum.LineJoinMode.Miter,
                                Name = '\0',
                            }):AddToTheme{
                                Color = 'Text Border',
                            }
                            Instances:Create('UIPadding', {
                                Parent = Items.KeyButton.Instance,
                                PaddingRight = UDimNew(0, 3),
                                PaddingLeft = UDimNew(0, 3),
                                PaddingBottom = UDimNew(0, 2),
                            })

                            Items.Window = Instances:Create('Frame', {
                                Parent = Data.Parent.Instance,
                                BorderColor3 = FromRGB(10, 10, 10),
                                AnchorPoint = Vector2New(1, 0),
                                Name = '\0',
                                Position = UDim2New(1, 0, 1, 5),
                                Size = UDim2New(0, 50, 0, 48),
                                BorderSizePixel = 2,
                                Visible = false,
                                BackgroundColor3 = FromRGB(15, 15, 20),
                            })

                            Items.Window:AddToTheme{
                                BackgroundColor3 = 'Background',
                                BorderColor3 = 'Border',
                            }
                            Instances:Create('UIStroke', {
                                Parent = Items.Window.Instance,
                                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                                LineJoinMode = Enum.LineJoinMode.Miter,
                                Name = '\0',
                                Color = FromRGB(27, 27, 32),
                            }):AddToTheme{
                                Color = 'Outline',
                            }

                            Items.Toggle = Instances:Create('TextButton', {
                                Parent = Items.Window.Instance,
                                FontFace = Library.Font,
                                TextColor3 = FromRGB(235, 157, 255),
                                BorderColor3 = FromRGB(0, 0, 0),
                                Text = 'Toggle',
                                AutoButtonColor = false,
                                Name = '\0',
                                BorderSizePixel = 0,
                                BackgroundTransparency = 1,
                                Position = UDim2New(0, 1, 0, 0),
                                Size = UDim2New(1, 0, 0, 15),
                                TextSize = 12,
                                BackgroundColor3 = FromRGB(255, 255, 255),
                            })

                            Items.Toggle:AddToTheme{
                                TextColor3 = 'Text',
                            }
                            Instances:Create('UIStroke', {
                                Parent = Items.Toggle.Instance,
                                LineJoinMode = Enum.LineJoinMode.Miter,
                                Name = '\0',
                            }):AddToTheme{
                                Color = 'Text Border',
                            }

                            Items.Hold = Instances:Create('TextButton', {
                                Parent = Items.Window.Instance,
                                FontFace = Library.Font,
                                TextColor3 = FromRGB(215, 215, 215),
                                BorderColor3 = FromRGB(0, 0, 0),
                                Text = 'Hold',
                                AutoButtonColor = false,
                                Name = '\0',
                                BorderSizePixel = 0,
                                BackgroundTransparency = 1,
                                Position = UDim2New(0, 1, 0, 15),
                                Size = UDim2New(1, 0, 0, 15),
                                TextSize = 12,
                                BackgroundColor3 = FromRGB(255, 255, 255),
                            })

                            Items.Hold:AddToTheme{
                                TextColor3 = 'Text',
                            }
                            Instances:Create('UIStroke', {
                                Parent = Items.Hold.Instance,
                                LineJoinMode = Enum.LineJoinMode.Miter,
                                Name = '\0',
                            }):AddToTheme{
                                Color = 'Text Border',
                            }

                            Items.Always = Instances:Create('TextButton', {
                                Parent = Items.Window.Instance,
                                FontFace = Library.Font,
                                TextColor3 = FromRGB(215, 215, 215),
                                BorderColor3 = FromRGB(0, 0, 0),
                                Text = 'Always',
                                AutoButtonColor = false,
                                Name = '\0',
                                BorderSizePixel = 0,
                                BackgroundTransparency = 1,
                                Position = UDim2New(0, 1, 0, 30),
                                Size = UDim2New(1, 0, 0, 15),
                                TextSize = 12,
                                BackgroundColor3 = FromRGB(255, 255, 255),
                            })

                            Items.Always:AddToTheme{
                                TextColor3 = 'Text',
                            }
                            Instances:Create('UIStroke', {
                                Parent = Items.Always.Instance,
                                LineJoinMode = Enum.LineJoinMode.Miter,
                                Name = '\0',
                            }):AddToTheme{
                                Color = 'Text Border',
                            }
                        end

                        local Modes, Update = {
                            Toggle = Items.Toggle,
                            Hold = Items.Hold,
                            Always = Items.Always,
                        }, function()
                            if KeyListItem then
                                KeyListItem:Set(Keybind.Mode, Data.Name, Keybind.Value)
                                KeyListItem:SetStatus(Keybind.Toggled and 'Active' or 'Inactive')
                            end
                        end

                        function Keybind.Get(self)
                            return Keybind.Toggled, Keybind.Key, Keybind.Mode
                        end
                        function Keybind.SetVisibility(self, Bool)
                            Data.Parent.Instance.Visible = Bool
                        end

                        local Debounce = false

                        function Keybind.SetOpen(self, Bool)
                            Keybind.IsOpen = Bool

                            if Bool then
                                Debounce = true
                                Items.Window.Instance.Visible = true
                                Items.Window.Instance.ZIndex = 16

                                Items.Window:Tween(nil, {BackgroundTransparency = 0})
                                task.wait(0.1)

                                for Index, Value in Items.Window.Instance:GetDescendants()do
                                    if Value:IsA'UIStroke' then
                                        Tween:Create(Value, nil, {Transparency = 0}, true)
                                    elseif Value:IsA'TextButton' then
                                        Tween:Create(Value, nil, {TextTransparency = 0}, true)

                                        Value.ZIndex = 16
                                    end
                                end
                            else
                                for Index, Value in Items.Window.Instance:GetDescendants()do
                                    if Value:IsA'UIStroke' then
                                        Tween:Create(Value, nil, {Transparency = 1}, true)
                                    elseif Value:IsA'TextButton' then
                                        Tween:Create(Value, nil, {TextTransparency = 1}, true)

                                        Value.ZIndex = 1
                                    end
                                end

                                task.wait(0.1)
                                Items.Window:Tween(nil, {BackgroundTransparency = 1})

                                Items.Window.Instance.ZIndex = 1

                                task.wait(0.1)

                                Items.Window.Instance.Visible = false
                            end

                            Debounce = false
                        end
                        function Keybind.Set(self, Key)
                            if StringFind(tostring(Key), 'Enum') then
                                Keybind.Key = tostring(Key)
                                Key = Key.Name == 'Backspace' and 'None' or Key.Name

                                local KeyString = Keys[Keybind.Key] or StringGSub(Key, 'Enum.', '') or 'None'
                                local TextToDisplay = StringGSub(StringGSub(KeyString, 'KeyCode.', ''), 'UserInputType.', '') or 'None'

                                Keybind.Value = TextToDisplay
                                Items.Text.Instance.Text = TextToDisplay

                                if Data.Callback then
                                    Library:SafeCall(Data.Callback, Keybind.Toggled)
                                end
                            elseif TableFind({
                                'Toggle',
                                'Hold',
                                'Always',
                            }, Key) then
                                Keybind.Mode = Key

                                Keybind:SetMode(Key)

                                if Data.Callback then
                                    Library:SafeCall(Data.Callback, Keybind.Toggled)
                                end
                            elseif type(Key) == 'table' then
                                local RealKey = Key.Key == 'Backspace' and 'None' or Key.Key

                                Keybind.Key = tostring(Key.Key)

                                if Key.Mode then
                                    Keybind.Mode = Key.Mode

                                    Keybind:SetMode(Key.Mode)
                                else
                                    Keybind.Mode = 'Toggle'

                                    Keybind:SetMode'Toggle'
                                end

                                local KeyString = Keys[Keybind.Key] or StringGSub(tostring(RealKey), 'Enum.', '') or RealKey
                                local TextToDisplay = KeyString and StringGSub(StringGSub(KeyString, 'KeyCode.', ''), 'UserInputType.', '') or 'None'

                                TextToDisplay = StringGSub(StringGSub(KeyString, 'KeyCode.', ''), 'UserInputType.', '')
                                Keybind.Value = TextToDisplay
                                Items.Text.Instance.Text = TextToDisplay

                                if Keybind.Callback then
                                    Library:SafeCall(Keybind.Callback, Keybind.Toggled)
                                end
                            end

                            Keybind.Picking = false

                            Items.Text:Tween(nil, {
                                TextColor3 = Library.Theme.Text,
                            })
                            Items.Text:ChangeItemTheme{
                                TextColor3 = 'Text',
                            }

                            Items.Text.Instance.Size = UDim2New(0, Items.Text.Instance.TextBounds.X, 1, 1)

                            Update()
                        end
                        function Keybind.SetMode(self, Mode)
                            for Index, Value in Modes do
                                if Index == Mode then
                                    Value:Tween(nil, {
                                        TextColor3 = Library.Theme.Accent,
                                    })
                                    Value:ChangeItemTheme{
                                        TextColor3 = 'Accent',
                                    }
                                else
                                    Value:Tween(nil, {
                                        TextColor3 = Library.Theme.Text,
                                    })
                                    Value:ChangeItemTheme{
                                        TextColor3 = 'Text',
                                    }
                                end
                            end

                            if Keybind.Mode == 'Always' then
                                Keybind.Toggled = true
                            else
                                Keybind.Toggled = false
                            end

                            Library.Flags[Data.Flag] = {
                                Mode = Keybind.Mode,
                                Key = Keybind.Key,
                                Toggled = Keybind.Toggled,
                            }

                            if Data.Callback then
                                Library:SafeCall(Data.Callback, Keybind.Toggled)
                            end

                            Update()
                        end
                        function Keybind.Press(self, Bool)
                            if Keybind.Mode == 'Toggle' then
                                Keybind.Toggled = not Keybind.Toggled
                            elseif Keybind.Mode == 'Hold' then
                                Keybind.Toggled = Bool
                            elseif Keybind.Mode == 'Always' then
                                Keybind.Toggled = true
                            end

                            Library.Flags[Data.Flag] = {
                                Mode = Keybind.Mode,
                                Key = Keybind.Key,
                                Toggled = Keybind.Toggled,
                            }

                            if Data.Callback then
                                Library:SafeCall(Data.Callback, Keybind.Toggled)
                            end

                            Update()
                        end

                        Items.KeyButton:Connect('MouseButton1Click', function()
                            if Keybind.Picking then
                                return
                            end

                            Keybind.Picking = true

                            Items.Text:Tween(nil, {
                                TextColor3 = Library.Theme.Accent,
                            })
                            Items.Text:ChangeItemTheme{
                                TextColor3 = 'Accent',
                            }

                            local InputBegan

                            InputBegan = UserInputService.InputBegan:Connect(function(Input)
                                if Input.UserInputType == Enum.UserInputType.Keyboard then
                                    Keybind:Set(Input.KeyCode)
                                else
                                    Keybind:Set(Input.UserInputType)
                                end

                                InputBegan:Disconnect()

                                InputBegan = nil
                            end)
                        end)
                        Items.KeyButton:Connect('MouseButton2Down', function()
                            Keybind:SetOpen(not Keybind.IsOpen)
                        end)
                        Library:Connect(UserInputService.InputBegan, function(Input)
                            if tostring(Input.KeyCode) == Keybind.Key or tostring(Input.UserInputType) == Keybind.Key then
                                if Keybind.Mode == 'Toggle' then
                                    Keybind:Press()
                                elseif Keybind.Mode == 'Hold' then
                                    Keybind:Press(true)
                                end
                            end
                            if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                                if Library:IsMouseOverFrame(Items.Window) then
                                    return
                                end
                                if Debounce then
                                    return
                                end

                                Keybind:SetOpen(false)
                            end
                        end)
                        Library:Connect(UserInputService.InputEnded, function(Input)
                            if tostring(Input.KeyCode) == Keybind.Key or tostring(Input.UserInputType) == Keybind.Key then
                                if Keybind.Mode == 'Hold' then
                                    Keybind:Press(false)
                                end
                            end
                        end)
                        Items.Toggle:Connect('MouseButton1Down', function()
                            Keybind.Mode = 'Toggle'

                            Keybind:SetMode'Toggle'
                        end)
                        Items.Always:Connect('MouseButton1Down', function()
                            Keybind.Mode = 'Always'

                            Keybind:SetMode'Always'
                        end)
                        Items.Hold:Connect('MouseButton1Down', function()
                            Keybind.Mode = 'Hold'

                            Keybind:SetMode'Hold'
                        end)

                        if Data.Default then
                            Keybind:Set{
                                Key = Data.Default,
                                Mode = Data.Mode or 'Toggle',
                            }
                        end

                        Library.SetFlags[Data.Flag] = function(Value)
                            Keybind:Set(Value)
                        end

                        return Keybind
                    end
                    Library.Window = function(self, Data)
                        Data = Data or {}

                        local Window, Items = {
                            Name = Data.Name or Data.name or 'Window',
                            Size = Data.Size or Data.size or UDim2New(0, 500, 0, 600),
                            FadeSpeed = Data.FadeSpeed or Data.fadespeed or 0.25,
                            Pages = {},
                            SubPages = {},
                            Elements = {},
                            IsOpen = true,
                        }, {}

                        do
                            Items.MainFrame = Instances:Create('Frame', {
                                Parent = Library.Holder.Instance,
                                AnchorPoint = Vector2New(0, 0),
                                Name = '\0',
                                Position = UDim2New(0, 0, 0, 0),
                                BorderColor3 = FromRGB(10, 10, 10),
                                Size = Window.Size,
                                BorderSizePixel = 2,
                                BackgroundColor3 = FromRGB(15, 15, 20),
                            })

                            Items.MainFrame:AddToTheme{
                                BackgroundColor3 = 'Background',
                                BorderColor3 = 'Border',
                            }

                            Items.MainFrame.Instance.Position = UDim2New(0, Camera.ViewportSize.X / 4, 0, Camera.ViewportSize.Y / 4)

                            Items.MainFrame:MakeDraggable()
                            Items.MainFrame:MakeResizeable(Vector2New(Window.Size.X.Offset, Window.Size.Y.Offset), Vector2New(9999, 9999))

                            Items.AccentBorder = Instances:Create('UIStroke', {
                                Parent = Items.MainFrame.Instance,
                                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                                LineJoinMode = Enum.LineJoinMode.Miter,
                                Name = '\0',
                                Color = FromRGB(235, 157, 255),
                            })

                            Items.AccentBorder:AddToTheme{
                                Color = 'Accent',
                            }

                            Items.Title = Instances:Create('TextLabel', {
                                Parent = Items.MainFrame.Instance,
                                FontFace = Library.Font,
                                TextColor3 = FromRGB(215, 215, 215),
                                BorderColor3 = FromRGB(0, 0, 0),
                                Text = Window.Name,
                                Name = '\0',
                                Size = UDim2New(1, 0, 0, 15),
                                BackgroundTransparency = 1,
                                TextXAlignment = Enum.TextXAlignment.Left,
                                Position = UDim2New(0, 6, 0, 1),
                                BorderSizePixel = 0,
                                TextSize = 12,
                                BackgroundColor3 = FromRGB(255, 255, 255),
                            })

                            Items.Title:AddToTheme{
                                TextColor3 = 'Text',
                            }
                            Instances:Create('UIStroke', {
                                Parent = Items.Title.Instance,
                                LineJoinMode = Enum.LineJoinMode.Miter,
                                Name = '\0',
                            }):AddToTheme{
                                Color = 'Text Border',
                            }

                            Items.Inline = Instances:Create('Frame', {
                                Parent = Items.MainFrame.Instance,
                                Name = '\0',
                                Position = UDim2New(0, 7, 0, 20),
                                BorderColor3 = FromRGB(27, 27, 32),
                                Size = UDim2New(1, -14, 1, -27),
                                BorderSizePixel = 2,
                                BackgroundColor3 = FromRGB(20, 20, 25),
                            })

                            Items.Inline:AddToTheme{
                                BackgroundColor3 = 'Background',
                                BorderColor3 = 'Outline',
                            }
                            Instances:Create('UIStroke', {
                                Parent = Items.Inline.Instance,
                                LineJoinMode = Enum.LineJoinMode.Miter,
                                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                                Color = Library.Theme.Border,
                                Name = '\0',
                            }):AddToTheme{
                                Color = 'Border',
                            }

                            Items.Pages = Instances:Create('Frame', {
                                Parent = Items.Inline.Instance,
                                Name = '\0',
                                BackgroundTransparency = 1,
                                Position = UDim2New(0, 7, 0, 7),
                                BorderColor3 = FromRGB(0, 0, 0),
                                Size = UDim2New(1, -14, 0, 19),
                                BorderSizePixel = 0,
                                BackgroundColor3 = FromRGB(255, 255, 255),
                            })

                            Instances:Create('UIListLayout', {
                                Parent = Items.Pages.Instance,
                                FillDirection = Enum.FillDirection.Horizontal,
                                HorizontalFlex = Enum.UIFlexAlignment.Fill,
                                Padding = UDimNew(0, 6),
                                SortOrder = Enum.SortOrder.LayoutOrder,
                            })

                            Items.Content = Instances:Create('Frame', {
                                Parent = Items.Inline.Instance,
                                Name = '\0',
                                Position = UDim2New(0, 7, 0, 26),
                                BorderColor3 = FromRGB(10, 10, 10),
                                Size = UDim2New(1, -14, 1, -33),
                                BorderSizePixel = 2,
                                BackgroundColor3 = FromRGB(15, 15, 20),
                            })

                            Items.Content:AddToTheme{
                                BackgroundColor3 = 'Background',
                                BorderColor3 = 'Border',
                            }
                            Instances:Create('UIStroke', {
                                Parent = Items.Content.Instance,
                                LineJoinMode = Enum.LineJoinMode.Miter,
                                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                                Color = Library.Theme.Outline,
                                Name = '\0',
                            }):AddToTheme{
                                Color = 'Outline',
                            }
                        end

                        local Debounce = false

                        function Window.SetOpen(self, Bool)
                            if Debounce then
                                return
                            end

                            Window.IsOpen = Bool
                            Debounce = true

                            if Bool then
                                Items.MainFrame.Instance.Visible = true
                            end

                            local Descendants = Items.MainFrame.Instance:GetDescendants()

                            TableInsert(Descendants, Items.MainFrame.Instance)

                            local NewTween

                            for Index, Value in Descendants do
                                local __DARKLUA_CONTINUE_22 = false

                                repeat
                                    local ValueIndex = Library:GetTransparencyPropertyFromItem(Value)

                                    if not ValueIndex then
                                        __DARKLUA_CONTINUE_22 = true

                                        break
                                    end
                                    if type(ValueIndex) == 'table' then
                                        for _, Property in ValueIndex do
                                            NewTween = Library:FadeItem(Value, Property, Bool, Window.FadeSpeed)
                                        end
                                    else
                                        NewTween = Library:FadeItem(Value, ValueIndex, Bool, Window.FadeSpeed)
                                    end

                                    __DARKLUA_CONTINUE_22 = true
                                until true

                                if not __DARKLUA_CONTINUE_22 then
                                    break
                                end
                            end

                            Library:Connect(NewTween.Tween.Completed, function()
                                Debounce = false
                                Items.MainFrame.Instance.Visible = Bool
                            end)
                        end

                        Library:Connect(UserInputService.InputBegan, function(Input)
                            if tostring(Input.KeyCode) == Library.MenuKeybind or tostring(Input.UserInputType) == Library.MenuKeybind then
                                Window:SetOpen(not Window.IsOpen)
                            end
                        end)

                        Window.Elements = Items

                        return setmetatable(Window, Library)
                    end
                    Library.Page = function(self, Data)
                        Data = Data or {}

                        local Page, Items = {
                            Window = self,
                            Name = Data.Name or Data.name or 'Page',
                            Columns = Data.Columns or Data.columns or 2,
                            HasSubtabs = Data.Subtabs or Data.subtabs or false,
                            Active = false,
                            ColumnsData = {},
                            Elements = {},
                        }, {}

                        do
                            Items.Inactive = Instances:Create('TextButton', {
                                Parent = Page.Window.Elements.Pages.Instance,
                                FontFace = Library.Font,
                                TextColor3 = FromRGB(0, 0, 0),
                                BorderColor3 = FromRGB(10, 10, 10),
                                Text = '',
                                AutoButtonColor = false,
                                Name = '\0',
                                Size = UDim2New(1, 0, 1, 0),
                                BorderSizePixel = 2,
                                TextSize = 14,
                                BackgroundColor3 = FromRGB(30, 30, 35),
                            })

                            Items.Inactive:AddToTheme{
                                BackgroundColor3 = 'Page Background',
                                BorderColor3 = 'Border',
                            }
                            Instances:Create('UIStroke', {
                                Parent = Items.Inactive.Instance,
                                LineJoinMode = Enum.LineJoinMode.Miter,
                                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                                Color = Library.Theme.Outline,
                                Name = '\0',
                            }):AddToTheme{
                                Color = 'Outline',
                            }

                            Items.Text = Instances:Create('TextLabel', {
                                Parent = Items.Inactive.Instance,
                                FontFace = Library.Font,
                                TextColor3 = FromRGB(215, 215, 215),
                                TextTransparency = 0.47999998927116394,
                                Text = Page.Name,
                                Name = '\0',
                                Size = UDim2New(1, 0, 1, 0),
                                BackgroundTransparency = 1,
                                Position = UDim2New(0, 0, 0, -1),
                                BorderSizePixel = 0,
                                BorderColor3 = FromRGB(0, 0, 0),
                                TextSize = 12,
                                BackgroundColor3 = FromRGB(255, 255, 255),
                            })

                            Items.Text:AddToTheme{
                                TextColor3 = 'Text',
                            }
                            Instances:Create('UIStroke', {
                                Parent = Items.Text.Instance,
                                LineJoinMode = Enum.LineJoinMode.Miter,
                                Name = '\0',
                            }):AddToTheme{
                                Color = 'Text Border',
                            }

                            Items.Hide = Instances:Create('Frame', {
                                Parent = Items.Inactive.Instance,
                                Visible = false,
                                BorderColor3 = FromRGB(0, 0, 0),
                                AnchorPoint = Vector2New(0, 1),
                                Name = '\0',
                                Position = UDim2New(0, 0, 1, 0),
                                Size = UDim2New(1, 0, 0, 3),
                                ZIndex = 2,
                                BorderSizePixel = 0,
                                BackgroundColor3 = FromRGB(15, 15, 20),
                            })

                            Items.Hide:AddToTheme{
                                BackgroundColor3 = 'Background',
                            }

                            Items.MiscPixel1 = Instances:Create('Frame', {
                                Parent = Items.Hide.Instance,
                                Size = UDim2New(0, 1, 0, 1),
                                Name = '\0',
                                Position = UDim2New(0, -1, 0, 1),
                                BorderColor3 = FromRGB(0, 0, 0),
                                ZIndex = 2,
                                BorderSizePixel = 0,
                                BackgroundColor3 = FromRGB(27, 27, 32),
                            })

                            Items.MiscPixel1:AddToTheme{
                                BackgroundColor3 = 'Outline',
                            }

                            Items.MiscPixel2 = Instances:Create('Frame', {
                                Parent = Items.Hide.Instance,
                                BorderColor3 = FromRGB(0, 0, 0),
                                AnchorPoint = Vector2New(1, 0),
                                Name = '\0',
                                Position = UDim2New(1, 1, 0, 1),
                                Size = UDim2New(0, 1, 0, 1),
                                ZIndex = 2,
                                BorderSizePixel = 0,
                                BackgroundColor3 = FromRGB(27, 27, 32),
                            })

                            Items.MiscPixel2:AddToTheme{
                                BackgroundColor3 = 'Outline',
                            }

                            Items.UIGradient = Instances:Create('UIGradient', {
                                Parent = Items.Inactive.Instance,
                                Rotation = 90,
                                Color = RGBSequence{
                                    RGBSequenceKeypoint(0, FromRGB(255, 255, 255)),
                                    RGBSequenceKeypoint(1, FromRGB(108, 108, 108)),
                                },
                            })
                            Items.Page = Instances:Create('Frame', {
                                Parent = Page.Window.Elements.Content.Instance,
                                BackgroundTransparency = 1,
                                Name = '\0',
                                BorderColor3 = FromRGB(0, 0, 0),
                                Size = UDim2New(1, 0, 1, 0),
                                BorderSizePixel = 0,
                                BackgroundColor3 = FromRGB(255, 255, 255),
                                Visible = false,
                            })

                            if not Page.HasSubtabs then
                                Instances:Create('UIListLayout', {
                                    Parent = Items.Page.Instance,
                                    FillDirection = Enum.FillDirection.Horizontal,
                                    HorizontalFlex = Enum.UIFlexAlignment.Fill,
                                    SortOrder = Enum.SortOrder.LayoutOrder,
                                    VerticalFlex = Enum.UIFlexAlignment.Fill,
                                })

                                for Index = 1, Page.Columns do
                                    local NewColumn = Instances:Create('ScrollingFrame', {
                                        Parent = Items.Page.Instance,
                                        ScrollBarImageColor3 = FromRGB(235, 157, 255),
                                        Active = true,
                                        AutomaticCanvasSize = Enum.AutomaticSize.Y,
                                        ScrollBarThickness = 1,
                                        Name = '\0',
                                        BackgroundTransparency = 1,
                                        Size = UDim2New(0, 100, 0, 100),
                                        BackgroundColor3 = FromRGB(255, 255, 255),
                                        BorderColor3 = FromRGB(0, 0, 0),
                                        BorderSizePixel = 0,
                                        BottomImage = Library:GetImage'Scrollbar',
                                        MidImage = Library:GetImage'Scrollbar',
                                        TopImage = Library:GetImage'Scrollbar',
                                        CanvasSize = UDim2New(0, 0, 0, 0),
                                    })

                                    NewColumn:AddToTheme{
                                        ScrollBarImageColor3 = 'Accent',
                                    }
                                    Instances:Create('UIPadding', {
                                        Parent = NewColumn.Instance,
                                        PaddingTop = UDimNew(0, 6),
                                        PaddingBottom = UDimNew(0, 6),
                                        PaddingRight = UDimNew(0, 6),
                                        PaddingLeft = UDimNew(0, 6),
                                    })
                                    Instances:Create('UIListLayout', {
                                        Parent = NewColumn.Instance,
                                        Padding = UDimNew(0, 8),
                                        SortOrder = Enum.SortOrder.LayoutOrder,
                                    })

                                    Page.ColumnsData[Index] = NewColumn
                                end
                            else
                                Items.Columns = Instances:Create('Frame', {
                                    Parent = Items.Page.Instance,
                                    Name = '\0',
                                    Position = UDim2New(0, 7, 0, 45),
                                    BorderColor3 = FromRGB(10, 10, 10),
                                    Size = UDim2New(1, -14, 1, -52),
                                    BorderSizePixel = 2,
                                    BackgroundColor3 = FromRGB(15, 15, 20),
                                })

                                Items.Columns:AddToTheme{
                                    BackgroundColor3 = 'Background',
                                    BorderColor3 = 'Border',
                                }

                                Items.SubTabs = Instances:Create('Frame', {
                                    Parent = Items.Page.Instance,
                                    Name = '\0',
                                    BackgroundTransparency = 1,
                                    Position = UDim2New(0, 7, 0, 7),
                                    BorderColor3 = FromRGB(0, 0, 0),
                                    Size = UDim2New(1, -14, 0, 35),
                                    BorderSizePixel = 0,
                                    BackgroundColor3 = FromRGB(255, 255, 255),
                                })

                                Instances:Create('UIListLayout', {
                                    Parent = Items.SubTabs.Instance,
                                    FillDirection = Enum.FillDirection.Horizontal,
                                    HorizontalFlex = Enum.UIFlexAlignment.Fill,
                                    Padding = UDimNew(0, 6),
                                    SortOrder = Enum.SortOrder.LayoutOrder,
                                })
                            end
                        end

                        local Debounce = false

                        function Page.Turn(self, Bool)
                            if Debounce then
                                return
                            end

                            Page.Active = Bool
                            Debounce = true

                            if Bool then
                                Items.Page.Instance.Visible = true

                                Items.Text:Tween(nil, {
                                    TextColor3 = Library.Theme.Accent,
                                    TextTransparency = 0,
                                })

                                Items.Hide.Instance.Visible = true

                                Items.Text:ChangeItemTheme{
                                    TextColor3 = 'Accent',
                                }
                            else
                                Items.Text:Tween(nil, {
                                    TextColor3 = Library.Theme.Text,
                                    TextTransparency = 0.5,
                                })

                                Items.Hide.Instance.Visible = false

                                Items.Text:ChangeItemTheme{
                                    TextColor3 = 'Text',
                                }
                            end

                            local Descendants = Items.Page.Instance:GetDescendants()

                            TableInsert(Descendants, Items.Page.Instance)

                            local NewTween

                            for Index, Value in Descendants do
                                local __DARKLUA_CONTINUE_25 = false

                                repeat
                                    local ValueIndex = Library:GetTransparencyPropertyFromItem(Value)

                                    if not ValueIndex then
                                        __DARKLUA_CONTINUE_25 = true

                                        break
                                    end
                                    if type(ValueIndex) == 'table' then
                                        for _, Property in ValueIndex do
                                            NewTween = Library:FadeItem(Value, Property, Bool, Page.Window.FadeSpeed or 0.5)
                                        end
                                    else
                                        NewTween = Library:FadeItem(Value, ValueIndex, Bool, Page.Window.FadeSpeed or 0.5)
                                    end

                                    __DARKLUA_CONTINUE_25 = true
                                until true

                                if not __DARKLUA_CONTINUE_25 then
                                    break
                                end
                            end

                            Library:Connect(NewTween.Tween.Completed, function()
                                Debounce = false
                                Items.Page.Instance.Visible = Bool
                            end)
                        end

                        Items.Inactive:Connect('MouseButton1Down', function()
                            for Index, Value in Page.Window.Pages do
                                Value:Turn(Value == Page)
                            end
                        end)

                        if #Page.Window.Pages == 0 then
                            Page:Turn(true)
                        end

                        Page.Elements = Items

                        TableInsert(Page.Window.Pages, Page)

                        return setmetatable(Page, Library.Pages)
                    end
                    Library.Pages.SubPage = function(self, Data)
                        Data = Data or {}

                        local SubPage, Items = {
                            Window = self.Window,
                            Page = self,
                            Icon = Data.Icon or Data.icon or '9080568477801',
                            Columns = Data.Columns or Data.columns or 2,
                            Active = false,
                            ColumnsData = {},
                            Elements = {},
                        }, {}

                        do
                            Items.Inactive = Instances:Create('TextButton', {
                                Parent = SubPage.Page.Elements.SubTabs.Instance,
                                FontFace = Library.Font,
                                TextColor3 = FromRGB(0, 0, 0),
                                BorderColor3 = FromRGB(10, 10, 10),
                                Text = '',
                                AutoButtonColor = false,
                                Name = '\0',
                                Size = UDim2New(1, 0, 1, -2),
                                BorderSizePixel = 2,
                                TextSize = 14,
                                BackgroundColor3 = FromRGB(30, 30, 35),
                            })

                            Items.Inactive:AddToTheme{
                                BackgroundColor3 = 'Page Background',
                                BorderColor3 = 'Border',
                            }
                            Instances:Create('UIStroke', {
                                Parent = Items.Inactive.Instance,
                                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                                LineJoinMode = Enum.LineJoinMode.Miter,
                                Name = '\0',
                                Color = FromRGB(27, 27, 32),
                            }):AddToTheme{
                                Color = 'Outline',
                            }

                            Items.Hide = Instances:Create('Frame', {
                                Parent = Items.Inactive.Instance,
                                Visible = false,
                                BorderColor3 = FromRGB(0, 0, 0),
                                AnchorPoint = Vector2New(0, 1),
                                Name = '\0',
                                Position = UDim2New(0, 0, 1, 2),
                                Size = UDim2New(1, 0, 0, 2),
                                ZIndex = 5,
                                BorderSizePixel = 0,
                                BackgroundColor3 = FromRGB(20, 20, 25),
                            })

                            Items.Hide:AddToTheme{
                                BackgroundColor3 = 'Background',
                            }

                            Items.MiscPixel1 = Instances:Create('Frame', {
                                Parent = Items.Hide.Instance,
                                Size = UDim2New(0, 1, 0, 1),
                                Name = '\0',
                                Position = UDim2New(0, -1, 0, 1),
                                BorderColor3 = FromRGB(0, 0, 0),
                                ZIndex = 5,
                                BorderSizePixel = 0,
                                BackgroundColor3 = FromRGB(27, 27, 32),
                            })
                            Items.MiscPixel2 = Instances:Create('Frame', {
                                Parent = Items.Hide.Instance,
                                BorderColor3 = FromRGB(0, 0, 0),
                                AnchorPoint = Vector2New(1, 0),
                                Name = '\0',
                                Position = UDim2New(1, 1, 0, 1),
                                Size = UDim2New(0, 1, 0, 1),
                                ZIndex = 5,
                                BorderSizePixel = 0,
                                BackgroundColor3 = FromRGB(27, 27, 32),
                            })
                            Items.Icon = Instances:Create('ImageLabel', {
                                Parent = Items.Inactive.Instance,
                                ScaleType = Enum.ScaleType.Fit,
                                ImageTransparency = 0.35,
                                BorderColor3 = FromRGB(0, 0, 0),
                                Name = '\0',
                                AnchorPoint = Vector2New(0.5, 0.5),
                                Image = 'rbxassetid://' .. SubPage.Icon,
                                BackgroundTransparency = 1,
                                Position = UDim2New(0.5, 0, 0.5, 0),
                                Size = UDim2New(0, 30, 0, 30),
                                BorderSizePixel = 0,
                                BackgroundColor3 = FromRGB(255, 255, 255),
                            })

                            Items.Icon:AddToTheme{
                                ImageColor3 = 'Text',
                            }
                            Instances:Create('UIGradient', {
                                Parent = Items.Inactive.Instance,
                                Rotation = 90,
                                Color = RGBSequence{
                                    RGBSequenceKeypoint(0, FromRGB(255, 255, 255)),
                                    RGBSequenceKeypoint(1, FromRGB(138, 138, 138)),
                                },
                            })

                            Items.Subtab = Instances:Create('Frame', {
                                Parent = SubPage.Page.Elements.Columns.Instance,
                                BackgroundTransparency = 1,
                                Name = '\0',
                                BorderColor3 = FromRGB(0, 0, 0),
                                Size = UDim2New(1, 0, 1, 0),
                                BorderSizePixel = 0,
                                BackgroundColor3 = FromRGB(255, 255, 255),
                            })

                            Instances:Create('UIPadding', {
                                Parent = Items.Subtab.Instance,
                                PaddingTop = UDimNew(0, 6),
                                PaddingRight = UDimNew(0, 6),
                                PaddingLeft = UDimNew(0, 6),
                            })
                            Instances:Create('UIListLayout', {
                                Parent = Items.Subtab.Instance,
                                FillDirection = Enum.FillDirection.Horizontal,
                                HorizontalFlex = Enum.UIFlexAlignment.Fill,
                                SortOrder = Enum.SortOrder.LayoutOrder,
                                VerticalFlex = Enum.UIFlexAlignment.Fill,
                            })
                            Instances:Create('UIStroke', {
                                Parent = Items.Subtab.Instance,
                                Color = FromRGB(27, 27, 32),
                                Name = '\0',
                                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                            }):AddToTheme{
                                Color = 'Outline',
                            }

                            for Index = 1, SubPage.Columns do
                                local NewColumn = Instances:Create('ScrollingFrame', {
                                    Parent = Items.Subtab.Instance,
                                    ScrollBarImageColor3 = FromRGB(235, 157, 255),
                                    Active = true,
                                    AutomaticCanvasSize = Enum.AutomaticSize.Y,
                                    ScrollBarThickness = 1,
                                    Name = '\0',
                                    BackgroundTransparency = 1,
                                    Size = UDim2New(0, 100, 0, 100),
                                    BackgroundColor3 = FromRGB(255, 255, 255),
                                    BorderColor3 = FromRGB(0, 0, 0),
                                    BorderSizePixel = 0,
                                    CanvasSize = UDim2New(0, 0, 0, 0),
                                })

                                NewColumn:AddToTheme{
                                    ScrollBarImageColor3 = 'Accent',
                                }
                                Instances:Create('UIPadding', {
                                    Parent = NewColumn.Instance,
                                    PaddingTop = UDimNew(0, 6),
                                    PaddingBottom = UDimNew(0, 6),
                                    PaddingRight = UDimNew(0, 6),
                                    PaddingLeft = UDimNew(0, 6),
                                })
                                Instances:Create('UIListLayout', {
                                    Parent = NewColumn.Instance,
                                    Padding = UDimNew(0, 8),
                                    SortOrder = Enum.SortOrder.LayoutOrder,
                                })

                                SubPage.ColumnsData[Index] = NewColumn
                            end
                        end

                        local Debounce = false

                        function SubPage.Turn(self, Bool)
                            if Debounce then
                                return
                            end

                            SubPage.Active = Bool
                            Debounce = true

                            if Bool then
                                Items.Subtab.Instance.Visible = true

                                Items.Icon:Tween(nil, {
                                    ImageColor3 = Library.Theme.Accent,
                                    ImageTransparency = 0,
                                })

                                Items.Hide.Instance.Visible = true

                                Items.Icon:ChangeItemTheme{
                                    ImageColor3 = 'Accent',
                                }

                                Items.Inactive.Instance.Size = UDim2New(1, 0, 1, 1)
                            else
                                Items.Icon:Tween(nil, {
                                    ImageColor3 = Library.Theme.Text,
                                    ImageTransparency = 0.35,
                                })

                                Items.Hide.Instance.Visible = false

                                Items.Icon:ChangeItemTheme{
                                    ImageColor3 = 'Text',
                                }

                                Items.Inactive.Instance.Size = UDim2New(1, 0, 1, -2)
                            end

                            local Descendants = Items.Subtab.Instance:GetDescendants()

                            TableInsert(Descendants, Items.Subtab.Instance)

                            local NewTween

                            for Index, Value in Descendants do
                                local __DARKLUA_CONTINUE_29 = false

                                repeat
                                    local ValueIndex = Library:GetTransparencyPropertyFromItem(Value)

                                    if not ValueIndex then
                                        __DARKLUA_CONTINUE_29 = true

                                        break
                                    end
                                    if type(ValueIndex) == 'table' then
                                        for _, Property in ValueIndex do
                                            NewTween = Library:FadeItem(Value, Property, Bool, SubPage.Window.FadeSpeed or 0.5)
                                        end
                                    else
                                        NewTween = Library:FadeItem(Value, ValueIndex, Bool, SubPage.Window.FadeSpeed or 0.5)
                                    end

                                    __DARKLUA_CONTINUE_29 = true
                                until true

                                if not __DARKLUA_CONTINUE_29 then
                                    break
                                end
                            end

                            Library:Connect(NewTween.Tween.Completed, function()
                                Debounce = false
                                Items.Subtab.Instance.Visible = Bool
                            end)
                        end

                        Items.Inactive:Connect('MouseButton1Down', function()
                            for Index, Value in SubPage.Window.SubPages do
                                Value:Turn(Value == SubPage)
                            end
                        end)

                        if #SubPage.Window.SubPages == 0 then
                            SubPage:Turn(true)
                        end

                        SubPage.Elements = Items

                        TableInsert(SubPage.Window.SubPages, SubPage)

                        return setmetatable(SubPage, Library.Pages)
                    end
                    Library.Pages.Section = function(self, Data)
                        Data = Data or {}

                        local Section, Items = {
                            Window = self.Window,
                            Page = self,
                            Name = Data.Name or Data.name or 'Section',
                            Side = Data.Side or Data.side or 1,
                            Elements = {},
                        }, {}

                        do
                            Items.Section = Instances:Create('Frame', {
                                Parent = Section.Page.ColumnsData[Section.Side].Instance,
                                Name = '\0',
                                Size = UDim2New(1, 0, 0, 25),
                                BorderColor3 = FromRGB(27, 27, 32),
                                BorderSizePixel = 2,
                                AutomaticSize = Enum.AutomaticSize.Y,
                                BackgroundColor3 = FromRGB(20, 20, 25),
                            })

                            Items.Section:AddToTheme{
                                BackgroundColor3 = 'Inline',
                                BorderColor3 = 'Outline',
                            }
                            Instances:Create('UIStroke', {
                                Parent = Items.Section.Instance,
                                Color = FromRGB(10, 10, 10),
                                Name = '\0',
                                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                            }):AddToTheme{
                                Color = 'Border',
                            }
                            Instances:Create('UIPadding', {
                                Parent = Items.Section.Instance,
                                PaddingBottom = UDimNew(0, 6),
                            })

                            Items.AccentLine = Instances:Create('Frame', {
                                Parent = Items.Section.Instance,
                                Name = '\0',
                                BorderColor3 = FromRGB(0, 0, 0),
                                Size = UDim2New(1, 0, 0, 2),
                                BorderSizePixel = 0,
                                BackgroundColor3 = FromRGB(235, 157, 255),
                            })

                            Items.AccentLine:AddToTheme{
                                BackgroundColor3 = 'Accent',
                            }
                            Instances:Create('UIGradient', {
                                Parent = Items.AccentLine.Instance,
                                Rotation = 90,
                                Color = RGBSequence{
                                    RGBSequenceKeypoint(0, FromRGB(255, 255, 255)),
                                    RGBSequenceKeypoint(1, FromRGB(65, 65, 65)),
                                },
                            })

                            Items.Text = Instances:Create('TextLabel', {
                                Parent = Items.Section.Instance,
                                FontFace = Library.Font,
                                TextColor3 = FromRGB(215, 215, 215),
                                BorderColor3 = FromRGB(0, 0, 0),
                                Text = Section.Name,
                                Name = '\0',
                                Size = UDim2New(1, -12, 0, 15),
                                BackgroundTransparency = 1,
                                TextXAlignment = Enum.TextXAlignment.Left,
                                Position = UDim2New(0, 4, 0, 2),
                                BorderSizePixel = 0,
                                TextSize = 12,
                                BackgroundColor3 = FromRGB(255, 255, 255),
                            })

                            Items.Text:AddToTheme{
                                TextColor3 = 'Text',
                            }
                            Instances:Create('UIStroke', {
                                Parent = Items.Text.Instance,
                                LineJoinMode = Enum.LineJoinMode.Miter,
                                Name = '\0',
                            }):AddToTheme{
                                Color = 'Text Border',
                            }

                            Items.Content = Instances:Create('Frame', {
                                Parent = Items.Section.Instance,
                                Name = '\0',
                                BackgroundTransparency = 1,
                                Position = UDim2New(0, 7, 0, 21),
                                BorderColor3 = FromRGB(0, 0, 0),
                                Size = UDim2New(1, -14, 1, -20),
                                BorderSizePixel = 0,
                                BackgroundColor3 = FromRGB(255, 255, 255),
                            })

                            Instances:Create('UIListLayout', {
                                Parent = Items.Content.Instance,
                                Padding = UDimNew(0, 6),
                                SortOrder = Enum.SortOrder.LayoutOrder,
                            })
                        end

                        Section.Elements = Items

                        return setmetatable(Section, Library.Sections)
                    end
                    Library.Pages.MultiSection = function(self, Data)
                        local MultiSection, Items = {
                            Window = self.Window,
                            Page = self,
                            Sections = Data.Sections or Data.sections or {
                                'Section 1',
                                'Section 2',
                                'Section 3',
                            },
                            Side = Data.Side or Data.side or 1,
                            SectionContents = {},
                            Elements = {},
                        }, {}

                        do
                            Items.MultiSection = Instances:Create('Frame', {
                                Parent = MultiSection.Page.ColumnsData[MultiSection.Side].Instance,
                                Name = '\0',
                                Size = UDim2New(1, 0, 0, 25),
                                BorderColor3 = FromRGB(27, 27, 32),
                                BorderSizePixel = 2,
                                AutomaticSize = Enum.AutomaticSize.Y,
                                BackgroundColor3 = FromRGB(20, 20, 25),
                            })

                            Items.MultiSection:AddToTheme{
                                BackgroundColor3 = 'Inline',
                                BorderColor3 = 'Outline',
                            }
                            Instances:Create('UIStroke', {
                                Parent = Items.MultiSection.Instance,
                                Color = FromRGB(10, 10, 10),
                                Name = '\0',
                                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                            }):AddToTheme{
                                Color = 'Border',
                            }
                            Instances:Create('UIPadding', {
                                Parent = Items.MultiSection.Instance,
                                PaddingBottom = UDimNew(0, 6),
                            })

                            Items.AccentLine = Instances:Create('Frame', {
                                Parent = Items.MultiSection.Instance,
                                Name = '\0',
                                BorderColor3 = FromRGB(0, 0, 0),
                                Size = UDim2New(1, 0, 0, 2),
                                BorderSizePixel = 0,
                                BackgroundColor3 = FromRGB(235, 157, 255),
                            })

                            Items.AccentLine:AddToTheme{
                                BackgroundColor3 = 'Accent',
                            }
                            Instances:Create('UIGradient', {
                                Parent = Items.AccentLine.Instance,
                                Rotation = 90,
                                Color = RGBSequence{
                                    RGBSequenceKeypoint(0, FromRGB(255, 255, 255)),
                                    RGBSequenceKeypoint(1, FromRGB(65, 65, 65)),
                                },
                            })

                            Items.Sections = Instances:Create('Frame', {
                                Parent = Items.MultiSection.Instance,
                                Name = '\0',
                                BackgroundTransparency = 1,
                                Position = UDim2New(0, 7, 0, 9),
                                BorderColor3 = FromRGB(0, 0, 0),
                                Size = UDim2New(1, -14, 0, 19),
                                BorderSizePixel = 0,
                                BackgroundColor3 = FromRGB(255, 255, 255),
                            })

                            Instances:Create('UIListLayout', {
                                Parent = Items.Sections.Instance,
                                FillDirection = Enum.FillDirection.Horizontal,
                                HorizontalFlex = Enum.UIFlexAlignment.Fill,
                                Padding = UDimNew(0, 5),
                                SortOrder = Enum.SortOrder.LayoutOrder,
                            })

                            Items.Content = Instances:Create('Frame', {
                                Parent = Items.MultiSection.Instance,
                                Name = '\0',
                                BackgroundTransparency = 1,
                                Position = UDim2New(0, 7, 0, 35),
                                BorderColor3 = FromRGB(10, 10, 10),
                                Size = UDim2New(1, -14, 1, -33),
                                BorderSizePixel = 0,
                                BackgroundColor3 = FromRGB(15, 15, 20),
                            })
                        end

                        for Index, Value in MultiSection.Sections do
                            local NewSection, SubItems = {
                                Window = MultiSection.Window,
                                Page = MultiSection.Page,
                                MultiSection = MultiSection,
                                Name = Value,
                                Elements = {},
                                Active = false,
                            }, {}

                            do
                                SubItems.Inactive = Instances:Create('TextButton', {
                                    Parent = Items.Sections.Instance,
                                    FontFace = Library.Font,
                                    TextColor3 = FromRGB(0, 0, 0),
                                    BorderColor3 = FromRGB(10, 10, 10),
                                    Text = '',
                                    AutoButtonColor = false,
                                    Name = '\0',
                                    Size = UDim2New(1, 0, 1, 0),
                                    BorderSizePixel = 2,
                                    TextSize = 14,
                                    BackgroundColor3 = FromRGB(30, 30, 35),
                                })

                                SubItems.Inactive:AddToTheme{
                                    BackgroundColor3 = 'Page Background',
                                    BorderColor3 = 'Border',
                                }

                                SubItems.Text = Instances:Create('TextLabel', {
                                    Parent = SubItems.Inactive.Instance,
                                    FontFace = Library.Font,
                                    TextColor3 = FromRGB(215, 215, 215),
                                    TextTransparency = 0.48,
                                    Text = NewSection.Name,
                                    Name = '\0',
                                    Size = UDim2New(1, 0, 1, 0),
                                    BackgroundTransparency = 1,
                                    Position = UDim2New(0, 0, 0, -1),
                                    BorderSizePixel = 0,
                                    BorderColor3 = FromRGB(0, 0, 0),
                                    TextSize = 12,
                                    BackgroundColor3 = FromRGB(255, 255, 255),
                                })

                                SubItems.Text:AddToTheme{
                                    TextColor3 = 'Text',
                                }
                                Instances:Create('UIStroke', {
                                    Parent = SubItems.Text.Instance,
                                    LineJoinMode = Enum.LineJoinMode.Miter,
                                    Name = '\0',
                                }):AddToTheme{
                                    Color = 'Text Border',
                                }

                                SubItems.Hide = Instances:Create('Frame', {
                                    Parent = SubItems.Inactive.Instance,
                                    Visible = false,
                                    BorderColor3 = FromRGB(0, 0, 0),
                                    AnchorPoint = Vector2New(0, 1),
                                    Name = '\0',
                                    Position = UDim2New(0, 0, 1, 0),
                                    Size = UDim2New(1, 0, 0, 3),
                                    ZIndex = 2,
                                    BorderSizePixel = 0,
                                    BackgroundColor3 = FromRGB(15, 15, 20),
                                })

                                SubItems.Hide:AddToTheme{
                                    BackgroundColor3 = 'Background',
                                }

                                SubItems.MiscPixel1 = Instances:Create('Frame', {
                                    Parent = SubItems.Hide.Instance,
                                    Size = UDim2New(0, 1, 0, 1),
                                    Name = '\0',
                                    Position = UDim2New(0, -1, 0, 1),
                                    BorderColor3 = FromRGB(0, 0, 0),
                                    ZIndex = 2,
                                    BorderSizePixel = 0,
                                    BackgroundColor3 = FromRGB(27, 27, 32),
                                })

                                SubItems.MiscPixel1:AddToTheme{
                                    BackgroundColor3 = 'Outline',
                                }

                                SubItems.MiscPixel2 = Instances:Create('Frame', {
                                    Parent = SubItems.Hide.Instance,
                                    BorderColor3 = FromRGB(0, 0, 0),
                                    AnchorPoint = Vector2New(1, 0),
                                    Name = '\0',
                                    Position = UDim2New(1, 1, 0, 1),
                                    Size = UDim2New(0, 1, 0, 1),
                                    ZIndex = 2,
                                    BorderSizePixel = 0,
                                    BackgroundColor3 = FromRGB(27, 27, 32),
                                })

                                SubItems.MiscPixel2:AddToTheme{
                                    BackgroundColor3 = 'Outline',
                                }
                                Instances:Create('UIStroke', {
                                    Parent = SubItems.Inactive.Instance,
                                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                                    LineJoinMode = Enum.LineJoinMode.Miter,
                                    Name = '\0',
                                    Color = FromRGB(27, 27, 32),
                                }):AddToTheme{
                                    Color = 'Outline',
                                }
                                Instances:Create('UIGradient', {
                                    Parent = SubItems.Inactive.Instance,
                                    Rotation = 90,
                                    Color = RGBSequence{
                                        RGBSequenceKeypoint(0, FromRGB(255, 255, 255)),
                                        RGBSequenceKeypoint(1, FromRGB(108, 108, 108)),
                                    },
                                })

                                SubItems.Content = Instances:Create('Frame', {
                                    Parent = Items.Content.Instance,
                                    BackgroundTransparency = 1,
                                    Name = '\0',
                                    BorderColor3 = FromRGB(0, 0, 0),
                                    Size = UDim2New(1, 0, 1, 0),
                                    BorderSizePixel = 0,
                                    Visible = false,
                                    BackgroundColor3 = FromRGB(255, 255, 255),
                                })

                                Instances:Create('UIListLayout', {
                                    Parent = SubItems.Content.Instance,
                                    Padding = UDimNew(0, 6),
                                    SortOrder = Enum.SortOrder.LayoutOrder,
                                })
                            end

                            local Debounce = false

                            function NewSection.Turn(self, Bool)
                                if Debounce then
                                    return
                                end

                                NewSection.Active = Bool
                                Debounce = true

                                if Bool then
                                    SubItems.Content.Instance.Visible = true

                                    SubItems.Text:Tween(nil, {
                                        TextColor3 = Library.Theme.Accent,
                                        TextTransparency = 0,
                                    })
                                    SubItems.Text:ChangeItemTheme{
                                        TextColor3 = 'Accent',
                                    }
                                else
                                    SubItems.Text:Tween(nil, {
                                        TextColor3 = Library.Theme.Text,
                                        TextTransparency = 0.5,
                                    })
                                    SubItems.Text:ChangeItemTheme{
                                        TextColor3 = 'Text',
                                    }
                                end

                                local Descendants = SubItems.Content.Instance:GetDescendants()

                                TableInsert(Descendants, SubItems.Content.Instance)

                                local NewTween

                                for Index, Value in Descendants do
                                    local __DARKLUA_CONTINUE_33 = false

                                    repeat
                                        local ValueIndex = Library:GetTransparencyPropertyFromItem(Value)

                                        if not ValueIndex then
                                            __DARKLUA_CONTINUE_33 = true

                                            break
                                        end
                                        if type(ValueIndex) == 'table' then
                                            for _, Property in ValueIndex do
                                                NewTween = Library:FadeItem(Value, Property, Bool, MultiSection.Window.FadeSpeed or 0.5)
                                            end
                                        else
                                            NewTween = Library:FadeItem(Value, ValueIndex, Bool, MultiSection.Window.FadeSpeed or 0.5)
                                        end

                                        __DARKLUA_CONTINUE_33 = true
                                    until true

                                    if not __DARKLUA_CONTINUE_33 then
                                        break
                                    end
                                end

                                Library:Connect(NewTween.Tween.Completed, function()
                                    Debounce = false
                                    SubItems.Content.Instance.Visible = Bool
                                end)
                            end

                            SubItems.Inactive:Connect('MouseButton1Down', function()
                                for Index, Value in MultiSection.SectionContents do
                                    Value:Turn(Value == NewSection)
                                end
                            end)

                            if #MultiSection.SectionContents == 0 then
                                NewSection:Turn(true)
                            end

                            NewSection.Elements = SubItems
                            MultiSection.SectionContents[#MultiSection.SectionContents + 1] = setmetatable(NewSection, Library.Sections)
                        end

                        MultiSection.SectionContents[1]:Turn(true)

                        MultiSection.Window.Sections[#MultiSection.Window.Sections + 1] = MultiSection

                        return TableUnpack(MultiSection.SectionContents)
                    end
                    Library.Pages.ScrollableSection = function(self, Data)
                        Data = Data or {}

                        local Section, Items = {
                            Window = self.Window,
                            Page = self,
                            Name = Data.Name or Data.name or 'Section',
                            Side = Data.Side or Data.side or 1,
                            Size = Data.Size or Data.size or 175,
                            Elements = {},
                        }, {}

                        do
                            Items.Section = Instances:Create('Frame', {
                                Parent = Section.Page.ColumnsData[Section.Side].Instance,
                                Name = '\0',
                                Size = UDim2New(1, 0, 0, Section.Size),
                                BorderColor3 = FromRGB(27, 27, 32),
                                BorderSizePixel = 2,
                                AutomaticSize = Enum.AutomaticSize.Y,
                                BackgroundColor3 = FromRGB(20, 20, 25),
                            })

                            Items.Section:AddToTheme{
                                BackgroundColor3 = 'Inline',
                                BorderColor3 = 'Outline',
                            }

                            Items.Fade = Instances:Create('Frame', {
                                Parent = Items.Section.Instance,
                                BorderColor3 = FromRGB(0, 0, 0),
                                Size = UDim2New(1, 0, 0, 20),
                                AnchorPoint = Vector2New(0, 1),
                                Position = UDim2New(0, 0, 1, 2),
                                BorderSizePixel = 0,
                                ZIndex = 15,
                                BackgroundColor3 = FromRGB(27, 27, 32),
                            })

                            Items.Fade:AddToTheme{
                                BackgroundColor3 = 'Inline',
                            }
                            Instances:Create('UIGradient', {
                                Parent = Items.Fade.Instance,
                                Rotation = -90,
                                Transparency = NumSequence{
                                    NumSequenceKeypoint(0, 0),
                                    NumSequenceKeypoint(0.718, 0.768750011920929),
                                    NumSequenceKeypoint(1, 1),
                                },
                            })
                            Instances:Create('UIStroke', {
                                Parent = Items.Section.Instance,
                                Color = FromRGB(10, 10, 10),
                                Name = '\0',
                                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                            }):AddToTheme{
                                Color = 'Border',
                            }
                            Instances:Create('UIPadding', {
                                Parent = Items.Section.Instance,
                                PaddingBottom = UDimNew(0, 6),
                            })

                            Items.AccentLine = Instances:Create('Frame', {
                                Parent = Items.Section.Instance,
                                Name = '\0',
                                BorderColor3 = FromRGB(0, 0, 0),
                                Size = UDim2New(1, 0, 0, 2),
                                BorderSizePixel = 0,
                                BackgroundColor3 = FromRGB(235, 157, 255),
                            })

                            Items.AccentLine:AddToTheme{
                                BackgroundColor3 = 'Accent',
                            }
                            Instances:Create('UIGradient', {
                                Parent = Items.AccentLine.Instance,
                                Rotation = 90,
                                Color = RGBSequence{
                                    RGBSequenceKeypoint(0, FromRGB(255, 255, 255)),
                                    RGBSequenceKeypoint(1, FromRGB(65, 65, 65)),
                                },
                            })

                            Items.Text = Instances:Create('TextLabel', {
                                Parent = Items.Section.Instance,
                                FontFace = Library.Font,
                                TextColor3 = FromRGB(215, 215, 215),
                                BorderColor3 = FromRGB(0, 0, 0),
                                Text = Section.Name,
                                Name = '\0',
                                Size = UDim2New(1, -12, 0, 15),
                                BackgroundTransparency = 1,
                                TextXAlignment = Enum.TextXAlignment.Left,
                                Position = UDim2New(0, 4, 0, 2),
                                BorderSizePixel = 0,
                                TextSize = 12,
                                BackgroundColor3 = FromRGB(255, 255, 255),
                            })

                            Items.Text:AddToTheme{
                                TextColor3 = 'Text',
                            }
                            Instances:Create('UIStroke', {
                                Parent = Items.Text.Instance,
                                LineJoinMode = Enum.LineJoinMode.Miter,
                                Name = '\0',
                            }):AddToTheme{
                                Color = 'Text Border',
                            }

                            Items.Content = Instances:Create('ScrollingFrame', {
                                Parent = Items.Section.Instance,
                                Name = '\0',
                                ScrollBarThickness = 3,
                                AutomaticCanvasSize = Enum.AutomaticSize.Y,
                                CanvasSize = UDim2New(0, 0, 0, 0),
                                ScrollBarImageColor3 = FromRGB(235, 157, 255),
                                MidImage = Library:GetImage'Scrollbar',
                                TopImage = Library:GetImage'Scrollbar',
                                BottomImage = Library:GetImage'Scrollbar',
                                Active = true,
                                BackgroundTransparency = 1,
                                Position = UDim2New(0, 0, 0, 21),
                                BorderColor3 = FromRGB(0, 0, 0),
                                Size = UDim2New(1, -5, 1, -20),
                                BorderSizePixel = 0,
                                BackgroundColor3 = FromRGB(255, 255, 255),
                            })

                            Items.Content:AddToTheme{
                                ScrollBarImageColor3 = 'Accent',
                            }
                            Instances:Create('UIPadding', {
                                Parent = Items.Content.Instance,
                                PaddingTop = UDimNew(0, 0),
                                PaddingBottom = UDimNew(0, 8),
                                PaddingRight = UDimNew(0, 11),
                                PaddingLeft = UDimNew(0, 8),
                            })
                            Instances:Create('UIListLayout', {
                                Parent = Items.Content.Instance,
                                Padding = UDimNew(0, 6),
                                SortOrder = Enum.SortOrder.LayoutOrder,
                            })
                        end

                        Section.Elements = Items

                        return setmetatable(Section, Library.Sections)
                    end
                    Library.Sections.Divider = function(self)
                        local Divider, Items = {
                            Window = self.Window,
                            Page = self.Page,
                            Section = self,
                        }, {}

                        do
                            Items.Divider = Instances:Create('Frame', {
                                Parent = Divider.Section.Elements.Content.Instance,
                                BackgroundTransparency = 1,
                                Name = '\0',
                                BorderColor3 = FromRGB(0, 0, 0),
                                Size = UDim2New(1, 0, 0, 10),
                                BorderSizePixel = 0,
                                BackgroundColor3 = FromRGB(255, 255, 255),
                            })
                            Items.RealDivider = Instances:Create('Frame', {
                                Parent = Items.Divider.Instance,
                                AnchorPoint = Vector2New(0, 0.5),
                                Name = '\0',
                                Position = UDim2New(0, 0, 0.5, 0),
                                BorderColor3 = FromRGB(10, 10, 10),
                                Size = UDim2New(1, 0, 0, 3),
                                BorderSizePixel = 2,
                                BackgroundColor3 = FromRGB(15, 15, 20),
                            })

                            Items.RealDivider:AddToTheme{
                                BackgroundColor3 = 'Background',
                                BorderColor3 = 'Border',
                            }
                            Instances:Create('UIStroke', {
                                Parent = Items.RealDivider.Instance,
                                Color = FromRGB(27, 27, 32),
                                Name = '\0',
                                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                            }):AddToTheme{
                                Color = 'Outline',
                            }
                        end

                        function Divider.SetVisibility(self, Bool)
                            Items.Divider.Instance.Visible = Bool
                        end

                        return Divider
                    end
                    Library.Sections.Toggle = function(self, Data)
                        Data = Data or {}

                        local Toggle, Items = {
                            Window = self.Window,
                            Page = self.Page,
                            Section = self,
                            Name = Data.Name or Data.name or 'Toggle',
                            Flag = Data.Flag or Data.flag or Library:NextFlag(),
                            Default = Data.Default or Data.default or false,
                            Callback = Data.Callback or Data.callback or function() end,
                            Value = false,
                            Class = 'Toggle',
                            Count = 0,
                        }, {}

                        do
                            Items.Toggle = Instances:Create('TextButton', {
                                Parent = Toggle.Section.Elements.Content.Instance,
                                FontFace = Library.Font,
                                TextColor3 = FromRGB(0, 0, 0),
                                BorderColor3 = FromRGB(0, 0, 0),
                                Text = '',
                                AutoButtonColor = false,
                                BackgroundTransparency = 1,
                                Name = '\0',
                                Size = UDim2New(1, 0, 0, 11),
                                BorderSizePixel = 0,
                                TextSize = 14,
                                BackgroundColor3 = FromRGB(255, 255, 255),
                            })
                            Items.Indicator = Instances:Create('Frame', {
                                Parent = Items.Toggle.Instance,
                                Name = '\0',
                                BorderColor3 = FromRGB(10, 10, 10),
                                Size = UDim2New(0, 10, 0, 10),
                                BorderSizePixel = 2,
                                BackgroundColor3 = FromRGB(33, 33, 36),
                            })

                            Items.Indicator:AddToTheme{
                                BackgroundColor3 = 'Element',
                                BorderColor3 = 'Border',
                            }
                            Instances:Create('UIStroke', {
                                Parent = Items.Indicator.Instance,
                                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                                LineJoinMode = Enum.LineJoinMode.Miter,
                                Name = '\0',
                                Color = FromRGB(27, 27, 32),
                            }):AddToTheme{
                                Color = 'Outline',
                            }
                            Instances:Create('UIGradient', {
                                Parent = Items.Indicator.Instance,
                                Rotation = 90,
                                Color = RGBSequence{
                                    RGBSequenceKeypoint(0, FromRGB(255, 255, 255)),
                                    RGBSequenceKeypoint(1, FromRGB(100, 100, 100)),
                                },
                            })

                            Items.Text = Instances:Create('TextLabel', {
                                Parent = Items.Toggle.Instance,
                                FontFace = Library.Font,
                                TextColor3 = FromRGB(215, 215, 215),
                                TextTransparency = 0.48,
                                Text = Toggle.Name,
                                Name = '\0',
                                Size = UDim2New(1, 0, 1, 0),
                                Position = UDim2New(0, 18, 0, -1),
                                BackgroundTransparency = 1,
                                TextXAlignment = Enum.TextXAlignment.Left,
                                BorderSizePixel = 0,
                                BorderColor3 = FromRGB(0, 0, 0),
                                TextSize = 12,
                                BackgroundColor3 = FromRGB(255, 255, 255),
                            })

                            Items.Text:AddToTheme{
                                TextColor3 = 'Text',
                            }
                            Instances:Create('UIStroke', {
                                Parent = Items.Text.Instance,
                                LineJoinMode = Enum.LineJoinMode.Miter,
                                Name = '\0',
                            }):AddToTheme{
                                Color = 'Text Border',
                            }
                            Items.Toggle:OnHover(function()
                                if Toggle.Value then
                                    return
                                end

                                Items.Indicator:Tween(nil, {
                                    BackgroundColor3 = Library.Theme['Hovered Element'],
                                })
                                Items.Indicator:ChangeItemTheme{
                                    BackgroundColor3 = 'Hovered Element',
                                    BorderColor3 = 'Border',
                                }
                            end)
                            Items.Toggle:OnHoverLeave(function()
                                if Toggle.Value then
                                    return
                                end

                                Items.Indicator:Tween(nil, {
                                    BackgroundColor3 = Library.Theme.Element,
                                })
                                Items.Indicator:ChangeItemTheme{
                                    BackgroundColor3 = 'Element',
                                    BorderColor3 = 'Border',
                                }
                            end)
                        end

                        function Toggle.Get(self)
                            return Toggle.Value
                        end
                        function Toggle.Set(self, Bool)
                            Toggle.Value = Bool or not Toggle.Value
                            Library.Flags[Toggle.Flag] = Toggle.Value

                            if Toggle.Value then
                                Items.Indicator:ChangeItemTheme{
                                    BackgroundColor3 = 'Accent',
                                }
                                Items.Indicator:Tween(nil, {
                                    BackgroundColor3 = Library.Theme.Accent,
                                })
                                Items.Text:Tween(nil, {TextTransparency = 0})
                            else
                                Items.Indicator:ChangeItemTheme{
                                    BackgroundColor3 = 'Element',
                                }
                                Items.Indicator:Tween(nil, {
                                    BackgroundColor3 = Library.Theme.Element,
                                })
                                Items.Text:Tween(nil, {TextTransparency = 0.48})
                            end
                            if Toggle.Callback then
                                Library:SafeCall(Toggle.Callback, Toggle.Value)
                            end
                        end
                        function Toggle.SetVisiblity(self, Bool)
                            Items.Toggle.Instance.Visible = Bool
                        end
                        function Toggle.Colorpicker(self, Data)
                            Data = Data or {}

                            local Colorpicker = {
                                Window = self.Window,
                                Tab = self.Tab,
                                Section = self.Section,
                                Parent = Items.Toggle,
                                Name = Data.Name or Data.name or 'Colorpicker',
                                Flag = Data.Flag or Data.flag or Library:NextFlag(),
                                Default = Data.Default or Data.default or Color3.fromRGB(255, 255, 255),
                                Callback = Data.Callback or Data.callback or function() end,
                                Alpha = Data.Alpha or Data.alpha or false,
                                Count = Toggle.Count,
                                FadeSpeed = self.Window.FadeSpeed,
                            }

                            Toggle.Count = Toggle.Count + 1
                            Colorpicker.Count = Toggle.Count

                            local Extension = Library:CreateColorpicker(Colorpicker)

                            Library.Flags[Colorpicker.Flag] = Extension

                            return Colorpicker
                        end
                        function Toggle.Keybind(self, Data)
                            Data = Data or {}

                            local Keybind = {
                                Window = self.Window,
                                Tab = self.Tab,
                                Section = self.Section,
                                Parent = Items.Toggle,
                                Name = Data.Name or Data.name or 'Keybind',
                                Flag = Data.Flag or Data.flag or Library:NextFlag(),
                                Default = Data.Default or Data.default or 'None',
                                Mode = Data.Mode or Data.mode or 'Toggle',
                                Callback = Data.Callback or Data.callback or function() end,
                            }
                            local Extension = Library:CreateKeybind(Keybind)

                            Library.Flags[Keybind.Flag] = Extension

                            return Keybind, Extension
                        end

                        Items.Toggle:Connect('MouseButton1Down', function()
                            Toggle:Set()
                        end)

                        if Toggle.Default then
                            Toggle:Set(Toggle.Default)
                        end

                        Library.SetFlags[Toggle.Flag] = function(Value)
                            Toggle:Set(Value)
                        end

                        return Toggle
                    end
                    Library.Sections.Button = function(self, Data)
                        Data = Data or {}

                        local Button, Items = {
                            Window = self.Window,
                            Page = self.Page,
                            Section = self,
                            Name = Data.Name or Data.name,
                            Callback = Data.Callback or Data.callback or function() end,
                        }, {}

                        do
                            Items.Button = Instances:Create('TextButton', {
                                Parent = Button.Section.Elements.Content.Instance,
                                BorderColor3 = FromRGB(10, 10, 10),
                                AutoButtonColor = false,
                                Name = '\0',
                                Position = UDim2New(0, 0, 1, 0),
                                Size = UDim2New(1, 0, 0, 17),
                                Selectable = false,
                                BorderSizePixel = 2,
                                BackgroundColor3 = FromRGB(33, 33, 36),
                            })

                            Items.Button:AddToTheme{
                                BackgroundColor3 = 'Element',
                                BorderColor3 = 'Border',
                            }
                            Instances:Create('UIGradient', {
                                Parent = Items.Button.Instance,
                                Rotation = 90,
                                Color = RGBSequence{
                                    RGBSequenceKeypoint(0, FromRGB(255, 255, 255)),
                                    RGBSequenceKeypoint(1, FromRGB(100, 100, 100)),
                                },
                            })
                            Instances:Create('UIStroke', {
                                Parent = Items.Button.Instance,
                                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                                LineJoinMode = Enum.LineJoinMode.Miter,
                                Name = '\0',
                                Color = FromRGB(27, 27, 32),
                            }):AddToTheme{
                                Color = 'Outline',
                            }

                            Items.Text = Instances:Create('TextLabel', {
                                Parent = Items.Button.Instance,
                                FontFace = Library.Font,
                                TextColor3 = FromRGB(215, 215, 215),
                                BorderColor3 = FromRGB(0, 0, 0),
                                Text = Button.Name,
                                Name = '\0',
                                Size = UDim2New(1, 0, 1, 0),
                                BackgroundTransparency = 1,
                                TextTruncate = Enum.TextTruncate.AtEnd,
                                Position = UDim2New(0, 0, 0, -1),
                                BorderSizePixel = 0,
                                TextSize = 12,
                                BackgroundColor3 = FromRGB(255, 255, 255),
                            })

                            Items.Text:AddToTheme{
                                TextColor3 = 'Text',
                            }

                            Items.TextBorder = Instances:Create('UIStroke', {
                                Parent = Items.Text.Instance,
                                LineJoinMode = Enum.LineJoinMode.Miter,
                                Name = '\0',
                            }):AddToTheme{
                                Color = 'Text Border',
                            }

                            Items.Button:OnHover(function()
                                Items.Button:Tween(nil, {
                                    BackgroundColor3 = Library.Theme['Hovered Element'],
                                })
                                Items.Button:ChangeItemTheme{
                                    BackgroundColor3 = 'Hovered Element',
                                    BorderColor3 = 'Border',
                                }
                            end)
                            Items.Button:OnHoverLeave(function()
                                Items.Button:Tween(nil, {
                                    BackgroundColor3 = Library.Theme.Element,
                                })
                                Items.Button:ChangeItemTheme{
                                    BackgroundColor3 = 'Element',
                                    BorderColor3 = 'Border',
                                }
                            end)
                        end

                        function Button.Press(self)
                            Library:SafeCall(Button.Callback)
                            Items.Text:ChangeItemTheme{
                                TextColor3 = 'Accent',
                            }
                            Items.Button:ChangeItemTheme{
                                BackgroundColor3 = 'Accent',
                            }
                            Items.Text:Tween(nil, {
                                TextColor3 = Library.Theme.Accent,
                            })
                            Items.Button:Tween(nil, {
                                BackgroundColor3 = Library.Theme.Accent,
                            })
                            task.wait(0.1)
                            Items.Text:ChangeItemTheme{
                                TextColor3 = 'Text',
                            }
                            Items.Button:ChangeItemTheme{
                                BackgroundColor3 = 'Element',
                            }
                            Items.Text:Tween(nil, {
                                TextColor3 = Library.Theme.Text,
                            })
                            Items.Button:Tween(nil, {
                                BackgroundColor3 = Library.Theme.Element,
                            })
                        end
                        function Button.SetVisiblity(self, Bool)
                            Items.Button.Instance.Visible = Bool
                        end

                        Items.Button:Connect('MouseButton1Down', function()
                            Button:Press()
                        end)

                        return Button
                    end
                    Library.Sections.Slider = function(self, Data)
                        Data = Data or {}

                        local Slider, Items = {
                            Window = self.Window,
                            Page = self.Page,
                            Section = self,
                            Name = Data.Name or Data.name or 'Slider',
                            Flag = Data.Flag or Data.flag or Library:NextFlag(),
                            Min = Data.Min or Data.min or 0,
                            Default = Data.Default or Data.default or 0,
                            Max = Data.Max or Data.max or 100,
                            Suffix = Data.Suffix or Data.suffix or '',
                            Decimals = Data.Decimals or Data.decimals or 1,
                            Callback = Data.Callback or Data.callback or function() end,
                            Compact = Data.Compact or Data.compact or false,
                            Value = 0,
                            Sliding = false,
                            Class = 'Slider',
                        }, {}

                        do
                            Items.Slider = Instances:Create('Frame', {
                                Parent = Slider.Section.Elements.Content.Instance,
                                BackgroundTransparency = 1,
                                Name = '\0',
                                BorderColor3 = FromRGB(0, 0, 0),
                                Size = UDim2New(1, 0, 0, 27),
                                BorderSizePixel = 0,
                                BackgroundColor3 = FromRGB(255, 255, 255),
                            })
                            Items.Text = Instances:Create('TextLabel', {
                                Parent = Items.Slider.Instance,
                                FontFace = Library.Font,
                                TextColor3 = FromRGB(215, 215, 215),
                                BorderColor3 = FromRGB(0, 0, 0),
                                Text = Slider.Name,
                                Name = '\0',
                                BackgroundTransparency = 1,
                                TextXAlignment = Enum.TextXAlignment.Left,
                                Size = UDim2New(1, 0, 0, 13),
                                BorderSizePixel = 0,
                                TextSize = 12,
                                BackgroundColor3 = FromRGB(255, 255, 255),
                            })

                            Items.Text:AddToTheme{
                                TextColor3 = 'Text',
                            }
                            Instances:Create('UIStroke', {
                                Parent = Items.Text.Instance,
                                LineJoinMode = Enum.LineJoinMode.Miter,
                                Name = '\0',
                            }):AddToTheme{
                                Color = 'Text Border',
                            }

                            Items.RealSlider = Instances:Create('TextButton', {
                                Parent = Items.Slider.Instance,
                                AnchorPoint = Vector2New(0, 1),
                                Name = '\0',
                                Position = UDim2New(0, 0, 1, 0),
                                BorderColor3 = FromRGB(10, 10, 10),
                                Text = '',
                                AutoButtonColor = false,
                                Size = UDim2New(1, 0, 0, 10),
                                BorderSizePixel = 2,
                                BackgroundColor3 = FromRGB(33, 33, 36),
                            })

                            Items.RealSlider:AddToTheme{
                                BackgroundColor3 = 'Background',
                                BorderColor3 = 'Border',
                            }
                            Instances:Create('UIStroke', {
                                Parent = Items.RealSlider.Instance,
                                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                                LineJoinMode = Enum.LineJoinMode.Miter,
                                Name = '\0',
                                Color = FromRGB(27, 27, 32),
                            }):AddToTheme{
                                Color = 'Outline',
                            }
                            Instances:Create('UIGradient', {
                                Parent = Items.RealSlider.Instance,
                                Rotation = 90,
                                Color = RGBSequence{
                                    RGBSequenceKeypoint(0, FromRGB(255, 255, 255)),
                                    RGBSequenceKeypoint(1, FromRGB(100, 100, 100)),
                                },
                            })

                            Items.Indicator = Instances:Create('Frame', {
                                Parent = Items.RealSlider.Instance,
                                Name = '\0',
                                BorderColor3 = FromRGB(0, 0, 0),
                                Size = UDim2New(0.5, 0, 1, 0),
                                BorderSizePixel = 0,
                                BackgroundColor3 = FromRGB(235, 157, 255),
                            })

                            Items.Indicator:AddToTheme{
                                BackgroundColor3 = 'Accent',
                            }
                            Instances:Create('UIGradient', {
                                Parent = Items.Indicator.Instance,
                                Rotation = 90,
                                Color = RGBSequence{
                                    RGBSequenceKeypoint(0, FromRGB(255, 255, 255)),
                                    RGBSequenceKeypoint(1, FromRGB(100, 100, 100)),
                                },
                            })

                            Items.Value = Instances:Create('TextLabel', {
                                Parent = Items.RealSlider.Instance,
                                FontFace = Library.Font,
                                TextColor3 = FromRGB(215, 215, 215),
                                BorderColor3 = FromRGB(0, 0, 0),
                                Text = '50/100s',
                                Name = '\0',
                                BackgroundTransparency = 1,
                                Position = UDim2New(0, 0, 0, -1),
                                Size = UDim2New(1, 0, 1, 0),
                                BorderSizePixel = 0,
                                TextSize = 12,
                                BackgroundColor3 = FromRGB(255, 255, 255),
                            })

                            Items.Value:AddToTheme{
                                TextColor3 = 'Text',
                            }
                            Instances:Create('UIStroke', {
                                Parent = Items.Value.Instance,
                                LineJoinMode = Enum.LineJoinMode.Miter,
                                Name = '\0',
                            }):AddToTheme{
                                Color = 'Text Border',
                            }

                            if Slider.Compact then
                                Items.Value:Clean()

                                Items.Value = nil
                                Items.Slider.Instance.Size = UDim2New(1, 0, 0, 10)
                                Items.Text.Instance.Parent = Items.RealSlider.Instance
                                Items.Text.Instance.Position = UDim2New(0, 0, 0, -2)
                                Items.Text.Instance.TextXAlignment = Enum.TextXAlignment.Center
                            end

                            Items.RealSlider:OnHover(function()
                                Items.RealSlider:Tween(nil, {
                                    BackgroundColor3 = Library.Theme['Hovered Element'],
                                })
                                Items.RealSlider:ChangeItemTheme{
                                    BackgroundColor3 = 'Hovered Element',
                                    BorderColor3 = 'Border',
                                }
                            end)
                            Items.RealSlider:OnHoverLeave(function()
                                Items.RealSlider:Tween(nil, {
                                    BackgroundColor3 = Library.Theme.Background,
                                })
                                Items.RealSlider:ChangeItemTheme{
                                    BackgroundColor3 = 'Background',
                                    BorderColor3 = 'Border',
                                }
                            end)
                        end

                        function Slider.Set(self, Value)
                            Slider.Value = MathClamp(Library:Round(Value, Slider.Decimals), Slider.Min, Slider.Max)
                            Library.Flags[Slider.Flag] = Slider.Value

                            if Slider.Compact then
                                Items.Text.Instance.Text = string.format('%s: %s%s', tostring(Slider.Name), tostring(Slider.Value), tostring(Slider.Suffix))
                            else
                                Items.Value.Instance.Text = string.format('%s%s', tostring(Slider.Value), tostring(Slider.Suffix))
                            end

                            Items.Indicator:Tween(TweenInfo.new(0.17, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                                Size = UDim2New((Slider.Value - Slider.Min) / (Slider.Max - Slider.Min), 0, 1, 0),
                            })

                            if Slider.Callback then
                                Library:SafeCall(Slider.Callback, Slider.Value)
                            end
                        end
                        function Slider.Get(self)
                            return Slider.Value
                        end
                        function Slider.SetVisibility(self, Bool)
                            Items.Slider.Instance.Visible = Bool
                        end
                        function Slider.SetMax(self, Number)
                            Slider.Max = Number
                        end
                        function Slider.SetMin(self, Number)
                            Slider.Min = Number
                        end

                        Items.RealSlider:Connect('MouseButton1Down', function()
                            Slider.Sliding = true

                            local MousePos = UserInputService:GetMouseLocation()
                            local SizeX = (MousePos.X - Items.RealSlider.Instance.AbsolutePosition.X) / Items.RealSlider.Instance.AbsoluteSize.X
                            local Value = ((Slider.Max - Slider.Min) * SizeX) + Slider.Min

                            Slider:Set(Value)
                        end)
                        Items.RealSlider:Connect('InputEnded', function(Input)
                            if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                                Slider.Sliding = false
                            end
                        end)
                        Library:Connect(UserInputService.InputChanged, function(Input)
                            if Input.UserInputType == Enum.UserInputType.MouseMovement and Slider.Sliding then
                                local MousePos = UserInputService:GetMouseLocation()
                                local SizeX = (MousePos.X - Items.RealSlider.Instance.AbsolutePosition.X) / Items.RealSlider.Instance.AbsoluteSize.X
                                local Value = ((Slider.Max - Slider.Min) * SizeX) + Slider.Min

                                Slider:Set(Value)
                            end
                        end)

                        if Slider.Default then
                            Slider:Set(Slider.Default)
                        end

                        Library.SetFlags[Slider.Flag] = function(Value)
                            Slider:Set(Value)
                        end

                        return Slider
                    end
                    Library.Sections.Dropdown = function(self, Data)
                        Data = Data or {}

                        local Dropdown, Items = {
                            Window = self.Window,
                            Page = self.Page,
                            Section = self,
                            Name = Data.Name or Data.name or 'Dropdown',
                            Flag = Data.Flag or Data.flag or Library:NextFlag(),
                            Items = Data.Items or Data.items or {
                                'One',
                                'Two',
                                'Three',
                            },
                            Default = Data.Default or Data.default or nil,
                            Callback = Data.Callback or Data.callback or function() end,
                            Multi = Data.Multi or Data.multi or false,
                            Value = {},
                            IsOpen = false,
                            Options = {},
                            Class = 'Dropdown',
                        }, {}

                        do
                            Items.Dropdown = Instances:Create('Frame', {
                                Parent = Dropdown.Section.Elements.Content.Instance,
                                BackgroundTransparency = 1,
                                Name = '\0',
                                BorderColor3 = FromRGB(0, 0, 0),
                                Size = UDim2New(1, 0, 0, 34),
                                BorderSizePixel = 0,
                                BackgroundColor3 = FromRGB(255, 255, 255),
                            })
                            Items.Text = Instances:Create('TextLabel', {
                                Parent = Items.Dropdown.Instance,
                                FontFace = Library.Font,
                                TextColor3 = FromRGB(215, 215, 215),
                                BorderColor3 = FromRGB(0, 0, 0),
                                Text = Dropdown.Name,
                                Name = '\0',
                                BackgroundTransparency = 1,
                                TextXAlignment = Enum.TextXAlignment.Left,
                                Size = UDim2New(1, 0, 0, 13),
                                BorderSizePixel = 0,
                                TextSize = 12,
                                BackgroundColor3 = FromRGB(255, 255, 255),
                            })

                            Items.Text:AddToTheme{
                                TextColor3 = 'Text',
                            }
                            Instances:Create('UIStroke', {
                                Parent = Items.Text.Instance,
                                LineJoinMode = Enum.LineJoinMode.Miter,
                                Name = '\0',
                            }):AddToTheme{
                                Color = 'Text Border',
                            }

                            Items.RealDropdown = Instances:Create('Frame', {
                                Parent = Items.Dropdown.Instance,
                                AnchorPoint = Vector2New(0, 1),
                                Name = '\0',
                                Position = UDim2New(0, 0, 1, 0),
                                BorderColor3 = FromRGB(10, 10, 10),
                                Size = UDim2New(1, 0, 0, 17),
                                BorderSizePixel = 2,
                                BackgroundColor3 = FromRGB(33, 33, 36),
                            })

                            Items.RealDropdown:AddToTheme{
                                BackgroundColor3 = 'Background',
                                BorderColor3 = 'Border',
                            }
                            Instances:Create('UIGradient', {
                                Parent = Items.RealDropdown.Instance,
                                Rotation = 90,
                                Color = RGBSequence{
                                    RGBSequenceKeypoint(0, FromRGB(255, 255, 255)),
                                    RGBSequenceKeypoint(1, FromRGB(100, 100, 100)),
                                },
                            })
                            Instances:Create('UIStroke', {
                                Parent = Items.RealDropdown.Instance,
                                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                                LineJoinMode = Enum.LineJoinMode.Miter,
                                Name = '\0',
                                Color = FromRGB(27, 27, 32),
                            }):AddToTheme{
                                Color = 'Outline',
                            }

                            Items.Open = Instances:Create('TextButton', {
                                Parent = Items.RealDropdown.Instance,
                                FontFace = Library.Font,
                                TextColor3 = FromRGB(215, 215, 215),
                                BorderColor3 = FromRGB(0, 0, 0),
                                Text = '+',
                                AutoButtonColor = false,
                                Name = '\0',
                                Size = UDim2New(1, 0, 1, 0),
                                BackgroundTransparency = 1,
                                TextXAlignment = Enum.TextXAlignment.Right,
                                Position = UDim2New(0, -4, 0, -1),
                                BorderSizePixel = 0,
                                TextSize = 12,
                                BackgroundColor3 = FromRGB(255, 255, 255),
                            })

                            Items.Open:AddToTheme{
                                TextColor3 = 'Text',
                            }
                            Instances:Create('UIStroke', {
                                Parent = Items.Open.Instance,
                                LineJoinMode = Enum.LineJoinMode.Miter,
                                Name = '\0',
                            }):AddToTheme{
                                Color = 'Text Border',
                            }

                            Items.Value = Instances:Create('TextLabel', {
                                Parent = Items.RealDropdown.Instance,
                                FontFace = Library.Font,
                                TextColor3 = FromRGB(215, 215, 215),
                                BorderColor3 = FromRGB(0, 0, 0),
                                Text = '--',
                                Name = '\0',
                                Size = UDim2New(1, -25, 1, 0),
                                BackgroundTransparency = 1,
                                TextXAlignment = Enum.TextXAlignment.Left,
                                TextTruncate = Enum.TextTruncate.AtEnd,
                                Position = UDim2New(0, 5, 0, -1),
                                BorderSizePixel = 0,
                                TextSize = 12,
                                BackgroundColor3 = FromRGB(255, 255, 255),
                            })

                            Items.Value:AddToTheme{
                                TextColor3 = 'Text',
                            }
                            Instances:Create('UIStroke', {
                                Parent = Items.Value.Instance,
                                LineJoinMode = Enum.LineJoinMode.Miter,
                                Name = '\0',
                            }):AddToTheme{
                                Color = 'Text Border',
                            }

                            Items.OptionHolder = Instances:Create('Frame', {
                                Parent = Items.Dropdown.Instance,
                                Visible = false,
                                BorderColor3 = FromRGB(10, 10, 10),
                                Name = '\0',
                                Position = UDim2New(0, 0, 1, 5),
                                Size = UDim2New(1, 0, 0, 0),
                                BorderSizePixel = 2,
                                AutomaticSize = Enum.AutomaticSize.Y,
                                BackgroundColor3 = FromRGB(20, 20, 25),
                            })

                            Items.OptionHolder:AddToTheme{
                                BackgroundColor3 = 'Inline',
                                BorderColor3 = 'Border',
                            }
                            Instances:Create('UIStroke', {
                                Parent = Items.OptionHolder.Instance,
                                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                                LineJoinMode = Enum.LineJoinMode.Miter,
                                Name = '\0',
                                Color = FromRGB(27, 27, 32),
                            }):AddToTheme{
                                Color = 'Outline',
                            }
                            Instances:Create('UIListLayout', {
                                Parent = Items.OptionHolder.Instance,
                                SortOrder = Enum.SortOrder.LayoutOrder,
                            })
                            Instances:Create('UIPadding', {
                                Parent = Items.OptionHolder.Instance,
                                PaddingBottom = UDimNew(0, 2),
                            })
                            Items.RealDropdown:OnHover(function()
                                Items.RealDropdown:Tween(nil, {
                                    BackgroundColor3 = Library.Theme['Hovered Element'],
                                })
                                Items.RealDropdown:ChangeItemTheme{
                                    BackgroundColor3 = 'Hovered Element',
                                    BorderColor3 = 'Border',
                                }
                            end)
                            Items.RealDropdown:OnHoverLeave(function()
                                Items.RealDropdown:Tween(nil, {
                                    BackgroundColor3 = Library.Theme.Background,
                                })
                                Items.RealDropdown:ChangeItemTheme{
                                    BackgroundColor3 = 'Background',
                                    BorderColor3 = 'Border',
                                }
                            end)
                        end

                        function Dropdown.Set(self, Option)
                            if Dropdown.Multi then
                                if type(Option) ~= 'table' then
                                    return
                                end

                                Dropdown.Value = Option

                                for Index, Value in Option do
                                    local OptionData = Dropdown.Options[Value]

                                    if not OptionData then
                                        return
                                    end

                                    OptionData.Selected = true

                                    OptionData:Toggle'Active'
                                end

                                Library.Flags[Dropdown.Flag] = Dropdown.Value
                                Items.Value.Instance.Text = TableConcat(Option, ', ')
                            else
                                if not Dropdown.Options[Option] then
                                    return
                                end

                                local OptionData = Dropdown.Options[Option]

                                Dropdown.Value = OptionData.Name
                                OptionData.Selected = true

                                OptionData:Toggle'Active'

                                for Index, Value in Dropdown.Options do
                                    if Value ~= OptionData then
                                        Value.Selected = false

                                        Value:Toggle'Inactive'
                                    end
                                end

                                Library.Flags[Dropdown.Flag] = Dropdown.Value
                                Items.Value.Instance.Text = Option
                            end
                            if Dropdown.Callback then
                                Library:SafeCall(Dropdown.Callback, Option)
                            end
                        end
                        function Dropdown.Get(self)
                            return Dropdown.Value
                        end
                        function Dropdown.SetVisibility(self, Bool)
                            Items.Dropdown.Instance.Visible = Bool
                        end
                        function Dropdown.Add(self, Option)
                            local OptionButton = Instances:Create('TextButton', {
                                Parent = Items.OptionHolder.Instance,
                                FontFace = Library.Font,
                                TextColor3 = FromRGB(0, 0, 0),
                                BorderColor3 = FromRGB(0, 0, 0),
                                Text = '',
                                AutoButtonColor = false,
                                Name = '\0',
                                BackgroundTransparency = 1,
                                BorderSizePixel = 0,
                                Size = UDim2New(1, 0, 0, 15),
                                ZIndex = 5,
                                TextSize = 14,
                                BackgroundColor3 = FromRGB(255, 255, 255),
                            })
                            local OptionText = Instances:Create('TextLabel', {
                                Parent = OptionButton.Instance,
                                FontFace = Library.Font,
                                TextColor3 = FromRGB(215, 215, 215),
                                TextTransparency = 0.48,
                                Text = Option,
                                Name = '\0',
                                BorderColor3 = FromRGB(0, 0, 0),
                                Size = UDim2New(1, -5, 1, 0),
                                Position = UDim2New(0, 5, 0, 0),
                                BackgroundTransparency = 1,
                                TextXAlignment = Enum.TextXAlignment.Left,
                                BorderSizePixel = 0,
                                ZIndex = 5,
                                TextSize = 12,
                                BackgroundColor3 = FromRGB(255, 255, 255),
                            })

                            OptionText:AddToTheme{
                                TextColor3 = 'Text',
                            }
                            Instances:Create('UIStroke', {
                                Parent = OptionText.Instance,
                                LineJoinMode = Enum.LineJoinMode.Miter,
                                Name = '\0',
                            }):AddToTheme{
                                Color = 'Text Border',
                            }

                            local OptionData = {
                                Selected = false,
                                Name = Option,
                                Text = OptionText,
                                Button = OptionButton,
                            }

                            function OptionData.Toggle(self, State)
                                if State == 'Active' then
                                    OptionData.Text:ChangeItemTheme{
                                        TextColor3 = 'Accent',
                                    }
                                    OptionData.Text:Tween(nil, {
                                        TextColor3 = Library.Theme.Accent,
                                        TextTransparency = 0,
                                    })
                                else
                                    OptionData.Text:ChangeItemTheme{
                                        TextColor3 = 'Text',
                                    }
                                    OptionData.Text:Tween(nil, {
                                        TextColor3 = Library.Theme.Text,
                                        TextTransparency = 0.48,
                                    })
                                end
                            end
                            function OptionData.Set(self)
                                OptionData.Selected = not OptionData.Selected

                                if Dropdown.Multi then
                                    local Index = TableFind(Dropdown.Value, OptionData.Name)

                                    if Index then
                                        TableRemove(Dropdown.Value, Index)
                                    else
                                        TableInsert(Dropdown.Value, OptionData.Name)
                                    end

                                    Library.Flags[Dropdown.Flag] = Dropdown.Value

                                    OptionData:Toggle(Index and 'Inactive' or 'Active')

                                    local TextFormat = #Dropdown.Value > 0 and TableConcat(Dropdown.Value, ', ') or '--'

                                    Items.Value.Instance.Text = TextFormat
                                else
                                    if OptionData.Selected then
                                        Dropdown.Value = OptionData.Name
                                        Library.Flags[Dropdown.Flag] = Dropdown.Value

                                        OptionData:Toggle'Active'

                                        Items.Value.Instance.Text = OptionData.Name

                                        for Index, Value in Dropdown.Options do
                                            if Value ~= OptionData then
                                                Value.Selected = false

                                                Value:Toggle'Inactive'
                                            end
                                        end
                                    else
                                        Dropdown.Value = nil

                                        OptionData:Toggle'Inactive'

                                        Items.Value.Instance.Text = '--'
                                    end
                                end
                                if Dropdown.Callback then
                                    Library:SafeCall(Dropdown.Callback, Dropdown.Value)
                                end
                            end

                            OptionButton:Connect('MouseButton1Down', function()
                                OptionData:Set()
                            end)

                            Dropdown.Options[Option] = OptionData

                            return OptionData
                        end
                        function Dropdown.Remove(self, Option)
                            if Dropdown.Options[Option] then
                                Dropdown.Options[Option].Button:Clean()
                            end
                        end
                        function Dropdown.Refresh(self, List)
                            for Index, Value in Dropdown.Options do
                                Dropdown:Remove(Value.Name)
                            end
                            for Index, Value in List do
                                Dropdown:Add(Value)
                            end
                        end

                        local Debounce = false

                        function Dropdown.SetOpen(self, Bool)
                            if Debounce then
                                return
                            end

                            Dropdown.IsOpen = Bool
                            Debounce = true

                            if Bool then
                                Items.OptionHolder.Instance.Visible = true
                                Items.OptionHolder.Instance.ZIndex = 15
                                Items.Open.Instance.Text = '-'
                                Items.Open.Instance.Position = UDim2New(0, -5, 0, -1)
                            else
                                Items.Open.Instance.Text = '+'
                                Items.Open.Instance.Position = UDim2New(0, -4, 0, -1)
                            end

                            local Descendants = Items.OptionHolder.Instance:GetDescendants()

                            TableInsert(Descendants, Items.OptionHolder.Instance)

                            local NewTween

                            for Index, Value in Descendants do
                                local __DARKLUA_CONTINUE_41 = false

                                repeat
                                    local ValueIndex = Library:GetTransparencyPropertyFromItem(Value)

                                    if not ValueIndex then
                                        __DARKLUA_CONTINUE_41 = true

                                        break
                                    end
                                    if not StringFind(Value.ClassName, 'UI') then
                                        Value.ZIndex = Bool and 15 or 1
                                    end
                                    if type(ValueIndex) == 'table' then
                                        for _, Property in ValueIndex do
                                            NewTween = Library:FadeItem(Value, Property, Bool, Dropdown.Window.FadeSpeed)
                                        end
                                    else
                                        NewTween = Library:FadeItem(Value, ValueIndex, Bool, Dropdown.Window.FadeSpeed)
                                    end

                                    __DARKLUA_CONTINUE_41 = true
                                until true

                                if not __DARKLUA_CONTINUE_41 then
                                    break
                                end
                            end

                            Library:Connect(NewTween.Tween.Completed, function()
                                Debounce = false
                                Items.OptionHolder.Instance.Visible = Bool
                                Items.OptionHolder.Instance.ZIndex = Bool and 15 or 1
                            end)
                        end

                        for Index, Value in Dropdown.Items do
                            Dropdown:Add(Value)
                        end

                        Items.Open:Connect('MouseButton1Down', function()
                            Dropdown:SetOpen(not Dropdown.IsOpen)
                        end)

                        if Dropdown.Default then
                            Dropdown:Set(Dropdown.Default)
                        end

                        Library.SetFlags[Dropdown.Flag] = function(Value)
                            Dropdown:Set(Value)
                        end

                        return Dropdown
                    end
                    Library.Sections.Label = function(self, Data)
                        Data = Data or {}

                        local Label, Items = {
                            Window = self.Window,
                            Page = self.Page,
                            Section = self,
                            Name = Data.Name or Data.name,
                            Alignment = Data.Alignment or Data.alignment or 'Left',
                            Count = 0,
                        }, {}

                        do
                            Items.Label = Instances:Create('Frame', {
                                Parent = Label.Section.Elements.Content.Instance,
                                BackgroundTransparency = 1,
                                Name = '\0',
                                BorderColor3 = FromRGB(0, 0, 0),
                                Size = UDim2New(1, 0, 0, 15),
                                BorderSizePixel = 0,
                                BackgroundColor3 = FromRGB(255, 255, 255),
                            })
                            Items.Text = Instances:Create('TextLabel', {
                                Parent = Items.Label.Instance,
                                FontFace = Library.Font,
                                TextColor3 = FromRGB(215, 215, 215),
                                BorderColor3 = FromRGB(0, 0, 0),
                                Text = Label.Name,
                                Name = '\0',
                                BackgroundTransparency = 1,
                                TextXAlignment = Enum.TextXAlignment[Label.Alignment],
                                Size = UDim2New(1, 0, 1, 0),
                                BorderSizePixel = 0,
                                TextSize = 12,
                                BackgroundColor3 = FromRGB(255, 255, 255),
                            })

                            Items.Text:AddToTheme{
                                TextColor3 = 'Text',
                            }
                            Instances:Create('UIStroke', {
                                ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual,
                                Parent = Items.Text.Instance,
                                LineJoinMode = Enum.LineJoinMode.Miter,
                            }):AddToTheme{
                                Color = 'Text Border',
                            }
                        end

                        function Label.Colorpicker(self, Data)
                            Data = Data or {}

                            local Colorpicker = {
                                Window = self.Window,
                                Tab = self.Tab,
                                Section = self.Section,
                                Parent = Items.Label,
                                Name = Data.Name or Data.name or 'Colorpicker',
                                Flag = Data.Flag or Data.flag or Library:NextFlag(),
                                Default = Data.Default or Data.default or Color3.fromRGB(255, 255, 255),
                                Callback = Data.Callback or Data.callback or function() end,
                                Alpha = Data.Alpha or Data.alpha or false,
                                Count = Label.Count,
                                FadeSpeed = self.Window.FadeSpeed,
                            }

                            Label.Count = Label.Count + 1
                            Colorpicker.Count = Label.Count

                            local Extension = Library:CreateColorpicker(Colorpicker)

                            return Colorpicker, Extension
                        end
                        function Label.Keybind(self, Data)
                            Data = Data or {}

                            local Keybind = {
                                Window = self.Window,
                                Tab = self.Tab,
                                Section = self.Section,
                                Parent = Items.Label,
                                Name = Data.Name or Data.name or 'Keybind',
                                Flag = Data.Flag or Data.flag or Library:NextFlag(),
                                Default = Data.Default or Data.default or 'None',
                                Mode = Data.Mode or Data.mode or 'Toggle',
                                Callback = Data.Callback or Data.callback or function() end,
                            }
                            local Extension = Library:CreateKeybind(Keybind)

                            return Keybind, Extension
                        end

                        return Label
                    end
                    Library.Sections.Textbox = function(self, Data)
                        Data = Data or {}

                        local Textbox, Items = {
                            Window = self.Window,
                            Tab = self.Tab,
                            Section = self,
                            Name = Data.Name or Data.name or 'Textbox',
                            Flag = Data.Flag or Data.flag or Library:NextFlag(),
                            Placeholder = Data.Placeholder or Data.placeholder or '...',
                            Default = Data.Default or Data.default or '',
                            Callback = Data.Callback or Data.callback or function() end,
                            Value = '',
                            Class = 'Textbox',
                        }, {}

                        do
                            Items.Textbox = Instances:Create('Frame', {
                                Parent = Textbox.Section.Elements.Content.Instance,
                                BackgroundTransparency = 1,
                                Name = '\0',
                                BorderColor3 = FromRGB(0, 0, 0),
                                Size = UDim2New(1, 0, 0, 34),
                                BorderSizePixel = 0,
                                BackgroundColor3 = FromRGB(255, 255, 255),
                            })
                            Items.Text = Instances:Create('TextLabel', {
                                Parent = Items.Textbox.Instance,
                                FontFace = Library.Font,
                                TextColor3 = FromRGB(215, 215, 215),
                                BorderColor3 = FromRGB(0, 0, 0),
                                Text = Textbox.Name,
                                Name = '\0',
                                BackgroundTransparency = 1,
                                TextXAlignment = Enum.TextXAlignment.Left,
                                Size = UDim2New(1, 0, 0, 13),
                                BorderSizePixel = 0,
                                TextSize = 12,
                                BackgroundColor3 = FromRGB(255, 255, 255),
                            })

                            Items.Text:AddToTheme{
                                TextColor3 = 'Text',
                            }
                            Instances:Create('UIStroke', {
                                Parent = Items.Text.Instance,
                                LineJoinMode = Enum.LineJoinMode.Miter,
                                Name = '\0',
                            }):AddToTheme{
                                Color = 'Text Border',
                            }

                            Items.Background = Instances:Create('Frame', {
                                Parent = Items.Textbox.Instance,
                                AnchorPoint = Vector2New(0, 1),
                                Name = '\0',
                                Position = UDim2New(0, 0, 1, 0),
                                BorderColor3 = FromRGB(10, 10, 10),
                                Size = UDim2New(1, 0, 0, 17),
                                BorderSizePixel = 2,
                                BackgroundColor3 = FromRGB(33, 33, 36),
                            })

                            Items.Background:AddToTheme{
                                BackgroundColor3 = 'Element',
                                BorderColor3 = 'Border',
                            }
                            Instances:Create('UIGradient', {
                                Parent = Items.Background.Instance,
                                Rotation = 90,
                                Color = RGBSequence{
                                    RGBSequenceKeypoint(0, FromRGB(255, 255, 255)),
                                    RGBSequenceKeypoint(1, FromRGB(100, 100, 100)),
                                },
                            })
                            Instances:Create('UIStroke', {
                                Parent = Items.Background.Instance,
                                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                                LineJoinMode = Enum.LineJoinMode.Miter,
                                Name = '\0',
                                Color = FromRGB(27, 27, 32),
                            }):AddToTheme{
                                Color = 'Outline',
                            }

                            Items.Inline = Instances:Create('TextBox', {
                                Parent = Items.Background.Instance,
                                FontFace = Library.Font,
                                TextColor3 = FromRGB(215, 215, 215),
                                BorderColor3 = FromRGB(0, 0, 0),
                                Text = '',
                                Name = '\0',
                                Size = UDim2New(1, 0, 1, 0),
                                BorderSizePixel = 0,
                                ClearTextOnFocus = false,
                                BackgroundTransparency = 1,
                                PlaceholderColor3 = FromRGB(178, 178, 178),
                                TextXAlignment = Enum.TextXAlignment.Left,
                                PlaceholderText = Textbox.Placeholder,
                                TextSize = 12,
                                BackgroundColor3 = FromRGB(255, 255, 255),
                            })

                            Items.Inline:AddToTheme{
                                TextColor3 = 'Text',
                            }
                            Instances:Create('UIPadding', {
                                Parent = Items.Inline.Instance,
                                PaddingBottom = UDimNew(0, 3),
                                PaddingLeft = UDimNew(0, 5),
                            })
                            Instances:Create('UIStroke', {
                                Parent = Items.Inline.Instance,
                                LineJoinMode = Enum.LineJoinMode.Miter,
                                Name = '\0',
                            }):AddToTheme{
                                Color = 'Text Border',
                            }
                            Items.Background:OnHover(function()
                                Items.Background:Tween(nil, {
                                    BackgroundColor3 = Library.Theme['Hovered Element'],
                                })
                                Items.Background:ChangeItemTheme{
                                    BackgroundColor3 = 'Hovered Element',
                                    BorderColor3 = 'Border',
                                }
                            end)
                            Items.Background:OnHoverLeave(function()
                                Items.Background:Tween(nil, {
                                    BackgroundColor3 = Library.Theme.Element,
                                })
                                Items.Background:ChangeItemTheme{
                                    BackgroundColor3 = 'Element',
                                    BorderColor3 = 'Border',
                                }
                            end)
                        end

                        function Textbox.Get(self)
                            return Textbox.Value
                        end
                        function Textbox.SetVisibility(self, Bool)
                            Items.Textbox.Instance.Visible = Bool
                        end
                        function Textbox.Set(self, Value)
                            Textbox.Value = Value
                            Items.Inline.Instance.Text = Textbox.Value

                            Items.Inline:Tween(nil, {
                                TextColor3 = Library.Theme.Text,
                            })
                            Items.Inline:ChangeItemTheme{
                                TextColor3 = 'Text',
                            }

                            Library.Flags[Textbox.Flag] = Textbox.Value

                            if Textbox.Callback then
                                Library:SafeCall(Textbox.Callback, Textbox.Value)
                            end
                        end

                        Items.Inline:Connect('Focused', function()
                            Items.Inline:ChangeItemTheme{
                                TextColor3 = 'Accent',
                            }
                            Items.Inline:Tween(nil, {
                                TextColor3 = Library.Theme.Accent,
                            })
                        end)
                        Items.Inline:Connect('FocusLost', function()
                            Items.Inline:ChangeItemTheme{
                                TextColor3 = 'Text',
                            }
                            Items.Inline:Tween(nil, {
                                TextColor3 = Library.Theme.Text,
                            })
                            Textbox:Set(Items.Inline.Instance.Text)
                        end)

                        if Textbox.Default then
                            Textbox:Set(Textbox.Default)
                        end

                        Library.SetFlags[Textbox.Flag] = function(Value)
                            Textbox:Set(Value)
                        end

                        return Textbox
                    end
                    Library.Sections.Listbox = function(self, Data)
                        Data = Data or {}

                        local Listbox, Items = {
                            Window = self.Window,
                            Page = self.Page,
                            Section = self,
                            Items = Data.Items or Data.items or {},
                            Multi = Data.Multi or Data.multi or false,
                            Default = Data.Default or Data.default or 1,
                            Flag = Data.Flag or Data.flag or Library:NextFlag(),
                            Callback = Data.Callback or Data.callback or function() end,
                            Size = Data.Size or Data.size or 175,
                            Value = {},
                            Options = {},
                            Class = 'Listbox',
                        }, {}

                        do
                            Items.Listbox = Instances:Create('Frame', {
                                Parent = Listbox.Section.Elements.Content.Instance,
                                Name = '\0',
                                BackgroundTransparency = 1,
                                Size = UDim2New(1, 0, 0, Listbox.Size),
                                BorderColor3 = FromRGB(0, 0, 0),
                                BorderSizePixel = 0,
                                AutomaticSize = Enum.AutomaticSize.Y,
                                BackgroundColor3 = FromRGB(255, 255, 255),
                            })
                            Items.RealListbox = Instances:Create('ScrollingFrame', {
                                Parent = Items.Listbox.Instance,
                                ScrollBarImageColor3 = FromRGB(235, 157, 255),
                                Active = true,
                                AutomaticCanvasSize = Enum.AutomaticSize.Y,
                                ScrollBarThickness = 1,
                                AnchorPoint = Vector2New(0, 1),
                                Size = UDim2New(1, 0, 1, 0),
                                Name = '\0',
                                Position = UDim2New(0, 0, 1, 0),
                                BackgroundColor3 = FromRGB(15, 15, 20),
                                BorderColor3 = FromRGB(10, 10, 10),
                                BorderSizePixel = 2,
                                CanvasSize = UDim2New(0, 0, 0, 0),
                            })

                            Items.RealListbox:AddToTheme{
                                ScrollBarImageColor3 = 'Accent',
                                BackgroundColor3 = 'Background',
                                BorderColor3 = 'Border',
                            }
                            Instances:Create('UIStroke', {
                                Parent = Items.RealListbox.Instance,
                                Color = FromRGB(27, 27, 32),
                                Name = '\0',
                                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                            }):AddToTheme{
                                Color = 'Outline',
                            }
                            Instances:Create('UIListLayout', {
                                Parent = Items.RealListbox.Instance,
                                SortOrder = Enum.SortOrder.LayoutOrder,
                            })
                            Instances:Create('UIPadding', {
                                Parent = Items.RealListbox.Instance,
                                PaddingBottom = UDimNew(0, 5),
                                PaddingTop = UDimNew(0, 2),
                            })
                        end

                        function Listbox.Set(self, Option)
                            if Listbox.Multi then
                                if type(Option) ~= 'table' then
                                    return
                                end

                                Listbox.Value = Option
                                Library.Flags[Listbox.Flag] = Listbox.Value

                                for Index, Value in Option do
                                    local OptionData = Listbox.Options[Value]

                                    if not OptionData then
                                        return
                                    end

                                    OptionData.Selected = true

                                    OptionData:Toggle'Active'
                                end
                            else
                                if not Listbox.Options[Option] then
                                    return
                                end

                                local OptionData = Listbox.Options[Option]

                                Listbox.Value = OptionData.Name
                                Library.Flags[Listbox.Flag] = Listbox.Value
                                OptionData.Selected = true

                                OptionData:Toggle'Active'

                                for Index, Value in Listbox.Options do
                                    if Value ~= OptionData then
                                        Value.Selected = false

                                        Value:Toggle'Inactive'
                                    end
                                end
                            end
                            if Listbox.Callback then
                                Library:SafeCall(Listbox.Callback, Option)
                            end
                        end
                        function Listbox.Get(self)
                            return Listbox.Value
                        end
                        function Listbox.SetVisibility(self, Bool)
                            Items.Listbox.Instance.Visible = Bool
                        end
                        function Listbox.Remove(self, Option)
                            if Listbox.Options[Option] then
                                Listbox.Options[Option].Button:Clean()
                            end
                        end
                        function Listbox.Refresh(self, List)
                            for Index, Value in Listbox.Options do
                                Listbox:Remove(Value.Name)
                            end
                            for Index, Value in List do
                                Listbox:Add(Value)
                            end
                        end
                        function Listbox.Add(self, Option)
                            local OptionButton = Instances:Create('TextButton', {
                                Parent = Items.RealListbox.Instance,
                                FontFace = Library.Font,
                                TextColor3 = FromRGB(0, 0, 0),
                                BorderColor3 = FromRGB(0, 0, 0),
                                Text = '',
                                AutoButtonColor = false,
                                Name = '\0',
                                BackgroundTransparency = 1,
                                BorderSizePixel = 0,
                                Size = UDim2New(1, 0, 0, 15),
                                ZIndex = 5,
                                TextSize = 14,
                                BackgroundColor3 = FromRGB(255, 255, 255),
                            })
                            local OptionText = Instances:Create('TextLabel', {
                                Parent = OptionButton.Instance,
                                FontFace = Library.Font,
                                TextColor3 = FromRGB(215, 215, 215),
                                TextTransparency = 0.48,
                                Text = Option,
                                Name = '\0',
                                BorderColor3 = FromRGB(0, 0, 0),
                                Size = UDim2New(1, -5, 1, 0),
                                Position = UDim2New(0, 5, 0, 0),
                                BackgroundTransparency = 1,
                                TextXAlignment = Enum.TextXAlignment.Center,
                                BorderSizePixel = 0,
                                ZIndex = 5,
                                TextSize = 12,
                                BackgroundColor3 = FromRGB(255, 255, 255),
                            })

                            OptionText:AddToTheme{
                                TextColor3 = 'Text',
                            }
                            Instances:Create('UIStroke', {
                                Parent = OptionText.Instance,
                                LineJoinMode = Enum.LineJoinMode.Miter,
                                Name = '\0',
                            }):AddToTheme{
                                Color = 'Text Border',
                            }

                            local OptionData = {
                                Selected = false,
                                Name = Option,
                                Text = OptionText,
                                Button = OptionButton,
                            }

                            function OptionData.Toggle(self, State)
                                if State == 'Active' then
                                    OptionData.Text:ChangeItemTheme{
                                        TextColor3 = 'Accent',
                                    }
                                    OptionData.Text:Tween(nil, {
                                        TextColor3 = Library.Theme.Accent,
                                        TextTransparency = 0,
                                    })
                                else
                                    OptionData.Text:ChangeItemTheme{
                                        TextColor3 = 'Text',
                                    }
                                    OptionData.Text:Tween(nil, {
                                        TextColor3 = Library.Theme.Text,
                                        TextTransparency = 0.48,
                                    })
                                end
                            end
                            function OptionData.Set(self)
                                OptionData.Selected = not OptionData.Selected

                                if Listbox.Multi then
                                    local Index = TableFind(Listbox.Value, OptionData.Name)

                                    if Index then
                                        TableRemove(Listbox.Value, Index)
                                    else
                                        TableInsert(Listbox.Value, OptionData.Name)
                                    end

                                    OptionData:Toggle(Index and 'Inactive' or 'Active')

                                    local _ = #Listbox.Value > 0 and TableConcat(Listbox.Value, ', ') or '--'
                                else
                                    if OptionData.Selected then
                                        Listbox.Value = OptionData.Name

                                        OptionData:Toggle'Active'

                                        for Index, Value in Listbox.Options do
                                            if Value ~= OptionData then
                                                Value.Selected = false

                                                Value:Toggle'Inactive'
                                            end
                                        end
                                    else
                                        Listbox.Value = nil

                                        OptionData:Toggle'Inactive'
                                    end
                                end
                                if Listbox.Callback then
                                    Library:SafeCall(Listbox.Callback, Listbox.Value)
                                end
                            end

                            OptionButton:Connect('MouseButton1Down', function()
                                OptionData:Set()
                            end)

                            Listbox.Options[Option] = OptionData

                            return OptionData
                        end

                        for Index, Value in Listbox.Items do
                            Listbox:Add(Value)
                        end

                        if Listbox.Default then
                            Listbox:Set(Listbox.Default)
                        end

                        Library.SetFlags[Listbox.Flag] = function(Value)
                            Listbox:Set(Value)
                        end

                        return Listbox
                    end
                end
            end)()

            getgenv().Library = Library

            return Library
        end

        function init.a()
            local v = init.cache.a

            if not v then
                v = {
                    c = __modImpl(),
                }
                init.cache.a = v
            end

            return v.c
        end
    end
    do
        local __modImpl = function()
            local Modules = getloadedmodules()

            LPH_NO_VIRTUALIZE(function()
                local RenamedModules = {
                    'WeaponsClient',
                    'WeaponsProjectilesClient',
                    'WeaponsCannonClient',
                    'WeaponsTargetsClient',
                    'WeaponsToolbarClient',
                    'WeaponsSoundsClient',
                    'WeaponsCharacterClient',
                    'WeaponsFlagClient',
                    'WeaponsDamageClient',
                    'WeaponsEffectsClient',
                    'WeaponsToolbarClientOLD',
                    'CombatClient',
                    'CombatMouseClient',
                    'CombatScreenEffectsClient',
                    'CombatTiltsClient',
                    'CombatScreenFlashClient',
                    'CombatKillfeedClient',
                    'CombatCompassGuiClient',
                    'CombatFovClient',
                    'CombatMoraleClient',
                    'CombatStatesClient',
                    'CombatMeleeClient',
                    'CombatCharacterClient',
                    'CombatGuisClient',
                    'CombatMovementClient',
                    'UtilityIncidentsClient',
                    'UtilityReportsClient',
                    'AfterAllScatterClient',
                    'MeleeActionClient',
                    'Trick2',
                }
                local NameToIndex = (function()
                    local t = {}

                    for i, n in next, RenamedModules do
                        t[n] = i
                    end

                    return t
                end)()

                function Modules.DecryptModuleName(self, ModuleName, OriginalName)
                    local index = NameToIndex[OriginalName]

                    if not index or type(ModuleName) ~= 'string' or not ModuleName:match'^%d+$' then
                        return false
                    end

                    for key = 10, 99 do
                        if ModuleName == tostring(key) .. tostring(index + key) then
                            return true
                        end
                    end

                    return false
                end
                function Modules.find(self, name, required)
                    for _, module in next, self do
                        if typeof(module) == 'Instance' then
                            if module.Name == name or module.ClassName == name then
                                return required and require(module) or module
                            end
                            if self:DecryptModuleName(module.Name, name) then
                                return required and require(module) or module
                            end
                        end
                    end

                    warn("no module of the name '" .. name .. "' found")

                    return nil
                end
            end)()

            return Modules
        end

        function init.b()
            local v = init.cache.b

            if not v then
                v = {
                    c = __modImpl(),
                }
                init.cache.b = v
            end

            return v.c
        end
    end
    do
        local __modImpl = function()
            local Services = {}

            for _, Service in next, {
                'Players',
                'RunService',
                'UserInputService',
                'CoreGui',
                'TweenService',
                'Debris',
            }do
                Services[Service] = cloneref(game:GetService(Service))
            end

            return Services
        end

        function init.c()
            local v = init.cache.c

            if not v then
                v = {
                    c = __modImpl(),
                }
                init.cache.c = v
            end

            return v.c
        end
    end
    do
        local __modImpl = function()
            local Services = init.c()
            local Classes = {
                Camera = workspace.CurrentCamera,
                LocalPlayer = Services.Players.LocalPlayer,
            }

            return Classes
        end

        function init.d()
            local v = init.cache.d

            if not v then
                v = {
                    c = __modImpl(),
                }
                init.cache.d = v
            end

            return v.c
        end
    end
    do
        local __modImpl = function()
            return {
                Modules = init.b(),
                Classes = init.d(),
                Services = init.c(),
            }
        end

        function init.e()
            local v = init.cache.e

            if not v then
                v = {
                    c = __modImpl(),
                }
                init.cache.e = v
            end

            return v.c
        end
    end
    do
        local __modImpl = function()
            local ExpectedArguments = {
                ArrivalCode = {
                    usePlayerModel = true,
                    expectedArgs = 2,
                },
                ReceiveInvites = {
                    clientDisabled = true,
                    expectedArgs = nil,
                },
                RehosterReport = {expectedArgs = nil},
                SetTilt = {
                    usePlayerModel = true,
                    expectedArgs = 3,
                },
                Chant = {
                    usePlayerModel = true,
                    expectedArgs = 2,
                },
                RegisterDeath = {
                    usePlayerModel = true,
                    expectedArgs = 2,
                },
                Killfeed = {
                    clientDisabled = true,
                    expectedArgs = nil,
                },
                CombatSpyVictim = {
                    clientDisabled = true,
                    expectedArgs = nil,
                },
                CombatSpyObserver = {
                    clientDisabled = true,
                    expectedArgs = nil,
                },
                SetCompanyAccess = {
                    usePlayerModel = true,
                    expectedArgs = 3,
                },
                SetCompanyCap = {
                    usePlayerModel = true,
                    expectedArgs = 3,
                },
                CreateCompany = {
                    usePlayerModel = true,
                    expectedArgs = 6,
                },
                DisbandCompany = {
                    usePlayerModel = true,
                    expectedArgs = 1,
                },
                SetCompanyMarker = {
                    usePlayerModel = true,
                    expectedArgs = 2,
                },
                PaintToCompany = {
                    usePlayerModel = true,
                    expectedArgs = 2,
                },
                EditCompany = {
                    usePlayerModel = true,
                    expectedArgs = 6,
                },
                CompanyToSpawn = {
                    usePlayerModel = true,
                    expectedArgs = 1,
                },
                TeamCompany = {
                    usePlayerModel = true,
                    expectedArgs = 1,
                },
                CreateCompanyFlag = {
                    usePlayerModel = true,
                    expectedArgs = 3,
                },
                RecoverCompanySpawn = {
                    usePlayerModel = true,
                    expectedArgs = 1,
                },
                CreateCompanyCannon = {
                    usePlayerModel = true,
                    expectedArgs = 1,
                },
                RemoveCompanyCannon = {
                    usePlayerModel = true,
                    expectedArgs = 2,
                },
                ReportMorale = {
                    usePlayerModel = true,
                    expectedArgs = 2,
                },
                PingDrawLine = {
                    usePlayerModel = true,
                    ignoreRateLimit = true,
                    expectedArgs = 5,
                },
                PingPlayer = {
                    usePlayerModel = true,
                    ignoreRateLimit = true,
                    expectedArgs = 2,
                },
                PingPosition = {
                    usePlayerModel = true,
                    ignoreRateLimit = true,
                    expectedArgs = 2,
                },
                MovePilotCannon = {
                    usePlayerModel = true,
                    expectedArgs = 3,
                },
                EquipCannonBox = {
                    usePlayerModel = true,
                    expectedArgs = 3,
                },
                EquipCannonWeapon = {
                    usePlayerModel = true,
                    expectedArgs = 3,
                },
                EquipCannonShot = {
                    usePlayerModel = true,
                    expectedArgs = 3,
                },
                ElevateCannon = {
                    usePlayerModel = true,
                    expectedArgs = 2,
                },
                SetElevation = {expectedArgs = 4},
                OperateCannon = {
                    usePlayerModel = true,
                    expectedArgs = 3,
                },
                SpikeCannon = {expectedArgs = 2},
                CannonPilotControl = {
                    usePlayerModel = true,
                    expectedArgs = nil,
                },
                StartOutroCinematic = {
                    requiredPermission = 3,
                    expectedArgs = nil,
                },
                StartPreload = {
                    clientDisabled = true,
                    expectedArgs = nil,
                },
                StartRound = {
                    requiredPermission = 3,
                    expectedArgs = nil,
                },
                CancelRound = {
                    requiredPermission = 3,
                    expectedArgs = nil,
                },
                StartOutro = {
                    requiredPermission = 3,
                    expectedArgs = nil,
                },
                SetScore = {
                    requiredPermission = 3,
                    expectedArgs = nil,
                },
                SwitchGame = {
                    requiredPermission = 3,
                    expectedArgs = nil,
                },
                SwitchPreset = {
                    requiredPermission = 3,
                    expectedArgs = nil,
                },
                SetClock = {
                    requiredPermission = 3,
                    expectedArgs = nil,
                },
                ChangeGameRules = {
                    requiredPermission = 3,
                    expectedArgs = nil,
                },
                DeclareWinner = {
                    clientDisabled = true,
                    expectedArgs = nil,
                },
                CompanyNotification = {
                    clientDisabled = true,
                    expectedArgs = nil,
                },
                Broadcast = {
                    clientDisabled = true,
                    expectedArgs = nil,
                },
                Notification = {
                    clientDisabled = true,
                    expectedArgs = nil,
                },
                PlayerNotification = {
                    clientDisabled = true,
                    expectedArgs = nil,
                },
                AdminActionNotification = {
                    clientDisabled = true,
                    expectedArgs = nil,
                },
                VariableNotification = {
                    clientDisabled = true,
                    expectedArgs = nil,
                },
                BlastNotification = {
                    clientDisabled = true,
                    expectedArgs = nil,
                },
                ToggleInteract = {expectedArgs = 3},
                TeamAndSpawnCompany = {
                    usePlayerModel = true,
                    requiredPermission = 4,
                    expectedArgs = 2,
                },
                ChangePlayerPermission = {
                    usePlayerModel = true,
                    requiredPermission = 2,
                    expectedArgs = 3,
                },
                ChangePlayerCompany = {
                    usePlayerModel = true,
                    requiredPermission = 1,
                    expectedArgs = 3,
                },
                MovePlayerServer = {
                    usePlayerModel = true,
                    requiredPermission = 3,
                    expectedArgs = 6,
                },
                MoveCompanyServer = {
                    usePlayerModel = true,
                    requiredPermission = 4,
                    expectedArgs = 4,
                },
                ChangeHatAttribute = {
                    usePlayerModel = true,
                    expectedArgs = 3,
                },
                ChangeLoadout = {
                    usePlayerModel = true,
                    requiredPermission = 1,
                    expectedArgs = 3,
                },
                ChangeFanion = {
                    usePlayerModel = true,
                    requiredPermission = 1,
                    expectedArgs = 3,
                },
                ChangeUniform = {
                    usePlayerModel = true,
                    expectedArgs = 2,
                },
                ChangeBackpackEnabled = {
                    usePlayerModel = true,
                    expectedArgs = 2,
                },
                LiftLiftable = {expectedArgs = 2},
                DamageTree = {
                    clientDisabled = true,
                    expectedArgs = nil,
                },
                BuildConstruct = {
                    clientDisabled = true,
                    expectedArgs = nil,
                },
                ChangeAppearance = {
                    usePlayerModel = true,
                    expectedArgs = nil,
                },
                ChangeOutfit = {expectedArgs = 2},
                PublicJoinCompany = {
                    usePlayerModel = true,
                    expectedArgs = 2,
                },
                ChangeTeam = {expectedArgs = 2},
                EnterBoardGame = {expectedArgs = 4},
                PlayBoardGame = {expectedArgs = 4},
                KillToSwitchTeams = {expectedArgs = 1},
                PublicRespawn = {expectedArgs = 1},
                Pilot = {expectedArgs = 1},
                ChangeServerTeamName = {
                    requiredPermission = 4,
                    expectedArgs = 3,
                },
                ChangeTeamAppearance = {
                    requiredPermission = 4,
                    expectedArgs = 4,
                },
                ChangeTeamNation = {
                    requiredPermission = 4,
                    expectedArgs = 3,
                },
                ChangeTeamUseSecondary = {
                    requiredPermission = 4,
                    expectedArgs = 3,
                },
                SetVisitorsState = {
                    requiredPermission = 4,
                    expectedArgs = 3,
                },
                ChangeFrequency = {
                    requiredPermission = 4,
                    expectedArgs = 2,
                },
                SetControl = {
                    requiredPermission = 4,
                    expectedArgs = 2,
                },
                SelfReport = {
                    ignoreRateLimit = true,
                    expectedArgs = nil,
                    clientDisabled = true,
                },
                DealShot = {
                    usePlayerModel = true,
                    expectedArgs = 3,
                },
                DealShotToHorse = {
                    usePlayerModel = true,
                    expectedArgs = 3,
                },
                DealMelee = {
                    usePlayerModel = true,
                    expectedArgs = 3,
                },
                DealMeleeCritical = {
                    usePlayerModel = true,
                    expectedArgs = nil,
                },
                DealMeleeToHorse = {
                    usePlayerModel = true,
                    expectedArgs = 3,
                },
                DealCannonShot = {
                    usePlayerModel = true,
                    expectedArgs = 3,
                },
                Equip = {
                    usePlayerModel = true,
                    expectedArgs = 2,
                },
                EquipFlag = {
                    usePlayerModel = true,
                    expectedArgs = 2,
                },
                EjectFlagHolder = {
                    usePlayerModel = true,
                    requiredPermission = 1,
                    expectedArgs = 1,
                },
                ChangeFlagPosition = {expectedArgs = 2},
                FireProjectile = {
                    usePlayerModel = true,
                    expectedArgs = nil,
                },
                FireCannon = {
                    clientDisabled = true,
                    expectedArgs = nil,
                },
                CreateTarget = {
                    ignoreRateLimit = true,
                    expectedArgs = 2,
                },
                ClearMyTargets = {expectedArgs = 1},
                HitTarget = {
                    usePlayerModel = true,
                    expectedArgs = 3,
                },
                ToggleBayonet = {
                    usePlayerModel = true,
                    expectedArgs = 2,
                },
                PlaySound = {expectedArgs = 3},
                PilotHorse = {
                    usePlayerModel = true,
                    expectedArgs = 2,
                },
                ReceiveTheatre = {
                    usePlayerModel = true,
                    expectedArgs = nil,
                },
                PlayInstrument = {expectedArgs = nil},
            }

            return ExpectedArguments
        end

        function init.f()
            local v = init.cache.f

            if not v then
                v = {
                    c = __modImpl(),
                }
                init.cache.f = v
            end

            return v.c
        end
    end
    do
        local __modImpl = function()
            local Shared, ExpectedArguments, Networking = init.e(), init.f(), {
                HookedOutgoingEvents = {},
                Blacklist = {
                    'SelfReport',
                },
            }
            local NetworkClient, NetworkEvents = Shared.Modules:find('NetworkClient', true), Shared.Modules:find('NetworkEvents', true)
            local FireToServer = (function()
                local upvalue = debug.getupvalue(NetworkClient.getEvent, 5)

                if typeof(upvalue) ~= 'table' then
                    return nil
                end

                for _, v in next, upvalue do
                    return v
                end

                return nil
            end)()

            assert(typeof(FireToServer) == 'function', [[Failed to get FireToServer, report this error to the developer]])

            local OldFireToServer

            OldFireToServer = hookfunction(FireToServer, LPH_NO_UPVALUES(function(event, ...)
                if table.find(Networking.Blacklist, event.eventName) then
                    print('Prevented event from firing: -> ', event.eventName, '\nArguments: ->', unpack{...}, '\n', debug.traceback())

                    return nil
                end

                local callback = Networking.HookedOutgoingEvents[event.eventName]

                if callback then
                    local result = callback(...)

                    if result == false then
                        return nil
                    end
                    if typeof(result) == 'table' then
                        return OldFireToServer(event, table.unpack(result))
                    end
                end

                return OldFireToServer(event, ...)
            end))

            function Networking.AddBlacklist(self, eventName)
                if typeof(eventName) ~= 'string' then
                    warn'Networking:AddBlacklist: eventName must be a string'

                    return
                end
                if table.find(Networking.Blacklist, eventName) then
                    warn('Networking:AddBlacklist: event already blacklisted ->', eventName)

                    return
                end

                table.insert(Networking.Blacklist, eventName)
            end
            function Networking.RemoveBlacklist(self, eventName)
                if typeof(eventName) ~= 'string' then
                    warn'Networking:RemoveBlacklist: eventName must be a string'

                    return
                end

                local index = table.find(Networking.Blacklist, eventName)

                if not index then
                    warn('Networking:RemoveBlacklist: event not found ->', eventName)

                    return
                end

                table.remove(Networking.Blacklist, index)
            end
            function Networking.FireEvent(self, eventName, ...)
                local arguments = {...}

                if typeof(eventName) ~= 'string' then
                    warn('Networking:FireEvent: Argument #1 expects a string, but a:', typeof(eventName), 'was passed')

                    return
                end

                local info = NetworkEvents.getEventInfo(eventName)

                if not info then
                    warn('Networking:FireEvent: No event of the name:', eventName, 'was found')

                    return
                end

                local clientDisabled = ExpectedArguments[eventName] and ExpectedArguments[eventName].clientDisabled

                if clientDisabled ~= nil and clientDisabled or info.clientDisabled then
                    warn([[Networking:FireEvent: This event cannot be fired on the client:]], eventName)

                    return
                end
                if info.usePlayerModel then
                    local character = Shared.Classes.LocalPlayer.Character

                    if not character then
                        warn('Networking:FireEvent: No character is present for event:', eventName)

                        return
                    end

                    table.insert(arguments, 1, character)
                end

                local event = NetworkClient.getEvent(eventName)

                if event then
                    event:FireToServer(unpack(arguments))
                else
                    warn('Networking:FireEvent: Failed to fetch event for:', eventName)

                    return
                end
            end
            function Networking.HookEvent(self, eventName, callback)
                if typeof(eventName) ~= 'string' then
                    warn('Networking:HookEvent: Argument #1 expects a string, but a:', typeof(eventName), 'was passed')

                    return
                end

                local info = NetworkEvents.getEventInfo(eventName)

                if not info then
                    warn('Networking:HookEvent: No event of the name:', eventName, 'was found')

                    return
                end
                if typeof(callback) ~= 'function' then
                    warn([[Networking:HookEvent: Argument #2 expects a function, but a:]], typeof(callback), 'was passed')

                    return
                end

                self.HookedOutgoingEvents[eventName] = callback
            end
            function Networking.UnhookEvent(self, eventName)
                if typeof(eventName) ~= 'string' then
                    warn'Networking:UnhookEvent: eventName must be a string'

                    return
                end

                local index = table.find(Networking.HookedOutgoingEvents, eventName)

                if not index then
                    warn('Networking:UnhookEvent: event not found ->', eventName)

                    return
                end

                self.HookedOutgoingEvents[eventName] = nil
            end

            return Networking
        end

        function init.g()
            local v = init.cache.g

            if not v then
                v = {
                    c = __modImpl(),
                }
                init.cache.g = v
            end

            return v.c
        end
    end
    do
        local __modImpl = function()
            local Shared, _Network = init.e(), init.g()
            local GuiSounds, CombatKillfeedClient, Notifications = Shared.Modules:find('GuiSounds', true), Shared.Modules:find('CombatKillfeedClient', true), {Config = {}}

            CombatKillfeedClient.playHitmarkSound = function()
                GuiSounds.play('Hitmark', GuiSounds.CustomSound and 1 or 0.9, GuiSounds.CustomSound and GuiSounds.CustomVolume or nil)
            end
            Notifications.playHitmarkSound = CombatKillfeedClient.playHitmarkSound

            return Notifications
        end

        function init.h()
            local v = init.cache.h

            if not v then
                v = {
                    c = __modImpl(),
                }
                init.cache.h = v
            end

            return v.c
        end
    end
    do
        local __modImpl = function()
            return {
                Network = init.g(),
                Notifications = init.h(),
            }
        end

        function init.i()
            local v = init.cache.i

            if not v then
                v = {
                    c = __modImpl(),
                }
                init.cache.i = v
            end

            return v.c
        end
    end
    do
        local __modImpl = function()
            local Shared = init.e()
            local Players, LocalPlayer, Modules = Shared.Services.Players, Shared.Classes.LocalPlayer, Shared.Modules
            local WeaponsDamageClient, CombatTouchTestClient = Modules:find('WeaponsDamageClient', true), Modules:find('CombatTouchTestClient', true)
            local RunTouchTest = LPH_JIT_MAX(function()
                local upvalue = debug.getupvalue(CombatTouchTestClient.start, 3)

                if typeof(upvalue) ~= 'function' then
                    return nil
                end

                return upvalue
            end)()

            if RunTouchTest then
                hookfunction(RunTouchTest, LPH_NO_UPVALUES(function()
                    return
                end))
            end

            local DealShot

            DealShot = hookfunction(WeaponsDamageClient.dealShot, LPH_NO_VIRTUALIZE(function(a, b, c, d, e)
                d = d:Lerp(c.Position, 0.999)

                return DealShot(a, b, c, d, e)
            end))

            local HitboxExtender = {
                Config = {
                    Enabled = false,
                    SizeIncrease = 1,
                    Transparency = 0,
                    Material = Enum.Material.ForceField,
                    Color = Color3.fromRGB(255, 0, 0),
                },
            }

            HitboxExtender.Update = LPH_JIT_MAX(function()
                if not HitboxExtender.Config.Enabled then
                    return
                end

                for _, Player in next, Players:GetPlayers()do
                    local __DARKLUA_CONTINUE_55 = false

                    repeat
                        if Player == LocalPlayer then
                            __DARKLUA_CONTINUE_55 = true

                            break
                        end
                        if not Player.Character then
                            __DARKLUA_CONTINUE_55 = true

                            break
                        end

                        local Character = Player.Character
                        local HumanoidRootPart = Character and Character.HumanoidRootPart or nil

                        if not HumanoidRootPart then
                            __DARKLUA_CONTINUE_55 = true

                            break
                        end
                        if Player.Team == LocalPlayer.Team then
                            HumanoidRootPart.Transparency = 1
                            HumanoidRootPart.Size = Vector3.new(2, 2, 2)
                            HumanoidRootPart.Color = Color3.new(1, 1, 1)
                            HumanoidRootPart.Material = Enum.Material.Plastic
                            __DARKLUA_CONTINUE_55 = true

                            break
                        end

                        HumanoidRootPart.Color = HitboxExtender.Config.Color
                        HumanoidRootPart.Material = HitboxExtender.Config.Material
                        HumanoidRootPart.Transparency = HitboxExtender.Config.Transparency
                        HumanoidRootPart.Size = Vector3.new(2, 2, 2) * HitboxExtender.Config.SizeIncrease
                        __DARKLUA_CONTINUE_55 = true
                    until true

                    if not __DARKLUA_CONTINUE_55 then
                        break
                    end
                end
            end)
            HitboxExtender.OnDisable = LPH_JIT_MAX(function()
                for _, Player in next, Players:GetPlayers()do
                    local __DARKLUA_CONTINUE_56 = false

                    repeat
                        if Player == LocalPlayer then
                            __DARKLUA_CONTINUE_56 = true

                            break
                        end
                        if not Player.Character then
                            __DARKLUA_CONTINUE_56 = true

                            break
                        end

                        local Character = Player.Character
                        local HumanoidRootPart = Character and Character.HumanoidRootPart or nil

                        if not HumanoidRootPart then
                            __DARKLUA_CONTINUE_56 = true

                            break
                        end

                        HumanoidRootPart.Transparency = 1
                        HumanoidRootPart.Size = Vector3.new(2, 2, 2)
                        HumanoidRootPart.Color = Color3.new(1, 1, 1)
                        HumanoidRootPart.Material = Enum.Material.Plastic
                        __DARKLUA_CONTINUE_56 = true
                    until true

                    if not __DARKLUA_CONTINUE_56 then
                        break
                    end
                end
            end)

            return HitboxExtender
        end

        function init.j()
            local v = init.cache.j

            if not v then
                v = {
                    c = __modImpl(),
                }
                init.cache.j = v
            end

            return v.c
        end
    end
    do
        local __modImpl = function()
            local Shared = init.e()
            local Modules = Shared.Modules
            local WeaponsDamageClient, WeaponsToolbarClient, Camera, Players, LocalPlayer, Melee = Modules:find('WeaponsDamageClient', true), Modules:find('WeaponsToolbarClient', true), Shared.Classes.Camera, Shared.Services.Players, Shared.Classes.LocalPlayer, {
                Config = {
                    Aura = false,
                    BypassRangeCheck = false,
                    CustomDamage = false,
                    CustomDamageAmount = 50,
                    AuraRange = 10,
                    AuraAttackDelay = 0.1,
                    ShowAuraRange = false,
                    ShowAuraRangeChunk = 20,
                    ShowAuraRangeColor = Color3.fromRGB(255, 255, 255),
                    ShowAuraTarget = false,
                    ShowAuraTargetColor = Color3.fromRGB(255, 255, 255),
                },
                LastTick = 0,
                Toggled = false,
                RangeLines = {},
                TargetLines = {},
            }
            local Segments = math.floor(360 / Melee.Config.ShowAuraRangeChunk)

            for i = 1, Segments do
                local Line = Drawing.new'Line'

                Line.Visible = false
                Line.Thickness = 1.5
                Melee.RangeLines[i] = Line
            end

            local Old

            Old = hookfunction(debug.getupvalue(WeaponsDamageClient.dealMelee, 6), LPH_NO_UPVALUES(function(a, b)
                if Melee.Config.BypassRangeCheck then
                    return false
                end

                return Old(a, b)
            end))

            local LPH_DetectHits = LPH_NO_VIRTUALIZE(function(Player, Humanoid, Damage)
                WeaponsDamageClient.dealMelee(Player, Humanoid, Damage)
            end)

            Melee.GetEnemyForMelee = function()
                local LocalCharacter = LocalPlayer.Character

                if not LocalCharacter or not LocalCharacter.PrimaryPart then
                    return
                end

                local Distance, Closest = Melee.Config.AuraRange, {}

                for Index, Player in next, Players:GetPlayers()do
                    local __DARKLUA_CONTINUE_58 = false

                    repeat
                        local Character = Player.Character

                        if Player == LocalPlayer then
                            __DARKLUA_CONTINUE_58 = true

                            break
                        end
                        if Player.Team == LocalPlayer.Team then
                            __DARKLUA_CONTINUE_58 = true

                            break
                        end
                        if not Character then
                            __DARKLUA_CONTINUE_58 = true

                            break
                        end

                        local PrimaryPart = Character.PrimaryPart

                        if not PrimaryPart then
                            __DARKLUA_CONTINUE_58 = true

                            break
                        end

                        local Humanoid = Character.Humanoid

                        if not Humanoid then
                            __DARKLUA_CONTINUE_58 = true

                            break
                        end
                        if Humanoid.Health <= 0 then
                            __DARKLUA_CONTINUE_58 = true

                            break
                        end

                        local Magnitude = (PrimaryPart.Position - LocalCharacter.PrimaryPart.Position).Magnitude

                        if Distance > Magnitude then
                            Distance = Magnitude

                            table.insert(Closest, Player)
                        end

                        __DARKLUA_CONTINUE_58 = true
                    until true

                    if not __DARKLUA_CONTINUE_58 then
                        break
                    end
                end

                return Closest
            end
            Melee.Update = function()
                if not Melee.Config.Aura then
                    for _, Line in next, Melee.RangeLines do
                        Line.Visible = false
                    end
                    for _, Line in next, Melee.TargetLines do
                        Line.Visible = false
                    end

                    return
                end

                local Tick, Enemies = tick(), Melee.GetEnemyForMelee()

                if Melee.Config.ShowAuraRange then
                    if LocalPlayer.Character and LocalPlayer.Character.PrimaryPart then
                        local Points = {}

                        for Angle = 0, 360, Melee.Config.ShowAuraRangeChunk do
                            local Rad = math.rad(Angle)
                            local Pos = LocalPlayer.Character.PrimaryPart.Position + Vector3.new(math.cos(Rad) * Melee.Config.AuraRange, 0, math.sin(Rad) * Melee.Config.AuraRange)
                            local Screen = Camera:WorldToViewportPoint(Pos)

                            if Screen.Z > 0 then
                                Points[#Points + 1] = Vector2.new(Screen.X, Screen.Y)
                            end
                        end
                        for i = 1, Segments do
                            local A, B, Line = Points[i], Points[i + 1] or Points[1], Melee.RangeLines[i]

                            if A and B then
                                Line.Visible = true
                                Line.Color = Melee.Config.ShowAuraRangeColor
                                Line.From = A
                                Line.To = B
                            else
                                Line.Visible = false
                            end
                        end
                    else
                        for _, Line in next, Melee.RangeLines do
                            Line.Visible = false
                        end
                    end
                else
                    for _, Line in next, Melee.RangeLines do
                        Line.Visible = false
                    end
                end
                if Melee.Config.ShowAuraTarget then
                    for _, Line in next, Melee.TargetLines do
                        Line.Visible = false
                    end
                    for _, Player in next, Enemies do
                        local To, OnScreen = Camera:WorldToViewportPoint(Player.Character.PrimaryPart.Position)
                        local To2, OnScreen2 = Camera:WorldToViewportPoint(LocalPlayer.Character.PrimaryPart.Position)

                        if OnScreen and OnScreen2 then
                            Melee.TargetLines[Player].Visible = true
                            Melee.TargetLines[Player].From = Vector2.new(To2.X, To2.Y)
                            Melee.TargetLines[Player].To = Vector2.new(To.X, To.Y)
                        else
                            Melee.TargetLines[Player].Visible = false
                        end
                    end
                else
                    for _, Line in next, Melee.TargetLines do
                        Line.Visible = false
                    end
                end
                if Melee.Toggled then
                    if Tick - Melee.LastTick >= Melee.Config.AuraAttackDelay then
                        if #Enemies > 0 then
                            for _, Player in next, Enemies do
                                local Client = WeaponsToolbarClient.getEquippedWeaponClient()

                                if Client and Client.meleeAction then
                                    LPH_DetectHits(Player, Player.Character.Humanoid, Melee.Config.CustomDamage and Melee.Config.CustomDamageAmount or Client:GetDamage())
                                end
                            end
                        end

                        Melee.LastTick = Tick
                    end
                end
            end
            Melee.CreateLine = function(Player)
                local Line = Drawing.new'Line'

                Line.Visible = false
                Line.Thickness = 1.5
                Melee.TargetLines[Player] = Line
            end

            return Melee
        end

        function init.k()
            local v = init.cache.k

            if not v then
                v = {
                    c = __modImpl(),
                }
                init.cache.k = v
            end

            return v.c
        end
    end
    do
        local __modImpl = function()
            local Utility = {
                GetCorners = function(Part)
                    if typeof(Part) ~= 'BasePart' then
                        return nil
                    end

                    local Size = Part.Size / 2
                    local Corners = {
                        Vector3.new(-Size.X, -Size.Y, -Size.Z),
                        Vector3.new(-Size.X, -Size.Y, Size.Z),
                        Vector3.new(-Size.X, Size.Y, -Size.Z),
                        Vector3.new(-Size.X, Size.Y, Size.Z),
                        Vector3.new(Size.X, -Size.Y, -Size.Z),
                        Vector3.new(Size.X, -Size.Y, Size.Z),
                        Vector3.new(Size.X, Size.Y, -Size.Z),
                        Vector3.new(Size.X, Size.Y, Size.Z),
                    }

                    return Corners
                end,
                Draw = function(class, properties)
                    local success, instance = pcall(Drawing.new, class)

                    if not success then
                        return false
                    end
                    if properties then
                        for key, value in next, properties do
                            local succ, err = pcall(function()
                                (instance)[key] = value
                            end)

                            if not succ then
                                warn(err)

                                return false
                            end
                        end
                    end

                    return instance
                end,
                Create = function(class, properties)
                    local success, instance = pcall(Instance.new, class)

                    if not success then
                        return false
                    end
                    if properties then
                        for key, value in next, properties do
                            local succ, err = pcall(function()
                                (instance)[key] = value
                            end)

                            if not succ then
                                warn(err)

                                return false
                            end
                        end
                    end

                    return instance
                end,
                SolveTrajectory = function(Origin, TargetPosition, TargetVelocity, MuzzleVelocity)
                    local GRAVITY, targetVel = (-64)

                    if type(TargetVelocity) == 'number' then
                        targetVel = Vector3.new(TargetVelocity, 0, 0)
                    elseif not TargetVelocity then
                        targetVel = Vector3.new(0, 0, 0)
                    else
                        targetVel = TargetVelocity
                    end

                    local ProjectileSpeed = MuzzleVelocity.Magnitude
                    local Time, PredictedPosition = (TargetPosition - Origin).Magnitude / ProjectileSpeed, TargetPosition

                    for i = 1, 5 do
                        PredictedPosition = TargetPosition + targetVel * Time

                        local ToTarget = PredictedPosition - Origin
                        local HorizontalDistance = Vector3.new(ToTarget.X, 0, ToTarget.Z).Magnitude

                        Time = HorizontalDistance / ProjectileSpeed

                        local verticalDistance = math.abs(ToTarget.Y)

                        if verticalDistance > 0 then
                            local dropTime = math.sqrt(2 * verticalDistance / 64)

                            Time = math.max(Time, dropTime)
                        end
                    end

                    PredictedPosition = TargetPosition + targetVel * Time

                    local dropCompensation = 32 * Time * Time
                    local AimPosition = PredictedPosition + Vector3.new(0, dropCompensation, 0)
                    local AimDirection, LeadVector = (AimPosition - Origin).Unit, PredictedPosition - TargetPosition
                    local LeadDistance, ImpactVelocity = LeadVector.Magnitude, AimDirection * ProjectileSpeed + Vector3.new(0, GRAVITY * Time, 0)

                    return {
                        AimPosition = PredictedPosition,
                        TimeToTarget = Time,
                        AimDirection = AimDirection,
                        DropCompensation = dropCompensation,
                        LeadDistance = LeadDistance,
                        LeadVector = LeadVector,
                        ImpactVelocity = ImpactVelocity,
                        ImpactSpeed = ImpactVelocity.Magnitude,
                        IsSolutionValid = Time > 0,
                    }
                end,
                InRadius = function(position, targetposition, radius)
                    return (targetposition - position).Magnitude <= radius
                end,
            }

            return Utility
        end

        function init.l()
            local v = init.cache.l

            if not v then
                v = {
                    c = __modImpl(),
                }
                init.cache.l = v
            end

            return v.c
        end
    end
    do
        local __modImpl = function()
            local Shared, Utility = init.e(), init.l()
            local Players, UserInputService, Camera, LocalPlayer, Modules = Shared.Services.Players, Shared.Services.UserInputService, Shared.Classes.Camera, Shared.Classes.LocalPlayer, Shared.Modules
            local FireActionClient, CombatFormationClient, WeaponsProjectilesClient = Modules:find('FireActionClient', true), Modules:find('CombatFormationClient', true), Modules:find('WeaponsProjectilesClient', true)
            local Variables, General = debug.getupvalue(FireActionClient.Fire, 6), {
                SilentAim = {
                    Config = {
                        Enabled = false,
                        Manipulation = false,
                        VisibleCheck = false,
                        FlagBearerPriority = false,
                        Hitpart = 'Torso',
                        DistanceLimit = 500,
                    },
                    FOVConfig = {
                        Enabled = false,
                        Outline = false,
                        Visible = false,
                        Filled = false,
                        Radius = 100,
                        Thickness = 1,
                        NumSides = 20,
                        Transparency = 0,
                        Color = Color3.fromRGB(44, 124, 254),
                    },
                    FOVFillConfig = {
                        Transparency = 0.3,
                        Color = Color3.fromRGB(44, 124, 254),
                    },
                    LineConfig = {
                        Enabled = false,
                        Outline = false,
                        Thickness = 1,
                        Transparency = 1,
                        Color = Color3.new(1, 1, 1),
                    },
                    Line = Utility.Draw('Line', {
                        ZIndex = 11,
                        Visible = false,
                    }),
                    LineOutline = Utility.Draw('Line', {
                        ZIndex = 10,
                        Visible = false,
                        Color = Color3.new(0, 0, 0),
                    }),
                    FOVCircle = Utility.Draw('Circle', {
                        ZIndex = 11,
                        Visible = false,
                    }),
                    FOVCircleOutline = Utility.Draw('Circle', {
                        ZIndex = 10,
                        Visible = false,
                        Color = Color3.new(0, 0, 0),
                    }),
                    FOVCircleFill = Utility.Draw('Circle', {
                        ZIndex = 9,
                        Visible = false,
                        Filled = true,
                    }),
                    Target = nil,
                    TargetPart = nil,
                    Toggled = false,
                    Update = function() end,
                },
                Aimbot = {
                    Config = {
                        Enabled = false,
                        Smoothing = 0.3,
                        VisibleCheck = false,
                        FlagBearerPriority = false,
                        Hitpart = 'Torso',
                        DistanceLimit = 500,
                    },
                    FOVConfig = {
                        Enabled = false,
                        Outline = false,
                        Visible = false,
                        Filled = false,
                        Radius = 100,
                        Thickness = 1,
                        NumSides = 20,
                        Transparency = 0,
                        Color = Color3.fromRGB(44, 124, 254),
                    },
                    FOVFillConfig = {
                        Transparency = 0.7,
                        Color = Color3.fromRGB(44, 124, 254),
                    },
                    LineConfig = {
                        Enabled = false,
                        Outline = false,
                        Thickness = 1,
                        Transparency = 1,
                        Color = Color3.new(1, 1, 1),
                    },
                    Line = Utility.Draw('Line', {
                        ZIndex = 14,
                        Visible = false,
                    }),
                    LineOutline = Utility.Draw('Line', {
                        ZIndex = 13,
                        Visible = false,
                        Color = Color3.new(0, 0, 0),
                    }),
                    FOVCircle = Utility.Draw('Circle', {
                        ZIndex = 14,
                        Visible = false,
                    }),
                    FOVCircleOutline = Utility.Draw('Circle', {
                        ZIndex = 13,
                        Visible = false,
                        Color = Color3.new(0, 0, 0),
                    }),
                    FOVCircleFill = Utility.Draw('Circle', {
                        ZIndex = 12,
                        Visible = false,
                        Filled = true,
                    }),
                    Target = nil,
                    TargetPart = nil,
                    Toggled = false,
                    Update = function() end,
                },
                BulletTracers = {
                    Config = {
                        Enabled = false,
                        Duration = 5,
                        Color = Color3.fromRGB(255, 255, 255),
                    },
                },
            }
            local Aimbot = General.Aimbot

            Aimbot.WallCheck = LPH_JIT_MAX(function(Part)
                if not Aimbot.Config.VisibleCheck then
                    return true
                end
                if not Part or not Part.Parent then
                    return false
                end

                local _RaycastParams = RaycastParams.new()

                _RaycastParams.FilterType = Enum.RaycastFilterType.Exclude
                _RaycastParams.IgnoreWater = true
                _RaycastParams.FilterDescendantsInstances = {
                    LocalPlayer.Character,
                    Camera,
                }

                local RayResult = workspace:Raycast(Camera.CFrame.Position, (Part.Position - Camera.CFrame.Position).Unit * 1000, _RaycastParams)

                if RayResult then
                    local HitPart = RayResult.Instance
                    local HitCharacter, TargetCharacter = HitPart:FindFirstAncestorOfClass'Model', Part:FindFirstAncestorOfClass'Model'

                    return HitCharacter == TargetCharacter
                end

                return false
            end)
            Aimbot.GetClosestPlayer = LPH_JIT_MAX(function()
                if not Aimbot.Config.Enabled or not Aimbot.Toggled then
                    return nil
                end

                local ClosestDistance, ClosestPlayer, Hitpart = (math.huge)

                for _, Player in next, Players:GetPlayers()do
                    local __DARKLUA_CONTINUE_72 = false

                    repeat
                        if Player ~= LocalPlayer then
                            local Character = Player.Character

                            if Character and Character:FindFirstChild(Aimbot.Config.Hitpart) then
                                if LocalPlayer.Team == Player.Team then
                                    __DARKLUA_CONTINUE_72 = true

                                    break
                                end
                                if not (Player.Character:FindFirstChild'Humanoid' and Player.Character.Humanoid.Health > 0) then
                                    __DARKLUA_CONTINUE_72 = true

                                    break
                                end
                                if not ((Camera.CFrame.Position - Player.Character:GetPivot().Position).Magnitude <= Aimbot.Config.DistanceLimit) then
                                    __DARKLUA_CONTINUE_72 = true

                                    break
                                end

                                local Part = Character[Aimbot.Config.Hitpart]
                                local PartPosition, OnScreen = Camera:WorldToViewportPoint(Part.Position)

                                if OnScreen then
                                    local AimVector = Vector2.new(PartPosition.X, PartPosition.Y)
                                    local Distance = (UserInputService:GetMouseLocation() - AimVector).Magnitude

                                    if Distance < ClosestDistance then
                                        if not Aimbot.FOVConfig.Enabled or Utility.InRadius(Aimbot.FOVCircle.Position, AimVector, Aimbot.FOVConfig.Radius) then
                                            if Aimbot.WallCheck(Part) then
                                                if Aimbot.Target and Aimbot.TargetPart then
                                                    return Aimbot.Target, Aimbot.TargetPart
                                                end
                                                if Aimbot.Config.FlagBearerPriority and Player:GetAttribute'FlagBearer' then
                                                    Hitpart = Part
                                                    ClosestPlayer = Player
                                                    ClosestDistance = Distance
                                                elseif not Aimbot.Config.FlagBearerPriority then
                                                    Hitpart = Part
                                                    ClosestPlayer = Player
                                                    ClosestDistance = Distance
                                                elseif not Player:GetAttribute'FlagBearer' then
                                                    Hitpart = Part
                                                    ClosestPlayer = Player
                                                    ClosestDistance = Distance
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end

                        __DARKLUA_CONTINUE_72 = true
                    until true

                    if not __DARKLUA_CONTINUE_72 then
                        break
                    end
                end

                return ClosestPlayer, Hitpart
            end)
            Aimbot.Update = LPH_JIT_MAX(function()
                if not Aimbot.Config.Enabled then
                    Aimbot.FOVCircle.Visible = false
                    Aimbot.FOVCircleOutline.Visible = false
                    Aimbot.FOVCircleFill.Visible = false

                    return
                end

                Aimbot.Target, Aimbot.TargetPart = Aimbot.GetClosestPlayer()

                local AimbotFOVLocation = UserInputService:GetMouseLocation()

                if Aimbot.FOVConfig.Enabled then
                    local FOVCircle = Aimbot.FOVCircle
                    local LerpedLocation = FOVCircle.Position:Lerp(Vector2.new(AimbotFOVLocation.X, AimbotFOVLocation.Y), 0.5)

                    FOVCircle.Radius = Aimbot.FOVConfig.Radius
                    FOVCircle.Thickness = Aimbot.FOVConfig.Thickness
                    FOVCircle.NumSides = Aimbot.FOVConfig.NumSides
                    FOVCircle.Color = Aimbot.FOVConfig.Color
                    FOVCircle.Transparency = math.clamp(1 - Aimbot.FOVConfig.Transparency, 0, 1)
                    FOVCircle.Visible = Aimbot.FOVConfig.Visible
                    FOVCircle.Position = LerpedLocation

                    if Aimbot.FOVConfig.Outline then
                        local FOVCircleOutline = Aimbot.FOVCircleOutline

                        FOVCircleOutline.Radius = Aimbot.FOVConfig.Radius
                        FOVCircleOutline.Thickness = Aimbot.FOVConfig.Thickness + 2
                        FOVCircleOutline.NumSides = Aimbot.FOVConfig.NumSides
                        FOVCircleOutline.Visible = Aimbot.FOVConfig.Visible
                        FOVCircleOutline.Position = LerpedLocation
                    else
                        Aimbot.FOVCircleOutline.Visible = false
                    end
                    if Aimbot.FOVConfig.Filled then
                        local FOVCircleFill = Aimbot.FOVCircleFill

                        FOVCircleFill.Radius = Aimbot.FOVConfig.Radius
                        FOVCircleFill.Thickness = Aimbot.FOVConfig.Thickness
                        FOVCircleFill.NumSides = Aimbot.FOVConfig.NumSides
                        FOVCircleFill.Visible = Aimbot.FOVConfig.Visible
                        FOVCircleFill.Color = Aimbot.FOVFillConfig.Color
                        FOVCircleFill.Transparency = math.clamp(1 - Aimbot.FOVFillConfig.Transparency, 0, 1)
                        FOVCircleFill.Position = LerpedLocation
                    else
                        Aimbot.FOVCircleFill.Visible = false
                    end
                else
                    Aimbot.FOVCircle.Visible = false
                    Aimbot.FOVCircleFill.Visible = false
                    Aimbot.FOVCircleOutline.Visible = false
                end
                if Aimbot.LineConfig.Enabled then
                    local Line, LineOutline, AimVector = Aimbot.Line, Aimbot.LineOutline, Aimbot.Target and Aimbot.Target.Character and Camera:WorldToViewportPoint(Aimbot.Target.Character[Aimbot.Config.Hitpart].Position)

                    if AimVector then
                        Line.Visible = true
                        Line.Color = Aimbot.LineConfig.Color
                        Line.Thickness = Aimbot.LineConfig.Thickness
                        Line.Transparency = Aimbot.LineConfig.Transparency
                        Line.To = Vector2.new(AimVector.X, AimVector.Y)
                        Line.From = Vector2.new(AimbotFOVLocation.X, AimbotFOVLocation.Y)

                        if Aimbot.LineConfig.Outline then
                            LineOutline.Visible = true
                            LineOutline.Thickness = Aimbot.LineConfig.Thickness + 2
                            LineOutline.To = Vector2.new(AimVector.X, AimVector.Y)
                            LineOutline.From = Vector2.new(AimbotFOVLocation.X, AimbotFOVLocation.Y)
                        else
                            LineOutline.Visible = false
                        end
                    else
                        Line.Visible = false
                        LineOutline.Visible = false
                    end
                else
                    Aimbot.Line.Visible = false
                    Aimbot.LineOutline.Visible = false
                end
            end)

            local OldRenderStepped

            OldRenderStepped = hookfunction(FireActionClient.RenderStepped, LPH_NO_UPVALUES(function(self, a)
                if not (Aimbot.Config.Enabled and Aimbot.Toggled) then
                    return OldRenderStepped(self, a)
                end

                local Direction, Origin

                if self.aiming then
                    if self.muzzleAttachment then
                        local MuzzleCFrame = self.muzzleAttachment.WorldCFrame

                        if self.muzzleProjectileOffset then
                            MuzzleCFrame = MuzzleCFrame * self.muzzleProjectileOffset
                        end

                        local BaseSpreadDegrees = Variables.ProjectileSpread
                        local SpreadAngle = math.rad(BaseSpreadDegrees) * (math.random() - 0.5) * (1 - 0.6 * self.aimProgress)

                        if self.noBayonetBonus then
                            SpreadAngle = SpreadAngle * 0.96
                        end
                        if self.inaccuracyModifier then
                            SpreadAngle = SpreadAngle * self.inaccuracyModifier
                        end

                        local IsSkirmishFormation, ProjectileSpeed = CombatFormationClient.formation == 3, self.projectileSpeed or 860

                        if IsSkirmishFormation then
                            SpreadAngle = SpreadAngle * Variables.SkirmishAccuracyModifier
                            ProjectileSpeed = 940
                        end
                        if FireActionClient.rsc and math.random() > FireActionClient.rsc then
                            SpreadAngle = SpreadAngle * 0.08
                        end

                        local ShotDirection = (MuzzleCFrame * CFrame.Angles(0, 0, math.pi * 2 * math.random()) * CFrame.Angles(SpreadAngle, 0, 0)).LookVector

                        Direction, Origin = ShotDirection * ProjectileSpeed, MuzzleCFrame.Position + ShotDirection * 1
                    end
                end
                if Direction and Origin then
                    local Target, Part = Aimbot.Target, Aimbot.TargetPart

                    if Target and Part then
                        local MousePosition, Prediction = UserInputService:GetMouseLocation(), Utility.SolveTrajectory(Origin, Part.Position, Part.Velocity, Direction)
                        local Vector = Camera:WorldToViewportPoint(Prediction.AimPosition)
                        local Lerp = MousePosition:Lerp(Vector2.new(Vector.X, Vector.Y), Aimbot.Config.Smoothing)
                        local Delta = Lerp - MousePosition

                        mousemoverel(Delta.X, Delta.Y)
                    end
                end

                return OldRenderStepped(self, a)
            end))

            local SilentAim = General.SilentAim

            SilentAim.WallCheck = LPH_JIT_MAX(function(Part)
                if not SilentAim.Config.VisibleCheck then
                    return true
                end
                if not Part or not Part.Parent then
                    return false
                end

                local _RaycastParams = RaycastParams.new()

                _RaycastParams.FilterType = Enum.RaycastFilterType.Exclude
                _RaycastParams.IgnoreWater = true
                _RaycastParams.FilterDescendantsInstances = {
                    LocalPlayer.Character,
                    Camera,
                }

                local RayResult = workspace:Raycast(Camera.CFrame.Position, (Part.Position - Camera.CFrame.Position).Unit * 1000, _RaycastParams)

                if RayResult then
                    local HitPart = RayResult.Instance
                    local HitCharacter, TargetCharacter = HitPart:FindFirstAncestorOfClass'Model', Part:FindFirstAncestorOfClass'Model'

                    return HitCharacter == TargetCharacter
                end

                return false
            end)
            SilentAim.GetClosestPlayer = LPH_JIT_MAX(function()
                if not SilentAim.Config.Enabled or not SilentAim.Toggled then
                    return nil
                end

                local ClosestDistance, ClosestPlayer, Hitpart = (math.huge)

                for _, Player in next, Players:GetPlayers()do
                    local __DARKLUA_CONTINUE_73 = false

                    repeat
                        if Player ~= LocalPlayer then
                            local Character = Player.Character

                            if Character and Character:FindFirstChild(SilentAim.Config.Hitpart) then
                                if LocalPlayer.Team == Player.Team then
                                    __DARKLUA_CONTINUE_73 = true

                                    break
                                end
                                if not (Player.Character:FindFirstChild'Humanoid' and Player.Character.Humanoid.Health > 0) then
                                    __DARKLUA_CONTINUE_73 = true

                                    break
                                end
                                if not ((Camera.CFrame.Position - Player.Character:GetPivot().Position).Magnitude <= SilentAim.Config.DistanceLimit) then
                                    __DARKLUA_CONTINUE_73 = true

                                    break
                                end

                                local Part = Character[SilentAim.Config.Hitpart]
                                local PartPosition, OnScreen = Camera:WorldToViewportPoint(Part.Position)

                                if OnScreen then
                                    local AimVector = Vector2.new(PartPosition.X, PartPosition.Y)
                                    local Distance = (UserInputService:GetMouseLocation() - AimVector).Magnitude

                                    if Distance < ClosestDistance then
                                        if not SilentAim.FOVConfig.Enabled or Utility.InRadius(SilentAim.FOVCircle.Position, AimVector, SilentAim.FOVConfig.Radius) then
                                            if SilentAim.WallCheck(Part) then
                                                if SilentAim.Config.FlagBearerPriority and Player:GetAttribute'FlagBearer' then
                                                    Hitpart = Part
                                                    ClosestPlayer = Player
                                                    ClosestDistance = Distance
                                                elseif not SilentAim.Config.FlagBearerPriority then
                                                    Hitpart = Part
                                                    ClosestPlayer = Player
                                                    ClosestDistance = Distance
                                                elseif not Player:GetAttribute'FlagBearer' then
                                                    Hitpart = Part
                                                    ClosestPlayer = Player
                                                    ClosestDistance = Distance
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end

                        __DARKLUA_CONTINUE_73 = true
                    until true

                    if not __DARKLUA_CONTINUE_73 then
                        break
                    end
                end

                return ClosestPlayer, Hitpart
            end)
            SilentAim.Update = LPH_JIT_MAX(function()
                if not SilentAim.Config.Enabled then
                    SilentAim.FOVCircle.Visible = false
                    SilentAim.FOVCircleOutline.Visible = false
                    SilentAim.FOVCircleFill.Visible = false

                    return
                end

                SilentAim.Target, SilentAim.TargetPart = SilentAim.GetClosestPlayer()

                local SilentAimFOVLocation = UserInputService:GetMouseLocation()

                if SilentAim.FOVConfig.Enabled then
                    local FOVCircle = SilentAim.FOVCircle
                    local LerpedLocation = FOVCircle.Position:Lerp(Vector2.new(SilentAimFOVLocation.X, SilentAimFOVLocation.Y), 0.5)

                    FOVCircle.Radius = SilentAim.FOVConfig.Radius
                    FOVCircle.Thickness = SilentAim.FOVConfig.Thickness
                    FOVCircle.NumSides = SilentAim.FOVConfig.NumSides
                    FOVCircle.Color = SilentAim.FOVConfig.Color
                    FOVCircle.Transparency = math.clamp(1 - SilentAim.FOVConfig.Transparency, 0, 1)
                    FOVCircle.Visible = SilentAim.FOVConfig.Visible
                    FOVCircle.Position = LerpedLocation

                    if SilentAim.FOVConfig.Outline then
                        local FOVCircleOutline = SilentAim.FOVCircleOutline

                        FOVCircleOutline.Radius = SilentAim.FOVConfig.Radius
                        FOVCircleOutline.Thickness = SilentAim.FOVConfig.Thickness + 2
                        FOVCircleOutline.NumSides = SilentAim.FOVConfig.NumSides
                        FOVCircleOutline.Visible = SilentAim.FOVConfig.Visible
                        FOVCircleOutline.Position = LerpedLocation
                    else
                        SilentAim.FOVCircleOutline.Visible = false
                    end
                    if SilentAim.FOVConfig.Filled then
                        local FOVCircleFill = SilentAim.FOVCircleFill

                        FOVCircleFill.Radius = SilentAim.FOVConfig.Radius
                        FOVCircleFill.Thickness = SilentAim.FOVConfig.Thickness
                        FOVCircleFill.NumSides = SilentAim.FOVConfig.NumSides
                        FOVCircleFill.Visible = SilentAim.FOVConfig.Visible
                        FOVCircleFill.Color = SilentAim.FOVFillConfig.Color
                        FOVCircleFill.Transparency = math.clamp(1 - SilentAim.FOVFillConfig.Transparency, 0, 1)
                        FOVCircleFill.Position = LerpedLocation
                    else
                        SilentAim.FOVCircleFill.Visible = false
                    end
                else
                    SilentAim.FOVCircle.Visible = false
                    SilentAim.FOVCircleFill.Visible = false
                    SilentAim.FOVCircleOutline.Visible = false
                end
                if SilentAim.LineConfig.Enabled then
                    local Line, LineOutline, AimVector = SilentAim.Line, SilentAim.LineOutline, SilentAim.Target and SilentAim.Target.Character and Camera:WorldToViewportPoint(SilentAim.Target.Character[SilentAim.Config.Hitpart].Position)

                    if AimVector then
                        Line.Visible = true
                        Line.Color = SilentAim.LineConfig.Color
                        Line.Thickness = SilentAim.LineConfig.Thickness
                        Line.Transparency = SilentAim.LineConfig.Transparency
                        Line.To = Vector2.new(AimVector.X, AimVector.Y)
                        Line.From = Vector2.new(SilentAimFOVLocation.X, SilentAimFOVLocation.Y)

                        if SilentAim.LineConfig.Outline then
                            LineOutline.Visible = true
                            LineOutline.Thickness = SilentAim.LineConfig.Thickness + 2
                            LineOutline.To = Vector2.new(AimVector.X, AimVector.Y)
                            LineOutline.From = Vector2.new(SilentAimFOVLocation.X, SilentAimFOVLocation.Y)
                        else
                            LineOutline.Visible = false
                        end
                    else
                        Line.Visible = false
                        LineOutline.Visible = false
                    end
                else
                    SilentAim.Line.Visible = false
                    SilentAim.LineOutline.Visible = false
                end
            end)

            local OldfireBProjectile

            OldfireBProjectile = hookfunction(WeaponsProjectilesClient.fireBProjectile, LPH_NO_UPVALUES(function(Direction, Origin, WeaponValue)
                if SilentAim.Config.Enabled and not SilentAim.Config.Manipulation then
                    local Target, Part = SilentAim.Target, SilentAim.TargetPart

                    if not (Target and Part) then
                        return OldfireBProjectile(Direction, Origin, WeaponValue)
                    end

                    local ProjectileSpeed, Prediction = Direction.Magnitude, Utility.SolveTrajectory(Origin, Part.Position, Part.Velocity, Direction)
                    local Dir = Prediction.AimDirection * ProjectileSpeed

                    return OldfireBProjectile(Dir, Origin, WeaponValue)
                end

                return OldfireBProjectile(Direction, Origin, WeaponValue)
            end))

            local simulateFirearmProjectile, OldSimulateFirearmProjectile = ((function()
                for _, v in next, getgc(true)do
                    local __DARKLUA_CONTINUE_74 = false

                    repeat
                        if typeof(v) ~= 'function' then
                            __DARKLUA_CONTINUE_74 = true

                            break
                        end

                        local info = debug.getinfo(v)

                        if string.match(info.source, 'WeaponsProjectilesClient') and info.name == 'simulateFirearmProjectile' then
                            return v
                        end

                        __DARKLUA_CONTINUE_74 = true
                    until true

                    if not __DARKLUA_CONTINUE_74 then
                        break
                    end
                end

                return nil
            end)())

            OldSimulateFirearmProjectile = hookfunction(simulateFirearmProjectile, LPH_NO_UPVALUES(function(Bullet, ExtraVelocity, Offset)
                if not Bullet.isLocal then
                    return OldSimulateFirearmProjectile(Bullet, ExtraVelocity, Offset)
                end

                local StartingPosition = Bullet.position

                if SilentAim.Config.Enabled and SilentAim.Config.Manipulation then
                    if not Bullet.__Target then
                        Bullet.__Target = SilentAim.TargetPart
                    end
                    if Bullet.__Target then
                        local Speed = Bullet.velocity.Magnitude

                        if Speed > 0 then
                            local TargetDirection = (Bullet.__Target.Position - Bullet.position).Unit

                            Bullet.velocity = TargetDirection * Speed
                        end
                    end
                end

                local Result = OldSimulateFirearmProjectile(Bullet, ExtraVelocity, Offset)

                if General.BulletTracers.Config.Enabled then
                    local EndPosition = Bullet.position

                    task.spawn(function()
                        local To, OnScreen2 = Camera:WorldToViewportPoint(EndPosition)
                        local From, OnScreen1 = Camera:WorldToViewportPoint(StartingPosition)
                        local Line = Utility.Draw('Line', {
                            Visible = false,
                            Color = General.BulletTracers.Config.Color,
                            To = Vector2.new(To.X, To.Y),
                            From = Vector2.new(From.X, From.Y),
                        })
                        local Connection = Shared.Services.RunService.RenderStepped:Connect(function()
                            To, OnScreen2 = Camera:WorldToViewportPoint(EndPosition)
                            From, OnScreen1 = Camera:WorldToViewportPoint(StartingPosition)

                            if OnScreen1 and OnScreen2 then
                                Line.Visible = true
                                Line.From = Vector2.new(From.X, From.Y)
                                Line.To = Vector2.new(To.X, To.Y)
                            else
                                Line.Visible = false
                            end
                        end)

                        task.delay(General.BulletTracers.Config.Duration, function()
                            local Duration, Start, Goal, StartTime = 0.15, Line.Transparency or 1, 0, tick()

                            while tick() - StartTime < Duration do
                                local Alpha = (tick() - StartTime) / Duration

                                Line.Transparency = Start + (Goal - Start) * Alpha

                                task.wait()
                            end

                            Line.Transparency = Goal

                            Connection:Disconnect()
                            Line:Destroy()
                        end)
                    end)
                end

                return Result
            end))

            return General
        end

        function init.m()
            local v = init.cache.m

            if not v then
                v = {
                    c = __modImpl(),
                }
                init.cache.m = v
            end

            return v.c
        end
    end
    do
        local __modImpl = function()
            return {
                HitboxExtender = init.j(),
                Melee = init.k(),
                Weapon = init.m(),
            }
        end

        function init.n()
            local v = init.cache.n

            if not v then
                v = {
                    c = __modImpl(),
                }
                init.cache.n = v
            end

            return v.c
        end
    end
    do
        local __modImpl = function()
            local Shared, Network = init.e(), init.g()
            local FlagRig, Flag = Shared.Modules:find('FlagRig', true), {
                Config = {InstantCapture = false},
            }

            LPH_NO_VIRTUALIZE(function()
                local OldPromptTriggered

                OldPromptTriggered = hookfunction(FlagRig.PromptTriggered, function(flagAction)
                    if Flag.Config.InstantCapture then
                        flagAction.promptBeganTime = nil

                        Network:FireEvent('EquipFlag', flagAction.flagModel)

                        return
                    end

                    return OldPromptTriggered(flagAction)
                end)

                local OldPromptBegan

                OldPromptBegan = hookfunction(FlagRig.PromptBegan, function(flagAction)
                    if Flag.Config.InstantCapture then
                        flagAction:PromptTriggered(flagAction)

                        return
                    end

                    return OldPromptBegan(flagAction)
                end)
            end)()

            return Flag
        end

        function init.o()
            local v = init.cache.o

            if not v then
                v = {
                    c = __modImpl(),
                }
                init.cache.o = v
            end

            return v.c
        end
    end
    do
        local __modImpl = function()
            return {
                Flag = init.o(),
            }
        end

        function init.p()
            local v = init.cache.p

            if not v then
                v = {
                    c = __modImpl(),
                }
                init.cache.p = v
            end

            return v.c
        end
    end
    do
        local __modImpl = function()
            return {
                Combat = init.n(),
                Misc = init.p(),
            }
        end

        function init.q()
            local v = init.cache.q

            if not v then
                v = {
                    c = __modImpl(),
                }
                init.cache.q = v
            end

            return v.c
        end
    end
end

local Library, LoadingClock = init.a(), os.clock()

for _, Connection in next, getconnections(game:GetService'ScriptContext'.Error)do
    local __DARKLUA_CONTINUE_76 = false

    repeat
        if not Connection then
            __DARKLUA_CONTINUE_76 = true

            break
        end
        if not Connection.LuaConnection then
            __DARKLUA_CONTINUE_76 = true

            break
        end
        if Connection.Function then
            hookfunction(Connection.Function, function()
                return
            end)
        end

        pcall(Connection.Disconnect)

        __DARKLUA_CONTINUE_76 = true
    until true

    if not __DARKLUA_CONTINUE_76 then
        break
    end
end

local CustomAsset, sounds = LPH_JIT_MAX(function(Path, Link)
    if isfile(Path) then
        return getcustomasset(Path)
    end
    if not isfile(Path) and Link then
        writefile(Path, game:HttpGet(Link))
    end

    return getcustomasset(Path)
end), {
    'discord',
    'mcbow',
    'minecraft',
    'minecraft_xp',
    'neverlose',
    'rust_headshot',
    'skeet',
    'stapler',
    'shooting_star',
    'bubble',
}

for _, v in next, sounds do
    CustomAsset('Hitsounds/' .. v .. '.wav', [[https://github.com/BlackDisciplesHook/Project-X-V3/raw/refs/heads/main/Hitsounds/]] .. v .. '.wav')
end

local Shared, Hooks, Features = init.e(), init.i(), init.q()
local Players, RunService, LocalPlayer = Shared.Services.Players, Shared.Services.RunService, Shared.Classes.LocalPlayer

RunService.PreRender:Connect(LPH_JIT_MAX(function()
    Features.Combat.Melee.Update()
    Features.Combat.HitboxExtender.Update()
    Features.Combat.Weapon.Aimbot.Update()
    Features.Combat.Weapon.SilentAim.Update()
end))

for _, Player in next, Players:GetPlayers()do
    if Player ~= LocalPlayer then
        Features.Combat.Melee.CreateLine(Player)
    end
end

Players.PlayerAdded:Connect(LPH_JIT_MAX(function(Player)
    if Player ~= LocalPlayer then
        Features.Combat.Melee.CreateLine(Player)
    end
end))
Players.PlayerRemoving:Connect(LPH_JIT_MAX(function(Player)
    if Player ~= LocalPlayer then
        Features.Combat.Melee.TargetLines[Player]:Remove()

        Features.Combat.Melee.TargetLines[Player] = nil
    end
end))
LPH_NO_VIRTUALIZE(function()
    Library.Theme.Accent = Color3.fromRGB(44, 124, 255)
    Library.Theme.Background = Color3.fromRGB(20, 20, 25)
    Library.Theme.Inline = Color3.fromRGB(25, 25, 30)

    local KeybindList = Library:KeybindList()

    KeybindList:SetVisibility(false)

    local Watermark, Window = Library:Watermark('84e Client - ' .. os.date'%b %d %Y' .. ' - ' .. game:GetService'MarketplaceService':GetProductInfoAsync(game.PlaceId).Name), Library:Window{
        Name = '84e Client - discord.gg/rgDXfnn4Md',
    }
    local Legit = Window:Page{
        Name = 'Legit',
        Columns = 2,
        Subtabs = false,
    }
    local SilentAimSection = Legit:ScrollableSection{
        Name = 'Silent Aim',
        Side = 1,
        Size = 350,
    }

    SilentAimSection:Toggle{
        Name = 'Enabled',
        Default = false,
        Flag = 'silent_aim_enabled',
        Callback = function(value)
            Features.Combat.Weapon.SilentAim.Config.Enabled = value
        end,
    }:Keybind{
        Name = 'Silent Aim',
        Mode = 'Toggle',
        Flag = 'silent_aim_bind',
        Callback = function(value)
            Features.Combat.Weapon.SilentAim.Toggled = value
        end,
    }
    SilentAimSection:Toggle{
        Name = 'Manipulation',
        Default = true,
        Flag = 'silent_aim_manipulation',
        Callback = function(value)
            Features.Combat.Weapon.SilentAim.Config.Manipulation = value
        end,
    }
    SilentAimSection:Divider()
    SilentAimSection:Slider{
        Name = 'Distance Limit',
        Min = 50,
        Default = 500,
        Max = 1000,
        Decimals = 1,
        Suffix = 'm',
        Flag = 'silent_aim_distancelimit',
        Callback = function(value)
            Features.Combat.Weapon.SilentAim.Config.DistanceLimit = value
        end,
    }
    SilentAimSection:Dropdown{
        Name = 'Hitpart',
        Items = {
            'Head',
            'Torso',
            'HumanoidRootPart',
        },
        Multi = false,
        Default = 'Torso',
        Flag = 'silent_aim_hitpart',
        Callback = function(value)
            Features.Combat.Weapon.SilentAim.Config.Hitpart = value
        end,
    }
    SilentAimSection:Dropdown{
        Name = 'Checks',
        Items = {
            'Visible',
            'Flag Bearer Priority',
        },
        Multi = true,
        Flag = 'silent_aim_checks',
        Callback = function(value)
            if table.find(value, 'Visible') then
                Features.Combat.Weapon.SilentAim.Config.VisibleCheck = true
            else
                Features.Combat.Weapon.SilentAim.Config.VisibleCheck = false
            end
            if table.find(value, 'Flag Bearer Priority') then
                Features.Combat.Weapon.SilentAim.Config.FlagBearerPriority = true
            else
                Features.Combat.Weapon.SilentAim.Config.FlagBearerPriority = true
            end
        end,
    }
    SilentAimSection:Divider()
    SilentAimSection:Toggle{
        Name = 'FOV Enabled',
        Default = false,
        Flag = 'silent_aim_fov_enabled',
        Callback = function(value)
            Features.Combat.Weapon.SilentAim.FOVConfig.Enabled = value
        end,
    }
    SilentAimSection:Toggle{
        Name = 'FOV Visible',
        Default = false,
        Flag = 'silent_aim_fov_visible',
        Callback = function(value)
            Features.Combat.Weapon.SilentAim.FOVConfig.Visible = value
        end,
    }:Colorpicker{
        Name = 'Color',
        Flag = 'silent_aim_fov_color',
        Alpha = 0,
        Default = Color3.fromRGB(44, 124, 254),
        Callback = function(value, Alpha)
            Features.Combat.Weapon.SilentAim.FOVConfig.Color = value
            Features.Combat.Weapon.SilentAim.FOVConfig.Transparency = Alpha
        end,
    }
    SilentAimSection:Toggle{
        Name = 'FOV Filled',
        Default = false,
        Flag = 'silent_aim_fov_filled',
        Callback = function(value)
            Features.Combat.Weapon.SilentAim.FOVConfig.Filled = value
        end,
    }:Colorpicker{
        Name = 'Fill Color',
        Flag = 'silent_aim_fov_fillcolor',
        Alpha = 0.3,
        Default = Color3.fromRGB(44, 124, 254),
        Callback = function(value, Alpha)
            Features.Combat.Weapon.SilentAim.FOVFillConfig.Color = value
            Features.Combat.Weapon.SilentAim.FOVFillConfig.Transparency = Alpha
        end,
    }
    SilentAimSection:Toggle{
        Name = 'FOV Outline',
        Default = false,
        Flag = 'silent_aim_fov_outlined',
        Callback = function(value)
            Features.Combat.Weapon.SilentAim.FOVConfig.Outline = value
        end,
    }
    SilentAimSection:Divider()
    SilentAimSection:Slider{
        Name = 'FOV Radius',
        Min = 1,
        Max = 1000,
        Decimals = 1,
        Default = 100,
        Suffix = 'px',
        Flag = 'silent_aim_fov_radius',
        Callback = function(value)
            Features.Combat.Weapon.SilentAim.FOVConfig.Radius = value
        end,
    }
    SilentAimSection:Slider{
        Name = 'FOV Sides',
        Min = 3,
        Max = 40,
        Decimals = 1,
        Default = 20,
        Suffix = ' Sides',
        Flag = 'silent_aim_fov_numsides',
        Callback = function(value)
            Features.Combat.Weapon.SilentAim.FOVConfig.NumSides = value
        end,
    }
    SilentAimSection:Divider()
    SilentAimSection:Toggle{
        Name = 'Line Enabled',
        Default = false,
        Flag = 'silent_aim_line_enabled',
        Callback = function(value)
            Features.Combat.Weapon.SilentAim.LineConfig.Enabled = value
        end,
    }
    SilentAimSection:Toggle{
        Name = 'Line Outline',
        Default = false,
        Flag = 'silent_aim_line_outlined',
        Callback = function(value)
            Features.Combat.Weapon.SilentAim.LineConfig.Outline = value
        end,
    }:Colorpicker{
        Name = 'Line Color',
        Flag = 'silent_aim_line_color',
        Alpha = 1,
        Default = Color3.new(1, 1, 1),
        Callback = function(value, Alpha)
            Features.Combat.Weapon.SilentAim.LineConfig.Color = value
            Features.Combat.Weapon.SilentAim.LineConfig.Transparency = Alpha
        end,
    }
    SilentAimSection:Slider{
        Name = 'Line Thickness',
        Min = 1,
        Max = 10,
        Default = 1,
        Decimals = 1,
        Suffix = 'px',
        Flag = 'silent_aim_line_thickness',
        Callback = function(value)
            Features.Combat.Weapon.SilentAim.LineConfig.Thickness = value
        end,
    }

    local AimbotSection = Legit:ScrollableSection{
        Name = 'Aimbot',
        Side = 2,
        Size = 350,
    }

    AimbotSection:Toggle{
        Name = 'Enabled',
        Default = false,
        Flag = 'aimbot_enabled',
        Callback = function(value)
            Features.Combat.Weapon.Aimbot.Config.Enabled = value
        end,
    }:Keybind{
        Name = 'Aimbot',
        Mode = 'Toggle',
        Flag = 'aimbot_bind',
        Callback = function(value)
            Features.Combat.Weapon.Aimbot.Toggled = value
        end,
    }
    AimbotSection:Divider()
    AimbotSection:Slider{
        Name = 'Distance Limit',
        Min = 50,
        Default = 500,
        Max = 1000,
        Decimals = 1,
        Suffix = 'm',
        Flag = 'aimbot_distancelimit',
        Callback = function(value)
            Features.Combat.Weapon.Aimbot.Config.DistanceLimit = value
        end,
    }
    AimbotSection:Slider{
        Name = 'Smoothing',
        Min = 0.01,
        Max = 1,
        Default = 0.5,
        Decimals = 0.01,
        Flag = 'aimbot_smoothing',
        Callback = function(value)
            Features.Combat.Weapon.Aimbot.Config.Smoothing = value
        end,
    }
    AimbotSection:Dropdown{
        Name = 'Hitpart',
        Items = {
            'Head',
            'Torso',
            'HumanoidRootPart',
        },
        Multi = false,
        Default = 'Torso',
        Flag = 'aimbot_hitpart',
        Callback = function(value)
            Features.Combat.Weapon.Aimbot.Config.Hitpart = value
        end,
    }
    AimbotSection:Dropdown{
        Name = 'Checks',
        Items = {
            'Visible',
            'Flag Bearer Priority',
        },
        Multi = true,
        Flag = 'aimbot_checks',
        Callback = function(value)
            if table.find(value, 'Visible') then
                Features.Combat.Weapon.Aimbot.Config.VisibleCheck = true
            else
                Features.Combat.Weapon.Aimbot.Config.VisibleCheck = false
            end
            if table.find(value, 'Flag Bearer Priority') then
                Features.Combat.Weapon.Aimbot.Config.FlagBearerPriority = true
            else
                Features.Combat.Weapon.Aimbot.Config.FlagBearerPriority = false
            end
        end,
    }
    AimbotSection:Divider()
    AimbotSection:Toggle{
        Name = 'FOV Enabled',
        Default = false,
        Flag = 'aimbot_fov_enabled',
        Callback = function(value)
            Features.Combat.Weapon.Aimbot.FOVConfig.Enabled = value
        end,
    }
    AimbotSection:Toggle{
        Name = 'FOV Visible',
        Default = false,
        Flag = 'aimbot_fov_visible',
        Callback = function(value)
            Features.Combat.Weapon.Aimbot.FOVConfig.Visible = value
        end,
    }:Colorpicker{
        Name = 'Color',
        Flag = 'aimbot_fov_color',
        Alpha = 0,
        Default = Color3.fromRGB(44, 124, 254),
        Callback = function(value, Alpha)
            Features.Combat.Weapon.Aimbot.FOVConfig.Color = value
            Features.Combat.Weapon.Aimbot.FOVConfig.Transparency = Alpha
        end,
    }
    AimbotSection:Toggle{
        Name = 'FOV Filled',
        Default = false,
        Flag = 'aimbot_fov_filled',
        Callback = function(value)
            Features.Combat.Weapon.Aimbot.FOVConfig.Filled = value
        end,
    }:Colorpicker{
        Name = 'Fill Color',
        Flag = 'aimbot_fov_fillcolor',
        Alpha = 0.7,
        Default = Color3.fromRGB(44, 124, 254),
        Callback = function(value, Alpha)
            Features.Combat.Weapon.Aimbot.FOVFillConfig.Color = value
            Features.Combat.Weapon.Aimbot.FOVFillConfig.Transparency = Alpha
        end,
    }
    AimbotSection:Toggle{
        Name = 'FOV Outline',
        Default = false,
        Flag = 'aimbot_fov_outlined',
        Callback = function(value)
            Features.Combat.Weapon.Aimbot.FOVConfig.Outline = value
        end,
    }
    AimbotSection:Divider()
    AimbotSection:Slider{
        Name = 'FOV Radius',
        Min = 1,
        Max = 1000,
        Default = 100,
        Decimals = 1,
        Suffix = 'px',
        Flag = 'aimbot_fov_radius',
        Callback = function(value)
            Features.Combat.Weapon.Aimbot.FOVConfig.Radius = value
        end,
    }
    AimbotSection:Slider{
        Name = 'FOV Sides',
        Min = 3,
        Max = 40,
        Default = 20,
        Decimals = 1,
        Suffix = ' Sides',
        Flag = 'aimbot_fov_numsides',
        Callback = function(value)
            Features.Combat.Weapon.Aimbot.FOVConfig.NumSides = value
        end,
    }
    AimbotSection:Divider()
    AimbotSection:Toggle{
        Name = 'Line Enabled',
        Default = false,
        Flag = 'aimbot_line_enabled',
        Callback = function(value)
            Features.Combat.Weapon.Aimbot.LineConfig.Enabled = value
        end,
    }
    AimbotSection:Toggle{
        Name = 'Line Outline',
        Default = false,
        Flag = 'aimbot_line_outlined',
        Callback = function(value)
            Features.Combat.Weapon.Aimbot.LineConfig.Outline = value
        end,
    }:Colorpicker{
        Name = 'Line Color',
        Flag = 'aimbot_line_color',
        Alpha = 1,
        Default = Color3.new(1, 1, 1),
        Callback = function(value, Alpha)
            Features.Combat.Weapon.Aimbot.LineConfig.Color = value
            Features.Combat.Weapon.Aimbot.LineConfig.Transparency = Alpha
        end,
    }
    AimbotSection:Slider{
        Name = 'Line Thickness',
        Min = 1,
        Max = 10,
        Default = 1,
        Decimals = 1,
        Suffix = 'px',
        Flag = 'aimbot_line_thickness',
        Callback = function(value)
            Features.Combat.Weapon.Aimbot.LineConfig.Thickness = value
        end,
    }

    local HitboxExtenderSection = Legit:Section{
        Name = 'Hitbox Extender',
        Side = 1,
    }

    HitboxExtenderSection:Toggle{
        Name = 'Enabled',
        Default = false,
        Flag = 'hbe_enabled',
        Callback = function(value)
            Features.Combat.HitboxExtender.Config.Enabled = value

            if not value then
                Features.Combat.HitboxExtender.OnDisable()
            end
        end,
    }:Colorpicker{
        Name = 'Color',
        Flag = 'hbe_color',
        Alpha = 0,
        Default = Color3.new(1, 1, 1),
        Callback = function(value, Alpha)
            Features.Combat.HitboxExtender.Config.Color = value
            Features.Combat.HitboxExtender.Config.Transparency = Alpha
        end,
    }
    HitboxExtenderSection:Slider{
        Name = 'Size Increase',
        Min = 1.1,
        Max = 10,
        Default = 1.1,
        Decimals = 0.1,
        Suffix = 'x',
        Flag = 'hbe_size_increase',
        Callback = function(value)
            Features.Combat.HitboxExtender.Config.SizeIncrease = value
        end,
    }

    local Rage = Window:Page{
        Name = 'Rage',
        Columns = 2,
        Subtabs = false,
    }
    local MeleeAuraSection = Rage:Section{
        Name = 'Melee Aura',
        Side = 1,
    }

    MeleeAuraSection:Toggle{
        Name = 'Enabled',
        Flag = 'melee_aura_enabled',
        Default = false,
        Callback = function(value)
            Features.Combat.Melee.Config.Aura = value
        end,
    }:Keybind{
        Name = 'Melee Aura',
        Mode = 'Toggle',
        Flag = 'melee_aura_bind',
        Callback = function(value)
            Features.Combat.Melee.Toggled = value
        end,
    }

    local RangeSlider

    MeleeAuraSection:Toggle{
        Name = 'Bypass Range Check',
        Flag = 'melee_aura_range_check_bypass',
        Default = false,
        Callback = function(value)
            Features.Combat.Melee.Config.BypassRangeCheck = value

            if RangeSlider then
                if value then
                    RangeSlider:SetMax(20)
                else
                    RangeSlider:SetMax(10)
                end

                RangeSlider:Set(Library.Flags.melee_aura_range)
            end
        end,
    }

    RangeSlider = MeleeAuraSection:Slider{
        Name = 'Range',
        Min = 1,
        Max = 11,
        Default = 1,
        Decimals = 1,
        Suffix = 'm',
        Flag = 'melee_aura_range',
        Callback = function(value)
            Features.Combat.Melee.Config.AuraRange = value
        end,
    }

    MeleeAuraSection:Slider{
        Name = 'Delay',
        Min = 0.15,
        Max = 1,
        Default = 0.5,
        Decimals = 0.05,
        Suffix = 's',
        Flag = 'melee_aura_delay',
        Callback = function(value)
            Features.Combat.Melee.Config.AuraAttackDelay = value
        end,
    }
    MeleeAuraSection:Divider()
    MeleeAuraSection:Toggle{
        Name = 'Visualize Area',
        Flag = 'melee_aura_show_aura_range',
        Default = false,
        Callback = function(value)
            Features.Combat.Melee.Config.ShowAuraRange = value
        end,
    }:Colorpicker{
        Name = 'Color',
        Flag = 'melee_aura_area_color',
        Default = Color3.new(1, 1, 1),
        Callback = function(value)
            Features.Combat.Melee.Config.ShowAuraRangeColor = value
        end,
    }
    MeleeAuraSection:Toggle{
        Name = 'Target Line',
        Flag = 'melee_aura_show_aura_target',
        Default = false,
        Callback = function(value)
            Features.Combat.Melee.Config.ShowAuraTarget = value
        end,
    }:Colorpicker{
        Name = 'Color',
        Flag = 'melee_aura_line_color',
        Default = Color3.new(1, 1, 1),
        Callback = function(value)
            Features.Combat.Melee.Config.ShowAuraTargetColor = value
        end,
    }

    local Visuals = Window:Page{
        Name = 'Visuals',
        Columns = 2,
        Subtabs = false,
    }
    local BulletTracersSection = Visuals:Section{
        Name = 'Bullet Tracers',
        Side = 1,
    }

    BulletTracersSection:Toggle{
        Name = 'Enabled',
        Flag = 'bullet_tracers_enabled',
        Default = false,
        Callback = function(value)
            Features.Combat.Weapon.BulletTracers.Config.Enabled = value
        end,
    }:Colorpicker{
        Name = 'Color',
        Flag = 'bullet_tracers_color',
        Default = Color3.new(1, 1, 1),
        Callback = function(value)
            Features.Combat.Weapon.BulletTracers.Config.Color = value
        end,
    }
    BulletTracersSection:Slider{
        Name = 'Duration',
        Min = 0.1,
        Max = 10,
        Default = 5,
        Decimals = 0.1,
        Suffix = 's',
        Flag = 'bullet_tracers_lifetime',
        Callback = function(value)
            Features.Combat.Weapon.BulletTracers.Config.Duration = value
        end,
    }

    local Misc = Window:Page{
        Name = 'Misc',
        Columns = 2,
        Subtabs = false,
    }
    local ClientModsSection = Misc:Section{
        Name = 'Client Mods',
        Side = 1,
    }

    ClientModsSection:Toggle{
        Name = 'Instant Flag Prompt',
        Flag = 'instant_flag_capture_and_pick_up',
        Default = false,
        Callback = function(value)
            Features.Misc.Flag.Config.InstantCapture = value
        end,
    }

    local IndicatorSection, GuiSounds = Misc:Section{
        Name = 'Hit Indicators',
        Side = 2,
    }, Shared.Modules:find'GuiSounds'

    require(GuiSounds).CustomVolume = 1

    IndicatorSection:Dropdown{
        Name = 'Sound',
        Items = sounds,
        Flag = 'hitmarker_sound',
        Callback = function(value)
            if not value then
                require(GuiSounds).CustomSound = false
                GuiSounds.Hitmark.SoundId = 'rbxassetid://6142895975'

                return
            end

            require(GuiSounds).CustomSound = true
            GuiSounds.Hitmark.SoundId = CustomAsset('Hitsounds/' .. value .. '.wav')

            Hooks.Notifications.playHitmarkSound()
        end,
    }
    IndicatorSection:Slider{
        Name = 'Volume',
        Min = 1,
        Max = 100,
        Default = 100,
        Decimals = 1,
        Suffix = '%',
        Flag = 'hitmarker_volume',
        Callback = function(value)
            require(GuiSounds).CustomVolume = value / 100
        end,
    }
    IndicatorSection:Divider()
    IndicatorSection:Toggle{
        Name = 'Notification',
        Flag = 'damage_notifications_enabled',
        Default = false,
        Callback = function(value) end,
    }

    local Settings = Window:Page{
        Name = 'Settings',
        Columns = 2,
        Subtabs = false,
    }
    local SettingsSection, ConfigsSection = Settings:Section{
        Name = 'Settings',
        Side = 2,
    }, Settings:Section{
        Name = 'Profiles',
        Side = 1,
    }

    for Index, value in Library.Theme do
        SettingsSection:Label{
            Name = Index,
            Alignment = 'Left',
        }:Colorpicker{
            Name = Index,
            Default = value,
            Flag = 'Theme' .. Index,
            Callback = function(Color)
                Library.Theme[Index] = Color

                Library:ChangeTheme(Index, Color)
            end,
        }
    end

    SettingsSection:Label{
        Name = 'Menu Keybind',
        Alignment = 'Left',
    }:Keybind{
        Name = 'Menu Keybind',
        Flag = 'Menu Keybind',
        Default = Enum.KeyCode.F1,
        Mode = 'Toggle',
        Callback = function(value)
            Library.MenuKeybind = Library.Flags['Menu Keybind'].Key
        end,
    }
    SettingsSection:Toggle{
        Name = 'Watermark',
        Flag = 'Watermark',
        Default = true,
        Callback = function(value)
            Watermark:SetVisibility(value)
        end,
    }
    SettingsSection:Toggle{
        Name = 'Keybind List',
        Flag = 'Keybind List',
        Default = false,
        Callback = function(value)
            KeybindList:SetVisibility(value)
        end,
    }
    SettingsSection:Dropdown{
        Name = 'Tweening Style',
        Flag = 'Tweening Style',
        Default = 'Exponential',
        Items = {
            'Linear',
            'Sine',
            'Quad',
            'Cubic',
            'Quart',
            'Quint',
            'Exponential',
            'Circular',
            'Back',
            'Elastic',
            'Bounce',
        },
        Callback = function(value)
            Library.Tween.Style = Enum.EasingStyle[value]
        end,
    }
    SettingsSection:Dropdown{
        Name = 'Tweening Direction',
        Flag = 'Tweening Direction',
        Default = 'Out',
        Items = {
            'In',
            'Out',
            'InOut',
        },
        Callback = function(value)
            Library.Tween.Direction = Enum.EasingDirection[value]
        end,
    }
    SettingsSection:Slider{
        Name = 'Tweening Time',
        Min = 0,
        Max = 5,
        Default = 0.25,
        Decimals = 0.01,
        Flag = 'Tweening Time',
        Callback = function(value)
            Library.Tween.Time = value
        end,
    }

    local ConfigName, ConfigSelected
    local ConfigsListbox = ConfigsSection:Listbox{
        Items = {},
        Name = 'Configs',
        Flag = 'Configs List',
        Callback = function(value)
            ConfigSelected = value
        end,
    }

    ConfigsSection:Textbox{
        Name = 'Config Name',
        Placeholder = '. .',
        Flag = 'Config Name',
        Callback = function(value)
            ConfigName = value
        end,
    }
    ConfigsSection:Button{
        Name = 'Create Config',
        Callback = function()
            if not isfile(Library.Folders.Configs .. '/' .. ConfigName .. '.json') then
                writefile(Library.Folders.Configs .. '/' .. ConfigName .. '.json', Library:GetConfig())
                Library:RefreshConfigsList(ConfigsListbox)
            else
                Library:Notification("Config '" .. ConfigName .. ".json' already exists", 3, Color3.FromR(255, 0, 0))

                return
            end
        end,
    }
    ConfigsSection:Button{
        Name = 'Load Config',
        Callback = function()
            if ConfigSelected then
                Library:LoadConfig(readfile(Library.Folders.Configs .. '/' .. ConfigSelected))
            end

            Library:Thread(function()
                task.wait(0.1)

                for Index, value in Library.Theme do
                    Library.Theme[Index] = Library.Flags['Theme' .. Index].Color

                    Library:ChangeTheme(Index, Library.Flags['Theme' .. Index].Color)
                end
            end)
        end,
    }
    ConfigsSection:Button{
        Name = 'Delete Config',
        Callback = function()
            if ConfigSelected then
                Library:DeleteConfig(ConfigSelected)
                Library:RefreshConfigsList(ConfigsListbox)
            end
        end,
    }
    ConfigsSection:Button{
        Name = 'Save Config',
        Callback = function()
            if ConfigSelected then
                Library:SaveConfig(ConfigSelected)
            end
        end,
    }
    ConfigsSection:Button{
        Name = 'Refresh Configs',
        Callback = function()
            Library:RefreshConfigsList(ConfigsListbox)
        end,
    }
    Library:RefreshConfigsList(ConfigsListbox)
    Library:Notification(string.format('Loaded in: %.3ss', os.clock() - LoadingClock), 5, Library.Theme.Accent)
end)()
