object FormMain: TFormMain
  Left = 341
  Top = 206
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #28857#28783#28216#25103
  ClientHeight = 266
  ClientWidth = 502
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  Position = poDesigned
  OnClose = FormClose
  OnCreate = FormCreate
  OnMouseDown = FormMouseDown
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu: TMainMenu
    object MenuGame: TMenuItem
      Caption = #28216#25103
      object MenuGameStart: TMenuItem
        Caption = #24320#22987
        OnClick = MenuGameStartClick
      end
      object MenuExit: TMenuItem
        Caption = #36864#20986
        OnClick = MenuExitClick
      end
    end
    object MenuConfig: TMenuItem
      Caption = #35774#32622
      object MenuDif: TMenuItem
        Caption = #38590#24230
        object MenuDifLow: TMenuItem
          Caption = #21021#32423
          OnClick = MenuDifLowClick
        end
        object MenuDifMedium: TMenuItem
          Caption = #20013#32423
          OnClick = MenuDifMediumClick
        end
        object MenuDifHigh: TMenuItem
          Caption = #39640#32423
          OnClick = MenuDifHighClick
        end
      end
      object MenuConfigRecord: TMenuItem
        Caption = #35760#24405
        object MenuRecordShow: TMenuItem
          Caption = #26174#31034
          OnClick = MenuRecordShowClick
        end
        object MenuRecordReshow: TMenuItem
          Caption = #28436#31034
          OnClick = MenuRecordReshowClick
        end
        object MenuRecordSave: TMenuItem
          Caption = #20445#23384
          OnClick = MenuRecordSaveClick
        end
        object MenuRecordLoad: TMenuItem
          Caption = #36733#20837
          OnClick = MenuRecordLoadClick
        end
      end
    end
    object MenuAbout: TMenuItem
      Caption = #24110#21161
      OnClick = MenuAboutClick
    end
  end
  object TimerRecordShow: TTimer
    Enabled = False
    Interval = 50
    OnTimer = TimerRecordShowTimer
    Left = 32
  end
end
