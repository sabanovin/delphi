object Form1: TForm1
  Left = 274
  Top = 0
  Caption = 'Form1'
  ClientHeight = 588
  ClientWidth = 856
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object lable1: TLabel
    Left = 120
    Top = 499
    Width = 34
    Height = 13
    Caption = 'Result:'
  end
  object Label1: TLabel
    Left = 108
    Top = 456
    Width = 46
    Height = 13
    Caption = 'Message:'
  end
  object Label2: TLabel
    Left = 75
    Top = 422
    Width = 79
    Height = 13
    Caption = 'Response Code:'
  end
  object Label3: TLabel
    Left = 89
    Top = 11
    Width = 65
    Height = 13
    Caption = 'Your Api Key:'
  end
  object Label4: TLabel
    Left = 85
    Top = 42
    Width = 69
    Height = 13
    Caption = 'YourGateway:'
  end
  object Label5: TLabel
    Left = 245
    Top = 134
    Width = 255
    Height = 13
    Caption = 'Your Numbers:example(09398238801,09175555555)'
  end
  object Label6: TLabel
    Left = 449
    Top = 174
    Width = 51
    Height = 13
    Caption = 'Your Text:'
  end
  object Label7: TLabel
    Left = 245
    Top = 246
    Width = 158
    Height = 13
    Caption = 'From Date:Exapmle(1397/04/05)'
  end
  object Label8: TLabel
    Left = 521
    Top = 246
    Width = 146
    Height = 13
    Caption = 'To Date:Exapmle(1397/05/12)'
  end
  object Label9: TLabel
    Left = 245
    Top = 302
    Width = 43
    Height = 13
    Caption = 'Group_id'
  end
  object TLabel
    Left = 449
    Top = 302
    Width = 41
    Height = 13
    Caption = 'Number:'
  end
  object Label10: TLabel
    Left = 260
    Top = 350
    Width = 230
    Height = 13
    Caption = 'Numbers:example(09398238801,09399999999)'
  end
  object TLabel
    Left = 324
    Top = 376
    Width = 166
    Height = 13
    Caption = 'Your Textes:Example(text1,text2)'
  end
  object Panel1: TPanel
    Left = 0
    Top = 111
    Width = 865
    Height = 9
    Color = clSkyBlue
    ParentBackground = False
    TabOrder = 6
  end
  object Button1: TButton
    Left = 75
    Top = 80
    Width = 158
    Height = 25
    Caption = 'Get Balance'
    TabOrder = 0
    OnClick = Button1Click
  end
  object result_txt: TMemo
    Left = 168
    Top = 496
    Width = 665
    Height = 89
    ReadOnly = True
    TabOrder = 1
  end
  object message_txt: TMemo
    Left = 168
    Top = 453
    Width = 665
    Height = 28
    ReadOnly = True
    TabOrder = 2
  end
  object response_code_txt: TMemo
    Left = 168
    Top = 419
    Width = 665
    Height = 28
    ReadOnly = True
    TabOrder = 3
  end
  object apikey_txt: TMemo
    Left = 168
    Top = 8
    Width = 665
    Height = 25
    Lines.Strings = (
      'sa659126429:mLumyhIpZsDYyIo1PNhiPq9O0UpdZiOYoE6q')
    TabOrder = 4
  end
  object gateway_txt: TMemo
    Left = 168
    Top = 39
    Width = 665
    Height = 25
    Lines.Strings = (
      '10009398238801')
    TabOrder = 5
  end
  object Button2: TButton
    Left = 75
    Top = 129
    Width = 158
    Height = 25
    Caption = 'Send Single Or Group Sms'
    TabOrder = 7
    OnClick = Button2Click
  end
  object single_or_group_numbers_txt: TMemo
    Left = 530
    Top = 126
    Width = 303
    Height = 25
    TabOrder = 8
  end
  object Panel2: TPanel
    Left = 0
    Top = 218
    Width = 865
    Height = 9
    Color = clSkyBlue
    ParentBackground = False
    TabOrder = 9
  end
  object single_or_group_text_txt: TMemo
    Left = 530
    Top = 171
    Width = 303
    Height = 41
    TabOrder = 10
  end
  object Panel3: TPanel
    Left = 0
    Top = 65
    Width = 865
    Height = 9
    Color = clSkyBlue
    ParentBackground = False
    TabOrder = 11
  end
  object Button3: TButton
    Left = 75
    Top = 241
    Width = 158
    Height = 25
    Caption = 'Get Smses'
    TabOrder = 12
    OnClick = Button3Click
  end
  object from_date_txt: TMemo
    Left = 409
    Top = 243
    Width = 91
    Height = 25
    TabOrder = 13
  end
  object to_date_txt: TMemo
    Left = 673
    Top = 243
    Width = 160
    Height = 25
    TabOrder = 14
  end
  object Panel4: TPanel
    Left = 0
    Top = 274
    Width = 865
    Height = 9
    Color = clSkyBlue
    ParentBackground = False
    TabOrder = 15
  end
  object Button4: TButton
    Left = 75
    Top = 297
    Width = 158
    Height = 25
    Caption = 'Add To Phonebook'
    TabOrder = 16
    OnClick = Button4Click
  end
  object group_id_txt: TMemo
    Left = 294
    Top = 299
    Width = 131
    Height = 25
    TabOrder = 17
  end
  object phonebook_number_txt: TMemo
    Left = 496
    Top = 299
    Width = 337
    Height = 25
    TabOrder = 18
  end
  object Panel5: TPanel
    Left = -3
    Top = 330
    Width = 865
    Height = 9
    Color = clSkyBlue
    ParentBackground = False
    TabOrder = 19
  end
  object Button5: TButton
    Left = 75
    Top = 345
    Width = 158
    Height = 25
    Caption = 'Send Pair to Pair Sms'
    TabOrder = 20
    OnClick = Button5Click
  end
  object pair_to_pair_numbers_txt: TMemo
    Left = 496
    Top = 345
    Width = 337
    Height = 25
    TabOrder = 21
  end
  object pair_to_pair_text_txt: TMemo
    Left = 496
    Top = 373
    Width = 337
    Height = 25
    TabOrder = 22
  end
  object Panel6: TPanel
    Left = 0
    Top = 404
    Width = 865
    Height = 9
    Color = clSkyBlue
    ParentBackground = False
    TabOrder = 23
  end
end
