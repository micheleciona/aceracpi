/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20051117
 *
 * Disassembly of dsdt.dat, Mon Dec  5 20:45:17 2005
 */
DefinitionBlock ("DSDT.aml", "DSDT", 1, "Acer", "FALCON25", 0x00000001)
{
    Scope (\)
    {
        Name (LIDS, 0x01)
        Name (LIDF, 0x00)
        Name (ACST, 0x00)
        Name (DAT4, 0x00)
        Name (PCRD, 0x00)
        Name (USBD, 0x00)
        Name (VGAS, 0x00)
        Name (CRTS, 0x00)
        Name (LCDS, 0x00)
        Name (CNT0, 0x00)
        OperationRegion (PM00, SystemIO, 0xF120, 0x08)
        Field (PM00, WordAcc, NoLock, Preserve)
        {
            PM20,   64
        }

        OperationRegion (PM01, SystemIO, 0xF118, 0x08)
        Field (PM01, WordAcc, NoLock, Preserve)
        {
            PM18,   64
        }

        OperationRegion (PM02, SystemIO, 0xF130, 0x01)
        Field (PM02, ByteAcc, NoLock, Preserve)
        {
            PM30,   8
        }

        OperationRegion (SLP0, SystemIO, 0xF105, 0x01)
        Field (SLP0, ByteAcc, NoLock, Preserve)
        {
            PM05,   8
        }

        OperationRegion (PM03, SystemIO, 0xF110, 0x01)
        Field (PM03, ByteAcc, NoLock, Preserve)
        {
            PM10,   8
        }

        OperationRegion (MEM1, SystemMemory, 0x04F0, 0x01)
        Field (MEM1, ByteAcc, NoLock, Preserve)
        {
            DAT0,   8
        }

        OperationRegion (MEM2, SystemMemory, 0x04F1, 0x01)
        Field (MEM2, ByteAcc, NoLock, Preserve)
        {
            DAT1,   8
        }

        OperationRegion (MEM3, SystemMemory, 0x04F2, 0x01)
        Field (MEM3, ByteAcc, NoLock, Preserve)
        {
            DAT2,   8
        }

        OperationRegion (MEM4, SystemMemory, 0x04F3, 0x01)
        Field (MEM4, ByteAcc, NoLock, Preserve)
        {
            DAT3,   8
        }

        OperationRegion (MEM5, SystemMemory, 0x04F4, 0x01)
        Field (MEM5, ByteAcc, NoLock, Preserve)
        {
            DAT5,   8
        }
    }

    Scope (\_PR)
    {
        Processor (\_PR.CPU0, 0x01, 0x0000F110, 0x06) {}
    }

    Name (\_S0, Package (0x02)
    {
        0x00, 
        0x00
    })
    Name (\_S1, Package (0x02)
    {
        0x01, 
        0x01
    })
    Name (\_S4, Package (0x02)
    {
        0x04, 
        0x04
    })
    Name (\_S5, Package (0x02)
    {
        0x05, 
        0x05
    })
    Method (\_PTS, 1, NotSerialized)
    {
        Store (Arg0, \_SB.PCI0.AD4S.PX80)
        If (LOr (LEqual (SizeOf (\_OS), 0x11), LEqual (SizeOf (\_OS), 0x27)))
        {
            Or (\_SB.PCI0.AD4S.CS3B, 0x10, \_SB.PCI0.AD4S.CS3B)
        }
        Else
        {
            And (\_SB.PCI0.AD4S.CS3B, 0xEF, \_SB.PCI0.AD4S.CS3B)
        }

        Store (0x03, \_SB.PCI0.OBAU.RAE0)
        Store (0x00, \_SB.PCI0.MX71.R0AC)
        If (LOr (LEqual (Arg0, 0x01), LEqual (Arg0, 0x04)))
        {
            Store (0x01, \LIDF)
            And (\_SB.PCI0.MX71.R087, 0x5F, \_SB.PCI0.MX71.R087)
            If (LEqual (Arg0, 0x01))
            {
                Or (\_SB.PCI0.OZ68.PMES, 0x01, \_SB.PCI0.OZ68.PMES)
                Or (\_SB.PCI0.OZ69.PM1S, 0x01, \_SB.PCI0.OZ69.PM1S)
                Store (0x2A, \_SB.PCI0.AD4S.EC0.P62T)
                Store (0x2A, \_SB.PCI0.AD4S.EC0.P63T)
                Store (0x2A, \_SB.PCI0.AD4S.EC0.P64T)
                Store (0x2A, \_SB.PCI0.AD4S.EC0.P65T)
                If (LEqual (SizeOf (\_OS), 0x11))
                {
                    Store (0x38, \_SB.PCI0.AD4S.PXB1)
                    Store (0x80, \_SB.PCI0.MX71.R045)
                }
                Else
                {
                    Store (0x39, \_SB.PCI0.AD4S.PXB1)
                    Store (0xFF, \_SB.PCI0.MX71.R049)
                    Store (0x80, \_SB.PCI0.MX71.R045)
                }

                And (PM05, 0xE3, PM05)
                Store (0xAA, \DAT5)
                And (\_SB.PCI0.AD4S.CS4A, 0xDF, \_SB.PCI0.AD4S.CS4A)
            }

            If (LEqual (Arg0, 0x04))
            {
                And (\_SB.PCI0.MX71.R087, 0x53, \_SB.PCI0.MX71.R087)
                Store (0x33, \_SB.PCI0.AD4S.CS58)
                Store (0x37, \_SB.PCI0.AD4S.PXB1)
                Store (0x01, \_SB.PCI0.MX71.R046)
            }
        }

        If (LEqual (Arg0, 0x05))
        {
            Store (0x37, \_SB.PCI0.AD4S.PXB1)
            Store (0x01, \_SB.PCI0.MX71.R046)
        }
    }

    Method (\_WAK, 1, NotSerialized)
    {
        Store (0x12, \_SB.PCI0.AD4S.PX80)
        If (LEqual (SizeOf (\_OS), 0x11)) {}
        Else
        {
            Sleep (0x03E8)
        }

        Store (0x64, \_SB.PCI0.AD4S.PXB1)
        Store (\_SB.PCI0.OBLN.PMES, Local0)
        Store (Local0, \_SB.PCI0.OBLN.PMES)
        And (\_SB.PCI0.MX71.R088, 0x02, Local0)
        If (LEqual (Local0, 0x02))
        {
            Store (0x00, \_SB.PCI0.MX71.PLED)
        }
        Else
        {
            Store (0x08, \_SB.PCI0.MX71.PLED)
        }

        And (\_SB.PCI0.MX71.R098, 0x02, Local0)
        If (LEqual (Local0, 0x02))
        {
            Store (0x00, \_SB.PCI0.MX71.PLED)
        }

        Or (\_SB.PCI0.MX71.R087, 0x60, \_SB.PCI0.MX71.R087)
        If (LEqual (Arg0, 0x01))
        {
            Or (\_SB.PCI0.OBAU.RA46, 0x04, \_SB.PCI0.OBAU.RA46)
            Sleep (0x01)
            \_SB.PCI0.AD4S.ENCF ()
            Store (0x03, \_SB.PCI0.AD4S.LDN)
            Store (0x01, \_SB.PCI0.AD4S.ACTR)
            \_SB.PCI0.AD4S.EXCF ()
            Store (0x31, \_SB.PCI0.AD4S.PXB1)
            Or (\_SB.PCI0.OZ68.PMES, 0x80, \_SB.PCI0.OZ68.PMES)
            Or (\_SB.PCI0.OZ69.PM1S, 0x80, \_SB.PCI0.OZ69.PM1S)
            Store (0x00, \_SB.PCI0.MX71.R045)
            And (\_SB.PCI0.MX71.R046, 0xFB, \_SB.PCI0.MX71.R046)
            Store (0x80, \_SB.PCI0.AD4S.EC0.P62T)
            Store (0x80, \_SB.PCI0.AD4S.EC0.P63T)
            Store (0x80, \_SB.PCI0.AD4S.EC0.P64T)
            Store (0x80, \_SB.PCI0.AD4S.EC0.P65T)
            \_SB.PCI0.AD4S.EC0.ECC5 (0x4A)
            Store (0x00, \_SB.PCI0.AD4S.EC0.DAT1)
            Store (0xC9, \_SB.PCI0.AD4S.EC0.CMCD)
            Store (\_SB.PCI0.AD4S.EC0.DAT1, Local0)
            If (LAnd (LNot (LLess (Local0, 0x32)), LNot (LGreater (Local0, 0x35))))
            {
                Add (Local0, 0x15, Local0)
                Store (Local0, \_SB.PCI0.AD4S.PXB1)
            }

            And (\_SB.PCI0.MX71.R088, 0x80, Local0)
            If (LEqual (Local0, 0x80))
            {
                Store (0x01, \LIDS)
            }
            Else
            {
                Store (0x00, \LIDS)
            }

            Store (0x00, \LIDF)
            And (\_SB.PCI0.AD4S.CS4A, 0x20, Local0)
            If (LNot (LEqual (Local0, 0x20)))
            {
                Notify (\_SB.SLPB, 0x02)
            }
            Else
            {
                If (LEqual (SizeOf (\_OS), 0x11))
                {
                    Notify (\_SB.SLPB, 0x02)
                }
            }

            And (\_SB.PCI0.OBAU.RA46, 0xFB, \_SB.PCI0.OBAU.RA46)
        }

        If (LEqual (Arg0, 0x04))
        {
            Store (0xAA, \_SB.PCI0.AD4S.CS58)
            Notify (\_SB.BAT0, 0x81)
            Notify (\_SB.SLPB, 0x02)
        }

        If (LEqual (\DAT5, 0xAA)) {}
        Else
        {
            If (LEqual (SizeOf (\_OS), 0x11))
            {
                Notify (\_SB.SLPB, 0x02)
            }
        }
    Return(Package(0x02){0x00, 0x00})
    }

    Scope (\_SI)
    {
        Method (_SST, 1, NotSerialized)
        {
            If (LEqual (Arg0, 0x00))
            {
                Or (\_SB.PCI0.MX71.R09D, 0x10, \_SB.PCI0.MX71.R09D)
            }

            If (LOr (LEqual (Arg0, 0x01), LEqual (Arg0, 0x02)))
            {
                Or (\_SB.PCI0.MX71.R09D, 0x10, \_SB.PCI0.MX71.R09D)
            }

            If (LEqual (Arg0, 0x03))
            {
                And (\_SB.PCI0.MX71.R09D, 0xEF, \_SB.PCI0.MX71.R09D)
            }

            If (LEqual (Arg0, 0x04))
            {
                And (\_SB.PCI0.MX71.LED0, 0xFC, \_SB.PCI0.MX71.LED0)
                Or (\_SB.PCI0.MX71.LED0, 0x02, \_SB.PCI0.MX71.LED0)
            }
        }

        Method (_MSG, 1, NotSerialized)
        {
            If (LEqual (Arg0, 0x00))
            {
                And (\_SB.PCI0.MX71.LED0, 0xFC, Local0)
                Store (Local0, \_SB.PCI0.MX71.LED0)
            }
            Else
            {
                Or (\_SB.PCI0.MX71.LED0, 0x03, \_SB.PCI0.MX71.LED0)
            }
        }
    }

    Name (TP1H, 0x0CDC)
    Name (TP1L, 0x0CBE)
    Name (TPH1, 0x0CD2)
    Name (TPH2, 0x0D18)
    Name (TPH3, 0x0D5E)
    Name (TPL0, 0xFF)
    Name (TPL1, 0x0CB4)
    Name (TPL2, 0x0CFA)
    Name (TPL3, 0x0D40)
    Name (TPC1, 0x0DFE)
    Name (FANS, 0xFF)
    Name (TBUF, Buffer (0x06)
    {
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    })
    CreateByteField (TBUF, 0x00, DB00)
    CreateByteField (TBUF, 0x01, DB01)
    CreateByteField (TBUF, 0x02, DB02)
    CreateByteField (TBUF, 0x03, DB03)
    CreateByteField (TBUF, 0x02, DB04)
    CreateByteField (TBUF, 0x03, DB05)
    CreateWordField (TBUF, 0x00, DW00)
    CreateWordField (TBUF, 0x02, DW01)
    CreateWordField (TBUF, 0x02, DW02)
    CreateDWordField (TBUF, 0x00, DATD)
    Name (DBUF, Buffer (0x06)
    {
        0xA0, 0x00, 0x00, 0x00, 0x00, 0x00
    })
    CreateByteField (DBUF, 0x00, RDTP)
    CreateByteField (DBUF, 0x01, DAB1)
    CreateByteField (DBUF, 0x02, DAB2)
    CreateByteField (DBUF, 0x03, DAB3)
    CreateByteField (DBUF, 0x04, DAB4)
    CreateByteField (DBUF, 0x05, DAB5)
    CreateWordField (DBUF, 0x01, DAW0)
    CreateWordField (DBUF, 0x03, DAW3)
    CreateDWordField (DBUF, 0x01, DAD1)
    OperationRegion (SMB0, SystemIO, 0xF140, 0x01)
    Field (SMB0, ByteAcc, NoLock, Preserve)
    {
        SM00,   8
    }

    OperationRegion (SMB1, SystemIO, 0xF141, 0x01)
    Field (SMB1, ByteAcc, NoLock, Preserve)
    {
        SM01,   8
    }

    OperationRegion (SMB2, SystemIO, 0xF142, 0x01)
    Field (SMB2, ByteAcc, NoLock, Preserve)
    {
        SM02,   8
    }

    OperationRegion (SMB7, SystemIO, 0xF147, 0x01)
    Field (SMB7, ByteAcc, NoLock, Preserve)
    {
        SM07,   8
    }

    OperationRegion (SMB3, SystemIO, 0xF143, 0x01)
    Field (SMB3, ByteAcc, NoLock, Preserve)
    {
        SM03,   8
    }

    OperationRegion (SMB4, SystemIO, 0xF144, 0x01)
    Field (SMB4, ByteAcc, NoLock, Preserve)
    {
        SM04,   8
    }

    OperationRegion (SMB6, SystemIO, 0xF145, 0x01)
    Field (SMB6, ByteAcc, NoLock, Preserve)
    {
        SM06,   8
    }

    Scope (\_TZ)
    {
        ThermalZone (THR2)
        {
            Method (_TMP, 0, NotSerialized)
            {
                Add (CNT0, 0x01, CNT0)
                If (LEqual (CNT0, 0x04))
                {
                    Or (\_SB.PCI0.MX71.R07B, 0x10, \_SB.PCI0.MX71.R07B)
                }

                Store (0x30, \_SB.PCI0.AD4S.PXB1)
                Store (\_SB.PCI0.AD4S.C242, Local1)
                If (LEqual (Local1, 0x00))
                {
                    Store (0x34, Local1)
                }
                Else
                {
                    If (LEqual (Local1, 0xFF))
                    {
                        Store (0x34, Local1)
                    }
                }

                Multiply (Local1, 0x0A, DW02)
                Add (DW02, 0x0AAC, DW02)
                Return (DW02)
            }

            Method (_CRT, 0, NotSerialized)
            {
                Store (\_SB.PCI0.AD4S.TPC2, Local0)
                Multiply (Local0, 0x0A, DW01)
                Add (DW01, 0x0AAC, DW01)
                Return (DW01)
            }

            Name (_TC1, 0x02)
            Name (_TC2, 0x03)
            Name (_TSP, 0x0258)
        }
    }

    Scope (\_GPE)
    {
        Method (_L00, 0, NotSerialized)
        {
            Store (0x22, \_SB.PCI0.AD4S.PX80)
            Sleep (0x07D0)
            \_SB.PCI0.AD4S.EC0.ECC5 (0x4A)
            Store (0x00, \_SB.PCI0.AD4S.EC0.DAT1)
            Store (0xC9, \_SB.PCI0.AD4S.EC0.CMCD)
            Store (\_SB.PCI0.AD4S.EC0.DAT1, Local0)
            If (LAnd (LNot (LLess (Local0, 0x32)), LNot (LGreater (Local0, 0x35))))
            {
                Add (Local0, 0x15, Local0)
                Store (Local0, \_SB.PCI0.AD4S.PXB1)
            }
        }

        Method (_L06, 0, NotSerialized)
        {
            Store (0x08, \_SB.PCI0.MX71.PLED)
            Notify (\_SB.SLPB, 0x02)
        }

        Method (_L07, 0, NotSerialized)
        {
            Store (0x07, \_SB.PCI0.AD4S.PX80)
            And (\_SB.PCI0.MX71.R088, 0x80, Local0)
            If (LEqual (Local0, 0x80))
            {
                Store (0x01, \LIDS)
            }
            Else
            {
                Store (0x00, \LIDS)
                Sleep (0x07D0)
            }

            Store (0x00, \LIDF)
            Notify (\_SB.LID, 0x80)
        }

        Method (_L09, 0, NotSerialized)
        {
            Store (0x09, \_SB.PCI0.AD4S.PX80)
            And (\_SB.PCI0.OZ68.PWRS, 0xFC, \_SB.PCI0.OZ68.PWRS)
            Or (\_SB.PCI0.OZ68.PMES, 0x80, \_SB.PCI0.OZ68.PMES)
            And (\_SB.PCI0.OZ69.PWR1, 0xFC, \_SB.PCI0.OZ69.PWR1)
            Or (\_SB.PCI0.OZ69.PM1S, 0x80, \_SB.PCI0.OZ69.PM1S)
            Store (\_SB.PCI0.OBLN.PMES, Local0)
            Store (Local0, \_SB.PCI0.OBLN.PMES)
            Notify (\_SB.SLPB, 0x02)
        }

        Method (_L0A, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.AD4S.COM0, 0x02)
        }

        Method (_L0C, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.OBAU, 0x02)
        }

        Method (_L18, 0, NotSerialized)
        {
            Store (0x33, \_SB.PCI0.AD4S.PXB1)
            If (LEqual (DAT0, 0x01))
            {
                If (\_SB.PCI0.AD4S.HOTB)
                {
                    Or (\_SB.PCI0.MX71.SPKC, 0x40, \_SB.PCI0.MX71.SPKC)
                    Store (0xFF, \_SB.PCI0.MX71.BEEP)
                }

                Notify (\_SB.SLPB, 0x80)
            }
        }

        Method (_L21, 0, NotSerialized)
        {
            Or (\_SB.PCI0.MX71.SPKC, 0x40, \_SB.PCI0.MX71.SPKC)
            Store (0xFF, \_SB.PCI0.MX71.BEEP)
            Store (0x36, \_SB.PCI0.AD4S.PXB1)
            Notify (\_SB.AC, 0x80)
            Notify (\_SB.BAT0, 0x80)
        }

        Method (_L30, 0, NotSerialized)
        {
            If (LEqual (SizeOf (\_OS), 0x11)) {}
            Else
            {
                Sleep (0xC8)
            }

            Store (0x64, \_SB.PCI0.AD4S.PXB1)
            If (LEqual (SizeOf (\_OS), 0x11)) {}
            Else
            {
                Notify (\_TZ.THR2, 0x80)
            }
        }
    }

    Scope (\_SB)
    {
        Device (PILA)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x01)
            Method (_PRS, 0, NotSerialized)
            {
                Name (BUF0, ResourceTemplate ()
                {
                    IRQ (Level, ActiveLow, Shared)
                        {1,3,4,5,6,7,9,10,11,12,14,15}
                })
                Return (BUF0)
            }

            Method (_DIS, 0, NotSerialized)
            {
                And (\_SB.PCI0.AD4S.INTA, 0xF0, \_SB.PCI0.AD4S.INTA)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Name (BUF0, ResourceTemplate ()
                {
                    IRQ (Level, ActiveLow, Shared)
                        {}
                })
                CreateWordField (BUF0, 0x01, IRQW)
                And (\_SB.PCI0.AD4S.INTA, 0x0F, Local0)
                If (LEqual (Local0, 0x01))
                {
                    Store (0x0200, IRQW)
                }

                If (LEqual (Local0, 0x02))
                {
                    Store (0x08, IRQW)
                }

                If (LEqual (Local0, 0x03))
                {
                    Store (0x0400, IRQW)
                }

                If (LEqual (Local0, 0x04))
                {
                    Store (0x10, IRQW)
                }

                If (LEqual (Local0, 0x05))
                {
                    Store (0x20, IRQW)
                }

                If (LEqual (Local0, 0x06))
                {
                    Store (0x80, IRQW)
                }

                If (LEqual (Local0, 0x07))
                {
                    Store (0x40, IRQW)
                }

                If (LEqual (Local0, 0x08))
                {
                    Store (0x02, IRQW)
                }

                If (LEqual (Local0, 0x09))
                {
                    Store (0x0800, IRQW)
                }

                If (LEqual (Local0, 0x0B))
                {
                    Store (0x1000, IRQW)
                }

                If (LEqual (Local0, 0x0D))
                {
                    Store (0x4000, IRQW)
                }

                If (LEqual (Local0, 0x0F))
                {
                    Store (0x8000, IRQW)
                }

                Return (BUF0)
            }

            Method (_SRS, 1, NotSerialized)
            {
                CreateWordField (Arg0, 0x01, IRQW)
                If (LEqual (IRQW, 0x0200))
                {
                    Store (0x01, Local0)
                }

                If (LEqual (IRQW, 0x08))
                {
                    Store (0x02, Local0)
                }

                If (LEqual (IRQW, 0x0400))
                {
                    Store (0x03, Local0)
                }

                If (LEqual (IRQW, 0x10))
                {
                    Store (0x04, Local0)
                }

                If (LEqual (IRQW, 0x20))
                {
                    Store (0x05, Local0)
                }

                If (LEqual (IRQW, 0x80))
                {
                    Store (0x06, Local0)
                }

                If (LEqual (IRQW, 0x40))
                {
                    Store (0x07, Local0)
                }

                If (LEqual (IRQW, 0x02))
                {
                    Store (0x08, Local0)
                }

                If (LEqual (IRQW, 0x0800))
                {
                    Store (0x09, Local0)
                }

                If (LEqual (IRQW, 0x1000))
                {
                    Store (0x0B, Local0)
                }

                If (LEqual (IRQW, 0x4000))
                {
                    Store (0x0D, Local0)
                }

                If (LEqual (IRQW, 0x8000))
                {
                    Store (0x0F, Local0)
                }

                And (\_SB.PCI0.AD4S.INTA, 0xF0, Local1)
                Or (Local1, Local0, \_SB.PCI0.AD4S.INTA)
            }

            Method (_STA, 0, NotSerialized)
            {
                And (\_SB.PCI0.AD4S.INTA, 0x0F, Local0)
                If (LEqual (Local0, 0x00))
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }
        }

        Device (PILB)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x02)
            Method (_PRS, 0, NotSerialized)
            {
                Name (BUF0, ResourceTemplate ()
                {
                    IRQ (Level, ActiveLow, Shared)
                        {1,3,4,5,6,7,9,10,11,12,14,15}
                })
                Return (BUF0)
            }

            Method (_DIS, 0, NotSerialized)
            {
                And (\_SB.PCI0.AD4S.INTA, 0x0F, \_SB.PCI0.AD4S.INTA)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Name (BUF0, ResourceTemplate ()
                {
                    IRQ (Level, ActiveLow, Shared)
                        {}
                })
                CreateWordField (BUF0, 0x01, IRQW)
                And (\_SB.PCI0.AD4S.INTA, 0xF0, Local0)
                If (LEqual (Local0, 0x10))
                {
                    Store (0x0200, IRQW)
                }

                If (LEqual (Local0, 0x20))
                {
                    Store (0x08, IRQW)
                }

                If (LEqual (Local0, 0x30))
                {
                    Store (0x0400, IRQW)
                }

                If (LEqual (Local0, 0x40))
                {
                    Store (0x10, IRQW)
                }

                If (LEqual (Local0, 0x50))
                {
                    Store (0x20, IRQW)
                }

                If (LEqual (Local0, 0x60))
                {
                    Store (0x80, IRQW)
                }

                If (LEqual (Local0, 0x70))
                {
                    Store (0x40, IRQW)
                }

                If (LEqual (Local0, 0x80))
                {
                    Store (0x02, IRQW)
                }

                If (LEqual (Local0, 0x90))
                {
                    Store (0x0800, IRQW)
                }

                If (LEqual (Local0, 0xB0))
                {
                    Store (0x1000, IRQW)
                }

                If (LEqual (Local0, 0xD0))
                {
                    Store (0x4000, IRQW)
                }

                If (LEqual (Local0, 0xF0))
                {
                    Store (0x8000, IRQW)
                }

                Return (BUF0)
            }

            Method (_SRS, 1, NotSerialized)
            {
                CreateWordField (Arg0, 0x01, IRQW)
                If (LEqual (IRQW, 0x0200))
                {
                    Store (0x10, Local0)
                }

                If (LEqual (IRQW, 0x08))
                {
                    Store (0x20, Local0)
                }

                If (LEqual (IRQW, 0x0400))
                {
                    Store (0x30, Local0)
                }

                If (LEqual (IRQW, 0x10))
                {
                    Store (0x40, Local0)
                }

                If (LEqual (IRQW, 0x20))
                {
                    Store (0x50, Local0)
                }

                If (LEqual (IRQW, 0x80))
                {
                    Store (0x60, Local0)
                }

                If (LEqual (IRQW, 0x40))
                {
                    Store (0x70, Local0)
                }

                If (LEqual (IRQW, 0x02))
                {
                    Store (0x80, Local0)
                }

                If (LEqual (IRQW, 0x0800))
                {
                    Store (0x90, Local0)
                }

                If (LEqual (IRQW, 0x1000))
                {
                    Store (0xB0, Local0)
                }

                If (LEqual (IRQW, 0x4000))
                {
                    Store (0xD0, Local0)
                }

                If (LEqual (IRQW, 0x8000))
                {
                    Store (0xF0, Local0)
                }

                And (\_SB.PCI0.AD4S.INTA, 0x0F, Local1)
                Or (Local1, Local0, \_SB.PCI0.AD4S.INTA)
            }

            Method (_STA, 0, NotSerialized)
            {
                And (\_SB.PCI0.AD4S.INTA, 0xF0, Local0)
                If (LEqual (Local0, 0x00))
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }
        }

        Device (PILC)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x03)
            Method (_PRS, 0, NotSerialized)
            {
                Name (BUF0, ResourceTemplate ()
                {
                    IRQ (Level, ActiveLow, Shared)
                        {1,3,4,5,6,7,9,10,11,12,14,15}
                })
                Return (BUF0)
            }

            Method (_DIS, 0, NotSerialized)
            {
                And (\_SB.PCI0.AD4S.INTB, 0xF0, \_SB.PCI0.AD4S.INTB)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Name (BUF0, ResourceTemplate ()
                {
                    IRQ (Level, ActiveLow, Shared)
                        {}
                })
                CreateWordField (BUF0, 0x01, IRQW)
                And (\_SB.PCI0.AD4S.INTB, 0x0F, Local0)
                If (LEqual (Local0, 0x01))
                {
                    Store (0x0200, IRQW)
                }

                If (LEqual (Local0, 0x02))
                {
                    Store (0x08, IRQW)
                }

                If (LEqual (Local0, 0x03))
                {
                    Store (0x0400, IRQW)
                }

                If (LEqual (Local0, 0x04))
                {
                    Store (0x10, IRQW)
                }

                If (LEqual (Local0, 0x05))
                {
                    Store (0x20, IRQW)
                }

                If (LEqual (Local0, 0x06))
                {
                    Store (0x80, IRQW)
                }

                If (LEqual (Local0, 0x07))
                {
                    Store (0x40, IRQW)
                }

                If (LEqual (Local0, 0x08))
                {
                    Store (0x02, IRQW)
                }

                If (LEqual (Local0, 0x09))
                {
                    Store (0x0800, IRQW)
                }

                If (LEqual (Local0, 0x0B))
                {
                    Store (0x1000, IRQW)
                }

                If (LEqual (Local0, 0x0D))
                {
                    Store (0x4000, IRQW)
                }

                If (LEqual (Local0, 0x0F))
                {
                    Store (0x8000, IRQW)
                }

                Return (BUF0)
            }

            Method (_SRS, 1, NotSerialized)
            {
                CreateWordField (Arg0, 0x01, IRQW)
                If (LEqual (IRQW, 0x0200))
                {
                    Store (0x01, Local0)
                }

                If (LEqual (IRQW, 0x08))
                {
                    Store (0x02, Local0)
                }

                If (LEqual (IRQW, 0x0400))
                {
                    Store (0x03, Local0)
                }

                If (LEqual (IRQW, 0x10))
                {
                    Store (0x04, Local0)
                }

                If (LEqual (IRQW, 0x20))
                {
                    Store (0x05, Local0)
                }

                If (LEqual (IRQW, 0x80))
                {
                    Store (0x06, Local0)
                }

                If (LEqual (IRQW, 0x40))
                {
                    Store (0x07, Local0)
                }

                If (LEqual (IRQW, 0x02))
                {
                    Store (0x08, Local0)
                }

                If (LEqual (IRQW, 0x0800))
                {
                    Store (0x09, Local0)
                }

                If (LEqual (IRQW, 0x1000))
                {
                    Store (0x0B, Local0)
                }

                If (LEqual (IRQW, 0x4000))
                {
                    Store (0x0D, Local0)
                }

                If (LEqual (IRQW, 0x8000))
                {
                    Store (0x0F, Local0)
                }

                And (\_SB.PCI0.AD4S.INTB, 0xF0, Local1)
                Or (Local1, Local0, \_SB.PCI0.AD4S.INTB)
            }

            Method (_STA, 0, NotSerialized)
            {
                And (\_SB.PCI0.AD4S.INTB, 0x0F, Local0)
                If (LEqual (Local0, 0x00))
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }
        }

        Device (PILD)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x04)
            Method (_PRS, 0, NotSerialized)
            {
                Name (BUF0, ResourceTemplate ()
                {
                    IRQ (Level, ActiveLow, Shared)
                        {1,3,4,5,6,7,9,10,11,12,14,15}
                })
                Return (BUF0)
            }

            Method (_DIS, 0, NotSerialized)
            {
                And (\_SB.PCI0.AD4S.INTB, 0x0F, \_SB.PCI0.AD4S.INTB)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Name (BUF0, ResourceTemplate ()
                {
                    IRQ (Level, ActiveLow, Shared)
                        {}
                })
                CreateWordField (BUF0, 0x01, IRQW)
                And (\_SB.PCI0.AD4S.INTB, 0xF0, Local0)
                If (LEqual (Local0, 0x10))
                {
                    Store (0x0200, IRQW)
                }

                If (LEqual (Local0, 0x20))
                {
                    Store (0x08, IRQW)
                }

                If (LEqual (Local0, 0x30))
                {
                    Store (0x0400, IRQW)
                }

                If (LEqual (Local0, 0x40))
                {
                    Store (0x10, IRQW)
                }

                If (LEqual (Local0, 0x50))
                {
                    Store (0x20, IRQW)
                }

                If (LEqual (Local0, 0x60))
                {
                    Store (0x80, IRQW)
                }

                If (LEqual (Local0, 0x70))
                {
                    Store (0x40, IRQW)
                }

                If (LEqual (Local0, 0x80))
                {
                    Store (0x02, IRQW)
                }

                If (LEqual (Local0, 0x90))
                {
                    Store (0x0800, IRQW)
                }

                If (LEqual (Local0, 0xB0))
                {
                    Store (0x1000, IRQW)
                }

                If (LEqual (Local0, 0xD0))
                {
                    Store (0x4000, IRQW)
                }

                If (LEqual (Local0, 0xF0))
                {
                    Store (0x8000, IRQW)
                }

                Return (BUF0)
            }

            Method (_SRS, 1, NotSerialized)
            {
                CreateWordField (Arg0, 0x01, IRQW)
                If (LEqual (IRQW, 0x0200))
                {
                    Store (0x10, Local0)
                }

                If (LEqual (IRQW, 0x08))
                {
                    Store (0x20, Local0)
                }

                If (LEqual (IRQW, 0x0400))
                {
                    Store (0x30, Local0)
                }

                If (LEqual (IRQW, 0x10))
                {
                    Store (0x40, Local0)
                }

                If (LEqual (IRQW, 0x20))
                {
                    Store (0x50, Local0)
                }

                If (LEqual (IRQW, 0x80))
                {
                    Store (0x60, Local0)
                }

                If (LEqual (IRQW, 0x40))
                {
                    Store (0x70, Local0)
                }

                If (LEqual (IRQW, 0x02))
                {
                    Store (0x80, Local0)
                }

                If (LEqual (IRQW, 0x0800))
                {
                    Store (0x90, Local0)
                }

                If (LEqual (IRQW, 0x1000))
                {
                    Store (0xB0, Local0)
                }

                If (LEqual (IRQW, 0x4000))
                {
                    Store (0xD0, Local0)
                }

                If (LEqual (IRQW, 0x8000))
                {
                    Store (0xF0, Local0)
                }

                And (\_SB.PCI0.AD4S.INTB, 0x0F, Local1)
                Or (Local1, Local0, \_SB.PCI0.AD4S.INTB)
            }

            Method (_STA, 0, NotSerialized)
            {
                And (\_SB.PCI0.AD4S.INTB, 0xF0, Local0)
                If (LEqual (Local0, 0x00))
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }
        }

        Device (PILE)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x05)
            Method (_PRS, 0, NotSerialized)
            {
                Name (BUF0, ResourceTemplate ()
                {
                    IRQ (Level, ActiveLow, Shared)
                        {1,3,4,5,6,7,9,10,11,12,14,15}
                })
                Return (BUF0)
            }

            Method (_DIS, 0, NotSerialized)
            {
                And (\_SB.PCI0.AD4S.INTC, 0xF0, \_SB.PCI0.AD4S.INTC)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Name (BUF0, ResourceTemplate ()
                {
                    IRQ (Level, ActiveLow, Shared)
                        {}
                })
                CreateWordField (BUF0, 0x01, IRQW)
                And (\_SB.PCI0.AD4S.INTC, 0x0F, Local0)
                If (LEqual (Local0, 0x01))
                {
                    Store (0x0200, IRQW)
                }

                If (LEqual (Local0, 0x02))
                {
                    Store (0x08, IRQW)
                }

                If (LEqual (Local0, 0x03))
                {
                    Store (0x0400, IRQW)
                }

                If (LEqual (Local0, 0x04))
                {
                    Store (0x10, IRQW)
                }

                If (LEqual (Local0, 0x05))
                {
                    Store (0x20, IRQW)
                }

                If (LEqual (Local0, 0x06))
                {
                    Store (0x80, IRQW)
                }

                If (LEqual (Local0, 0x07))
                {
                    Store (0x40, IRQW)
                }

                If (LEqual (Local0, 0x08))
                {
                    Store (0x02, IRQW)
                }

                If (LEqual (Local0, 0x09))
                {
                    Store (0x0800, IRQW)
                }

                If (LEqual (Local0, 0x0B))
                {
                    Store (0x1000, IRQW)
                }

                If (LEqual (Local0, 0x0D))
                {
                    Store (0x4000, IRQW)
                }

                If (LEqual (Local0, 0x0F))
                {
                    Store (0x8000, IRQW)
                }

                Return (BUF0)
            }

            Method (_SRS, 1, NotSerialized)
            {
                CreateWordField (Arg0, 0x01, IRQW)
                If (LEqual (IRQW, 0x0200))
                {
                    Store (0x01, Local0)
                }

                If (LEqual (IRQW, 0x08))
                {
                    Store (0x02, Local0)
                }

                If (LEqual (IRQW, 0x0400))
                {
                    Store (0x03, Local0)
                }

                If (LEqual (IRQW, 0x10))
                {
                    Store (0x04, Local0)
                }

                If (LEqual (IRQW, 0x20))
                {
                    Store (0x05, Local0)
                }

                If (LEqual (IRQW, 0x80))
                {
                    Store (0x06, Local0)
                }

                If (LEqual (IRQW, 0x40))
                {
                    Store (0x07, Local0)
                }

                If (LEqual (IRQW, 0x02))
                {
                    Store (0x08, Local0)
                }

                If (LEqual (IRQW, 0x0800))
                {
                    Store (0x09, Local0)
                }

                If (LEqual (IRQW, 0x1000))
                {
                    Store (0x0B, Local0)
                }

                If (LEqual (IRQW, 0x4000))
                {
                    Store (0x0D, Local0)
                }

                If (LEqual (IRQW, 0x8000))
                {
                    Store (0x0F, Local0)
                }

                And (\_SB.PCI0.AD4S.INTC, 0xF0, Local1)
                Or (Local1, Local0, \_SB.PCI0.AD4S.INTC)
            }

            Method (_STA, 0, NotSerialized)
            {
                And (\_SB.PCI0.AD4S.INTC, 0x0F, Local0)
                If (LEqual (Local0, 0x00))
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }
        }

        Device (PILF)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x06)
            Method (_PRS, 0, NotSerialized)
            {
                Name (BUF0, ResourceTemplate ()
                {
                    IRQ (Level, ActiveLow, Shared)
                        {1,3,4,5,6,7,9,10,11,12,14,15}
                })
                Return (BUF0)
            }

            Method (_DIS, 0, NotSerialized)
            {
                And (\_SB.PCI0.AD4S.INTC, 0x0F, \_SB.PCI0.AD4S.INTC)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Name (BUF0, ResourceTemplate ()
                {
                    IRQ (Level, ActiveLow, Shared)
                        {}
                })
                CreateWordField (BUF0, 0x01, IRQW)
                And (\_SB.PCI0.AD4S.INTC, 0xF0, Local0)
                If (LEqual (Local0, 0x10))
                {
                    Store (0x0200, IRQW)
                }

                If (LEqual (Local0, 0x20))
                {
                    Store (0x08, IRQW)
                }

                If (LEqual (Local0, 0x30))
                {
                    Store (0x0400, IRQW)
                }

                If (LEqual (Local0, 0x40))
                {
                    Store (0x10, IRQW)
                }

                If (LEqual (Local0, 0x50))
                {
                    Store (0x20, IRQW)
                }

                If (LEqual (Local0, 0x60))
                {
                    Store (0x80, IRQW)
                }

                If (LEqual (Local0, 0x70))
                {
                    Store (0x40, IRQW)
                }

                If (LEqual (Local0, 0x80))
                {
                    Store (0x02, IRQW)
                }

                If (LEqual (Local0, 0x90))
                {
                    Store (0x0800, IRQW)
                }

                If (LEqual (Local0, 0xB0))
                {
                    Store (0x1000, IRQW)
                }

                If (LEqual (Local0, 0xD0))
                {
                    Store (0x4000, IRQW)
                }

                If (LEqual (Local0, 0xF0))
                {
                    Store (0x8000, IRQW)
                }

                Return (BUF0)
            }

            Method (_SRS, 1, NotSerialized)
            {
                CreateWordField (Arg0, 0x01, IRQW)
                If (LEqual (IRQW, 0x0200))
                {
                    Store (0x10, Local0)
                }

                If (LEqual (IRQW, 0x08))
                {
                    Store (0x20, Local0)
                }

                If (LEqual (IRQW, 0x0400))
                {
                    Store (0x30, Local0)
                }

                If (LEqual (IRQW, 0x10))
                {
                    Store (0x40, Local0)
                }

                If (LEqual (IRQW, 0x20))
                {
                    Store (0x50, Local0)
                }

                If (LEqual (IRQW, 0x80))
                {
                    Store (0x60, Local0)
                }

                If (LEqual (IRQW, 0x40))
                {
                    Store (0x70, Local0)
                }

                If (LEqual (IRQW, 0x02))
                {
                    Store (0x80, Local0)
                }

                If (LEqual (IRQW, 0x0800))
                {
                    Store (0x90, Local0)
                }

                If (LEqual (IRQW, 0x1000))
                {
                    Store (0xB0, Local0)
                }

                If (LEqual (IRQW, 0x4000))
                {
                    Store (0xD0, Local0)
                }

                If (LEqual (IRQW, 0x8000))
                {
                    Store (0xF0, Local0)
                }

                And (\_SB.PCI0.AD4S.INTC, 0x0F, Local1)
                Or (Local1, Local0, \_SB.PCI0.AD4S.INTC)
            }

            Method (_STA, 0, NotSerialized)
            {
                And (\_SB.PCI0.AD4S.INTC, 0xF0, Local0)
                If (LEqual (Local0, 0x00))
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }
        }

        Device (PILG)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x07)
            Method (_PRS, 0, NotSerialized)
            {
                Name (BUF0, ResourceTemplate ()
                {
                    IRQ (Level, ActiveLow, Shared)
                        {1,3,4,5,6,7,9,10,11,12,14,15}
                })
                Return (BUF0)
            }

            Method (_DIS, 0, NotSerialized)
            {
                And (\_SB.PCI0.AD4S.INTD, 0xF0, \_SB.PCI0.AD4S.INTD)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Name (BUF0, ResourceTemplate ()
                {
                    IRQ (Level, ActiveLow, Shared)
                        {}
                })
                CreateWordField (BUF0, 0x01, IRQW)
                And (\_SB.PCI0.AD4S.INTD, 0x0F, Local0)
                If (LEqual (Local0, 0x01))
                {
                    Store (0x0200, IRQW)
                }

                If (LEqual (Local0, 0x02))
                {
                    Store (0x08, IRQW)
                }

                If (LEqual (Local0, 0x03))
                {
                    Store (0x0400, IRQW)
                }

                If (LEqual (Local0, 0x04))
                {
                    Store (0x10, IRQW)
                }

                If (LEqual (Local0, 0x05))
                {
                    Store (0x20, IRQW)
                }

                If (LEqual (Local0, 0x06))
                {
                    Store (0x80, IRQW)
                }

                If (LEqual (Local0, 0x07))
                {
                    Store (0x40, IRQW)
                }

                If (LEqual (Local0, 0x08))
                {
                    Store (0x02, IRQW)
                }

                If (LEqual (Local0, 0x09))
                {
                    Store (0x0800, IRQW)
                }

                If (LEqual (Local0, 0x0B))
                {
                    Store (0x1000, IRQW)
                }

                If (LEqual (Local0, 0x0D))
                {
                    Store (0x4000, IRQW)
                }

                If (LEqual (Local0, 0x0F))
                {
                    Store (0x8000, IRQW)
                }

                Return (BUF0)
            }

            Method (_SRS, 1, NotSerialized)
            {
                CreateWordField (Arg0, 0x01, IRQW)
                If (LEqual (IRQW, 0x0200))
                {
                    Store (0x01, Local0)
                }

                If (LEqual (IRQW, 0x08))
                {
                    Store (0x02, Local0)
                }

                If (LEqual (IRQW, 0x0400))
                {
                    Store (0x03, Local0)
                }

                If (LEqual (IRQW, 0x10))
                {
                    Store (0x04, Local0)
                }

                If (LEqual (IRQW, 0x20))
                {
                    Store (0x05, Local0)
                }

                If (LEqual (IRQW, 0x80))
                {
                    Store (0x06, Local0)
                }

                If (LEqual (IRQW, 0x40))
                {
                    Store (0x07, Local0)
                }

                If (LEqual (IRQW, 0x02))
                {
                    Store (0x08, Local0)
                }

                If (LEqual (IRQW, 0x0800))
                {
                    Store (0x09, Local0)
                }

                If (LEqual (IRQW, 0x1000))
                {
                    Store (0x0B, Local0)
                }

                If (LEqual (IRQW, 0x4000))
                {
                    Store (0x0D, Local0)
                }

                If (LEqual (IRQW, 0x8000))
                {
                    Store (0x0F, Local0)
                }

                And (\_SB.PCI0.AD4S.INTD, 0xF0, Local1)
                Or (Local1, Local0, \_SB.PCI0.AD4S.INTD)
            }

            Method (_STA, 0, NotSerialized)
            {
                And (\_SB.PCI0.AD4S.INTD, 0x0F, Local0)
                If (LEqual (Local0, 0x00))
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }
        }

        Device (PILH)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x08)
            Method (_PRS, 0, NotSerialized)
            {
                Name (BUF0, ResourceTemplate ()
                {
                    IRQ (Level, ActiveLow, Shared)
                        {1,3,4,5,6,7,9,10,11,12,14,15}
                })
                Return (BUF0)
            }

            Method (_DIS, 0, NotSerialized)
            {
                And (\_SB.PCI0.AD4S.INTD, 0x0F, \_SB.PCI0.AD4S.INTD)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Name (BUF0, ResourceTemplate ()
                {
                    IRQ (Level, ActiveLow, Shared)
                        {}
                })
                CreateWordField (BUF0, 0x01, IRQW)
                And (\_SB.PCI0.AD4S.INTD, 0xF0, Local0)
                If (LEqual (Local0, 0x10))
                {
                    Store (0x0200, IRQW)
                }

                If (LEqual (Local0, 0x20))
                {
                    Store (0x08, IRQW)
                }

                If (LEqual (Local0, 0x30))
                {
                    Store (0x0400, IRQW)
                }

                If (LEqual (Local0, 0x40))
                {
                    Store (0x10, IRQW)
                }

                If (LEqual (Local0, 0x50))
                {
                    Store (0x20, IRQW)
                }

                If (LEqual (Local0, 0x60))
                {
                    Store (0x80, IRQW)
                }

                If (LEqual (Local0, 0x70))
                {
                    Store (0x40, IRQW)
                }

                If (LEqual (Local0, 0x80))
                {
                    Store (0x02, IRQW)
                }

                If (LEqual (Local0, 0x90))
                {
                    Store (0x0800, IRQW)
                }

                If (LEqual (Local0, 0xB0))
                {
                    Store (0x1000, IRQW)
                }

                If (LEqual (Local0, 0xD0))
                {
                    Store (0x4000, IRQW)
                }

                If (LEqual (Local0, 0xF0))
                {
                    Store (0x8000, IRQW)
                }

                Return (BUF0)
            }

            Method (_SRS, 1, NotSerialized)
            {
                CreateWordField (Arg0, 0x01, IRQW)
                If (LEqual (IRQW, 0x0200))
                {
                    Store (0x10, Local0)
                }

                If (LEqual (IRQW, 0x08))
                {
                    Store (0x20, Local0)
                }

                If (LEqual (IRQW, 0x0400))
                {
                    Store (0x30, Local0)
                }

                If (LEqual (IRQW, 0x10))
                {
                    Store (0x40, Local0)
                }

                If (LEqual (IRQW, 0x20))
                {
                    Store (0x50, Local0)
                }

                If (LEqual (IRQW, 0x80))
                {
                    Store (0x60, Local0)
                }

                If (LEqual (IRQW, 0x40))
                {
                    Store (0x70, Local0)
                }

                If (LEqual (IRQW, 0x02))
                {
                    Store (0x80, Local0)
                }

                If (LEqual (IRQW, 0x0800))
                {
                    Store (0x90, Local0)
                }

                If (LEqual (IRQW, 0x1000))
                {
                    Store (0xB0, Local0)
                }

                If (LEqual (IRQW, 0x4000))
                {
                    Store (0xD0, Local0)
                }

                If (LEqual (IRQW, 0x8000))
                {
                    Store (0xF0, Local0)
                }

                And (\_SB.PCI0.AD4S.INTD, 0x0F, Local1)
                Or (Local1, Local0, \_SB.PCI0.AD4S.INTD)
            }

            Method (_STA, 0, NotSerialized)
            {
                And (\_SB.PCI0.AD4S.INTD, 0xF0, Local0)
                If (LEqual (Local0, 0x00))
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }
        }

        Device (PILI)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x09)
            Method (_PRS, 0, NotSerialized)
            {
                Name (BUF0, ResourceTemplate ()
                {
                    IRQ (Level, ActiveLow, Shared)
                        {1,3,4,5,6,7,9,10,11,12,14,15}
                })
                Return (BUF0)
            }

            Method (_DIS, 0, NotSerialized)
            {
                And (\_SB.PCI0.AD4S.INTJ, 0xF0, \_SB.PCI0.AD4S.INTJ)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Name (BUF0, ResourceTemplate ()
                {
                    IRQ (Level, ActiveLow, Shared)
                        {}
                })
                CreateWordField (BUF0, 0x01, IRQW)
                And (\_SB.PCI0.AD4S.INTJ, 0x0F, Local0)
                If (LEqual (Local0, 0x01))
                {
                    Store (0x0200, IRQW)
                }

                If (LEqual (Local0, 0x02))
                {
                    Store (0x08, IRQW)
                }

                If (LEqual (Local0, 0x03))
                {
                    Store (0x0400, IRQW)
                }

                If (LEqual (Local0, 0x04))
                {
                    Store (0x10, IRQW)
                }

                If (LEqual (Local0, 0x05))
                {
                    Store (0x20, IRQW)
                }

                If (LEqual (Local0, 0x06))
                {
                    Store (0x80, IRQW)
                }

                If (LEqual (Local0, 0x07))
                {
                    Store (0x40, IRQW)
                }

                If (LEqual (Local0, 0x08))
                {
                    Store (0x02, IRQW)
                }

                If (LEqual (Local0, 0x09))
                {
                    Store (0x0800, IRQW)
                }

                If (LEqual (Local0, 0x0B))
                {
                    Store (0x1000, IRQW)
                }

                If (LEqual (Local0, 0x0D))
                {
                    Store (0x4000, IRQW)
                }

                If (LEqual (Local0, 0x0F))
                {
                    Store (0x8000, IRQW)
                }

                Return (BUF0)
            }

            Method (_SRS, 1, NotSerialized)
            {
                CreateWordField (Arg0, 0x01, IRQW)
                If (LEqual (IRQW, 0x0200))
                {
                    Store (0x01, Local0)
                }

                If (LEqual (IRQW, 0x08))
                {
                    Store (0x02, Local0)
                }

                If (LEqual (IRQW, 0x0400))
                {
                    Store (0x03, Local0)
                }

                If (LEqual (IRQW, 0x10))
                {
                    Store (0x04, Local0)
                }

                If (LEqual (IRQW, 0x20))
                {
                    Store (0x05, Local0)
                }

                If (LEqual (IRQW, 0x80))
                {
                    Store (0x06, Local0)
                }

                If (LEqual (IRQW, 0x40))
                {
                    Store (0x07, Local0)
                }

                If (LEqual (IRQW, 0x02))
                {
                    Store (0x08, Local0)
                }

                If (LEqual (IRQW, 0x0800))
                {
                    Store (0x09, Local0)
                }

                If (LEqual (IRQW, 0x1000))
                {
                    Store (0x0B, Local0)
                }

                If (LEqual (IRQW, 0x4000))
                {
                    Store (0x0D, Local0)
                }

                If (LEqual (IRQW, 0x8000))
                {
                    Store (0x0F, Local0)
                }

                And (\_SB.PCI0.AD4S.INTJ, 0xF0, Local1)
                Or (Local1, Local0, \_SB.PCI0.AD4S.INTJ)
            }

            Method (_STA, 0, NotSerialized)
            {
                And (\_SB.PCI0.AD4S.INTJ, 0x0F, Local0)
                If (LEqual (Local0, 0x00))
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }
        }

        Device (\_SB.SLPB)
        {
            Name (_HID, EisaId ("PNP0C0E"))
        }

        Device (PCI0)
        {
            Name (_HID, EisaId ("PNP0A03"))
            Name (_ADR, 0x00)
            Name (PBRS, ResourceTemplate ()
            {
                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                    0x0000,             // Address Space Granularity
                    0x0000,             // Address Range Minimum
                    0x00FF,             // Address Range Maximum
                    0x0000,             // Address Translation Offset
                    0x0100,             // Address Length
                    ,,)
                IO (Decode16,
                    0x0CF8,             // Address Range Minimum
                    0x0CF8,             // Address Range Maximum
                    0x01,               // Address Alignment
                    0x08,               // Address Length
                    )
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Address Space Granularity
                    0x0000,             // Address Range Minimum
                    0x0CF7,             // Address Range Maximum
                    0x0000,             // Address Translation Offset
                    0x0CF8,             // Address Length
                    ,,, TypeStatic)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Address Space Granularity
                    0x0D00,             // Address Range Minimum
                    0xFFFF,             // Address Range Maximum
                    0x0000,             // Address Translation Offset
                    0xF300,             // Address Length
                    ,,, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Address Space Granularity
                    0x000A0000,         // Address Range Minimum
                    0x000BFFFF,         // Address Range Maximum
                    0x00000000,         // Address Translation Offset
                    0x00020000,         // Address Length
                    ,,, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Address Space Granularity
                    0x000C8000,         // Address Range Minimum
                    0x000DFFFF,         // Address Range Maximum
                    0x00000000,         // Address Translation Offset
                    0x00018000,         // Address Length
                    ,,, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Address Space Granularity
                    0x00000000,         // Address Range Minimum
                    0xFFFFFFFF,         // Address Range Maximum
                    0x00000000,         // Address Translation Offset
                    0x00000000,         // Address Length
                    ,,, AddressRangeMemory, TypeStatic)
            })
            Method (_CRS, 0, NotSerialized)
            {
                CreateDWordField (PBRS, 0x76, MEML)
                CreateDWordField (PBRS, 0x82, LENM)
                Store (\_SB.PCI0.AD4S.EXMH, Local1)
                ShiftLeft (Local1, 0x08, Local1)
                Store (\_SB.PCI0.AD4S.EXML, Local2)
                Add (Local1, Local2, Local1)
                ShiftRight (Local1, 0x02, Local1)
                Add (Local1, 0x01, Local1)
                ShiftLeft (Local1, 0x14, MEML)
                Subtract (0xFFFFFFFF, MEML, LENM)
                Add (LENM, 0x01, LENM)
                Return (PBRS)
            }

            Method (_STA, 0, NotSerialized)
            {
                Return (0x0F)
            }

            Name (_PRT, Package (0x07)
            {
                Package (0x04)
                {
                    0x0001FFFF, 
                    0x00, 
                    \_SB.PILA, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x000AFFFF, 
                    0x00, 
                    \_SB.PILD, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0006FFFF, 
                    0x00, 
                    \_SB.PILH, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0008FFFF, 
                    0x00, 
                    \_SB.PILG, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0013FFFF, 
                    0x00, 
                    \_SB.PILB, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0013FFFF, 
                    0x01, 
                    \_SB.PILC, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    0x00, 
                    \_SB.PILI, 
                    0x00
                }
            })
            Device (AD4S)
            {
                Name (_ADR, 0x00070000)
                OperationRegion (SB1, PCI_Config, 0x00, 0xFF)
                Field (SB1, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x48), 
                    INTA,   8, 
                    INTB,   8, 
                    INTC,   8, 
                    INTD,   8, 
                    Offset (0x5D), 
                    PMEN,   8, 
                    Offset (0x74), 
                    INTJ,   8
                }

                OperationRegion (CMS1, SystemIO, 0x70, 0x02)
                Field (CMS1, ByteAcc, NoLock, Preserve)
                {
                    CIND,   8, 
                    CDAT,   8
                }

                IndexField (CIND, CDAT, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x11), 
                    PMOS,   8, 
                    Offset (0x13), 
                    EXLP,   8, 
                    Offset (0x2E), 
                    CMHI,   8, 
                    CMLO,   8, 
                    Offset (0x33), 
                    DMAC,   8, 
                    Offset (0x37), 
                    OBC1,   8, 
                    Offset (0x39), 
                    SMIO,   8, 
                    OBC2,   8, 
                    CS3B,   8, 
                    Offset (0x43), 
                    LLBW,   8, 
                    Offset (0x45), 
                        ,   7, 
                    HOTB,   1, 
                    EXML,   8, 
                    EXMH,   8, 
                    Offset (0x4A), 
                    CS4A,   8, 
                    Offset (0x4C), 
                    FNF4,   8, 
                    Offset (0x58), 
                    CS58,   8, 
                    Offset (0x6C), 
                    USBS,   8
                }

                OperationRegion (CMS2, SystemIO, 0x72, 0x02)
                Field (CMS2, ByteAcc, NoLock, Preserve)
                {
                    IND2,   8, 
                    DAT2,   8
                }

                IndexField (IND2, DAT2, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x1B), 
                    TPC2,   8, 
                    Offset (0x42), 
                    C242,   8, 
                    Offset (0x64), 
                    C264,   8, 
                    C265,   8, 
                    C266,   8, 
                    C267,   8
                }

                OperationRegion (DBG1, SystemIO, 0x80, 0x01)
                Field (DBG1, ByteAcc, NoLock, Preserve)
                {
                    PX80,   8
                }

                OperationRegion (DEL0, SystemIO, 0xED, 0x01)
                Field (DEL0, ByteAcc, NoLock, Preserve)
                {
                    DLAY,   8
                }

                OperationRegion (SMI1, SystemIO, 0xB1, 0x01)
                Field (SMI1, ByteAcc, NoLock, Preserve)
                {
                    PXB1,   8
                }

                Device (PIC0)
                {
                    Name (_HID, EisaId ("PNP0000"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0020,             // Address Range Minimum
                            0x0020,             // Address Range Maximum
                            0x00,               // Address Alignment
                            0x02,               // Address Length
                            )
                        IO (Decode16,
                            0x00A0,             // Address Range Minimum
                            0x00A0,             // Address Range Maximum
                            0x00,               // Address Alignment
                            0x02,               // Address Length
                            )
                        IRQNoFlags ()
                            {2}
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }
                }

                Device (DMA0)
                {
                    Name (_HID, EisaId ("PNP0200"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0000,             // Address Range Minimum
                            0x0000,             // Address Range Maximum
                            0x00,               // Address Alignment
                            0x10,               // Address Length
                            )
                        IO (Decode16,
                            0x0081,             // Address Range Minimum
                            0x0081,             // Address Range Maximum
                            0x00,               // Address Alignment
                            0x0F,               // Address Length
                            )
                        IO (Decode16,
                            0x00C0,             // Address Range Minimum
                            0x00C0,             // Address Range Maximum
                            0x00,               // Address Alignment
                            0x20,               // Address Length
                            )
                        IO (Decode16,
                            0x0480,             // Address Range Minimum
                            0x0480,             // Address Range Maximum
                            0x00,               // Address Alignment
                            0x10,               // Address Length
                            )
                        IO (Decode16,
                            0x04D6,             // Address Range Minimum
                            0x04D6,             // Address Range Maximum
                            0x00,               // Address Alignment
                            0x01,               // Address Length
                            )
                        DMA (Compatibility, NotBusMaster, Transfer8)
                            {4}
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }
                }

                Device (TMR0)
                {
                    Name (_HID, EisaId ("PNP0100"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0040,             // Address Range Minimum
                            0x0040,             // Address Range Maximum
                            0x00,               // Address Alignment
                            0x04,               // Address Length
                            )
                        IRQNoFlags ()
                            {0}
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }
                }

                Device (SPK0)
                {
                    Name (_HID, EisaId ("PNP0800"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0061,             // Address Range Minimum
                            0x0061,             // Address Range Maximum
                            0x00,               // Address Alignment
                            0x01,               // Address Length
                            )
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }
                }

                Device (MATH)
                {
                    Name (_HID, EisaId ("PNP0C04"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x00F0,             // Address Range Minimum
                            0x00F0,             // Address Range Maximum
                            0x00,               // Address Alignment
                            0x10,               // Address Length
                            )
                        IRQNoFlags ()
                            {13}
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }
                }

                Device (RTC0)
                {
                    Name (_HID, EisaId ("PNP0B00"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0070,             // Address Range Minimum
                            0x0070,             // Address Range Maximum
                            0x00,               // Address Alignment
                            0x04,               // Address Length
                            )
                        IRQNoFlags ()
                            {8}
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }
                }

                Device (KBC0)
                {
                    Name (_HID, EisaId ("PNP0303"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0060,             // Address Range Minimum
                            0x0060,             // Address Range Maximum
                            0x00,               // Address Alignment
                            0x01,               // Address Length
                            )
                        IO (Decode16,
                            0x0064,             // Address Range Minimum
                            0x0064,             // Address Range Maximum
                            0x00,               // Address Alignment
                            0x01,               // Address Length
                            )
                        IRQNoFlags ()
                            {1}
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        And (\_SB.PCI0.MX71.R088, 0x38, Local0)
                        If (LEqual (Local0, 0x30))
                        {
                            Return (0x00)
                        }
                        Else
                        {
                            Return (0x0F)
                        }
                    }
                }

                Device (KBC1)
                {
                    Name (_HID, EisaId ("PNP0320"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0060,             // Address Range Minimum
                            0x0060,             // Address Range Maximum
                            0x00,               // Address Alignment
                            0x01,               // Address Length
                            )
                        IO (Decode16,
                            0x0064,             // Address Range Minimum
                            0x0064,             // Address Range Maximum
                            0x00,               // Address Alignment
                            0x01,               // Address Length
                            )
                        IRQNoFlags ()
                            {1}
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        And (\_SB.PCI0.MX71.R088, 0x38, Local0)
                        If (LEqual (Local0, 0x30))
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (0x00)
                        }
                    }
                }

                OperationRegion (ALI1, SystemIO, 0x03F0, 0x02)
                Field (ALI1, ByteAcc, NoLock, Preserve)
                {
                    INDX,   8, 
                    DATA,   8
                }

                IndexField (INDX, DATA, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x07), 
                    LDN,    8, 
                    Offset (0x30), 
                    ACTR,   8, 
                    Offset (0x60), 
                    IOAH,   8, 
                    IOAL,   8, 
                    Offset (0x70), 
                    INTR,   8, 
                    Offset (0x74), 
                    DMCH,   8, 
                    Offset (0xF0), 
                    OPT1,   8, 
                    OPT2,   8, 
                    OPT3,   8
                }

                Method (ENCF, 0, NotSerialized)
                {
                    Store (0x51, INDX)
                    Store (0x23, INDX)
                }

                Method (EXCF, 0, NotSerialized)
                {
                    Store (0xBB, INDX)
                }

                Device (FDC0)
                {
                    Name (_HID, EisaId ("PNP0700"))
                    Method (_STA, 0, NotSerialized)
                    {
                        ENCF ()
                        Store (0x00, LDN)
                        If (ACTR)
                        {
                            EXCF ()
                            Return (0x0F)
                        }
                        Else
                        {
                            EXCF ()
                            Return (0x0D)
                        }
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        ENCF ()
                        Store (0x00, LDN)
                        Store (0x00, ACTR)
                        EXCF ()
                    }

                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x03F0,             // Address Range Minimum
                            0x03F0,             // Address Range Maximum
                            0x00,               // Address Alignment
                            0x06,               // Address Length
                            )
                        IO (Decode16,
                            0x03F7,             // Address Range Minimum
                            0x03F7,             // Address Range Maximum
                            0x00,               // Address Alignment
                            0x01,               // Address Length
                            )
                        IRQNoFlags ()
                            {6}
                        DMA (Compatibility, NotBusMaster, Transfer8_16)
                            {2}
                    })
                    Name (_PRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x03F0,             // Address Range Minimum
                            0x03F0,             // Address Range Maximum
                            0x00,               // Address Alignment
                            0x06,               // Address Length
                            )
                        IO (Decode16,
                            0x03F7,             // Address Range Minimum
                            0x03F7,             // Address Range Maximum
                            0x00,               // Address Alignment
                            0x01,               // Address Length
                            )
                        IRQNoFlags ()
                            {6}
                        DMA (Compatibility, NotBusMaster, Transfer8_16)
                            {2}
                    })
                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateByteField (Arg0, 0x02, IOLO)
                        CreateByteField (Arg0, 0x03, IOHI)
                        CreateByteField (Arg0, 0x11, IRQ0)
                        CreateByteField (Arg0, 0x14, DMA0)
                        ENCF ()
                        Store (0x00, LDN)
                        Store (IOLO, IOAL)
                        Store (IOHI, IOAH)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, INTR)
                        FindSetRightBit (DMA0, Local0)
                        Decrement (Local0)
                        Store (Local0, DMCH)
                        Store (0x01, ACTR)
                        EXCF ()
                    }

                    Method (_PSC, 0, NotSerialized)
                    {
                        ENCF ()
                        Store (0x00, LDN)
                        If (LAnd (ACTR, 0x01))
                        {
                            EXCF ()
                            Return (0x00)
                        }
                        Else
                        {
                            EXCF ()
                            Return (0x03)
                        }
                    }

                    Method (_PS0, 0, NotSerialized)
                    {
                        ENCF ()
                        Store (0x00, LDN)
                        Store (ACTR, Local0)
                        Or (Local0, 0x01, Local0)
                        Store (Local0, ACTR)
                        EXCF ()
                    }

                    Method (_PS3, 0, NotSerialized)
                    {
                        ENCF ()
                        Store (0x00, LDN)
                        Store (ACTR, Local0)
                        And (Local0, 0xFE, Local0)
                        Store (Local0, ACTR)
                        EXCF ()
                    }
                }

                Device (COM0)
                {
                    Name (_HID, EisaId ("PNP0501"))
                    Name (_PRW, Package (0x02)
                    {
                        0x0A, 
                        0x01
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        ENCF ()
                        Store (0x04, LDN)
                        If (ACTR)
                        {
                            EXCF ()
                            Return (0x0F)
                        }
                        Else
                        {
                            EXCF ()
                            Return (0x0D)
                        }
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x03F8,             // Address Range Minimum
                                0x03F8,             // Address Range Maximum
                                0x00,               // Address Alignment
                                0x08,               // Address Length
                                )
                            IRQNoFlags ()
                                {4}
                        })
                        CreateWordField (BUF0, 0x02, IOLO)
                        CreateWordField (BUF0, 0x04, IOHI)
                        CreateWordField (BUF0, 0x09, IRQ0)
                        ENCF ()
                        Store (0x04, LDN)
                        If (LNot (LEqual (ACTR, 0x00)))
                        {
                            Or (ShiftLeft (IOAH, 0x08), IOAL, Local0)
                            Store (Local0, IOLO)
                            Store (Local0, IOHI)
                            ShiftLeft (0x01, INTR, IRQ0)
                        }

                        EXCF ()
                        Return (BUF0)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03F8,             // Address Range Minimum
                                0x03F8,             // Address Range Maximum
                                0x00,               // Address Alignment
                                0x08,               // Address Length
                                )
                            IRQNoFlags ()
                                {3,4}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x02F8,             // Address Range Minimum
                                0x02F8,             // Address Range Maximum
                                0x00,               // Address Alignment
                                0x08,               // Address Length
                                )
                            IRQNoFlags ()
                                {3,4}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03E8,             // Address Range Minimum
                                0x03E8,             // Address Range Maximum
                                0x00,               // Address Alignment
                                0x08,               // Address Length
                                )
                            IRQNoFlags ()
                                {3,4}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x02E8,             // Address Range Minimum
                                0x02E8,             // Address Range Maximum
                                0x00,               // Address Alignment
                                0x08,               // Address Length
                                )
                            IRQNoFlags ()
                                {3,4}
                        }
                        EndDependentFn ()
                        /*** Disassembler: inserted missing EndDependentFn () ***/
                    })
                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateByteField (Arg0, 0x02, IOLO)
                        CreateByteField (Arg0, 0x03, IOHI)
                        CreateWordField (Arg0, 0x09, IRQ0)
                        ENCF ()
                        Store (0x04, LDN)
                        Store (IOLO, IOAL)
                        Store (IOHI, IOAH)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, INTR)
                        Store (0x01, ACTR)
                        EXCF ()
                    }

                    Method (_PSC, 0, NotSerialized)
                    {
                        ENCF ()
                        Store (0x04, LDN)
                        If (LAnd (ACTR, 0x01))
                        {
                            EXCF ()
                            Return (0x00)
                        }
                        Else
                        {
                            EXCF ()
                            Return (0x03)
                        }
                    }

                    Method (_PS0, 0, NotSerialized)
                    {
                        ENCF ()
                        Store (0x04, LDN)
                        Store (ACTR, Local0)
                        Or (Local0, 0x01, Local0)
                        Store (Local0, ACTR)
                        EXCF ()
                    }

                    Method (_PS3, 0, NotSerialized)
                    {
                    }
                }

                Device (IR1)
                {
                    Name (_HID, EisaId ("ALI5123"))
                    Name (_CID, 0x1105D041)
                    Method (_STA, 0, NotSerialized)
                    {
                        ENCF ()
                        Store (0x05, LDN)
                        And (ACTR, 0x81, Local0)
                        If (LEqual (Local0, 0x81))
                        {
                            EXCF ()
                            Return (0x0F)
                        }
                        Else
                        {
                            EXCF ()
                            Return (0x0D)
                        }
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        ENCF ()
                        Store (0x05, LDN)
                        Store (0x00, ACTR)
                        EXCF ()
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x02F8,             // Address Range Minimum
                                0x02F8,             // Address Range Maximum
                                0x00,               // Address Alignment
                                0x08,               // Address Length
                                )
                            IRQNoFlags ()
                                {3}
                            DMA (Compatibility, NotBusMaster, Transfer8_16)
                                {3}
                        })
                        CreateWordField (BUF0, 0x02, IOLO)
                        CreateWordField (BUF0, 0x04, IOHI)
                        CreateWordField (BUF0, 0x09, IRQ0)
                        CreateByteField (BUF0, 0x0C, DMA0)
                        ENCF ()
                        Store (0x05, LDN)
                        If (LNot (LEqual (ACTR, 0x00)))
                        {
                            Or (ShiftLeft (IOAH, 0x08), IOAL, Local0)
                            Store (Local0, IOLO)
                            Store (Local0, IOHI)
                            ShiftLeft (0x01, INTR, IRQ0)
                            ShiftLeft (0x01, DMCH, DMA0)
                        }

                        EXCF ()
                        Return (BUF0)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03F8,             // Address Range Minimum
                                0x03F8,             // Address Range Maximum
                                0x00,               // Address Alignment
                                0x08,               // Address Length
                                )
                            IRQNoFlags ()
                                {3,4}
                            DMA (Compatibility, NotBusMaster, Transfer8_16)
                                {0,1,3}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x02F8,             // Address Range Minimum
                                0x02F8,             // Address Range Maximum
                                0x00,               // Address Alignment
                                0x08,               // Address Length
                                )
                            IRQNoFlags ()
                                {3,4}
                            DMA (Compatibility, NotBusMaster, Transfer8_16)
                                {0,1,3}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03E8,             // Address Range Minimum
                                0x03E8,             // Address Range Maximum
                                0x00,               // Address Alignment
                                0x08,               // Address Length
                                )
                            IRQNoFlags ()
                                {3,4}
                            DMA (Compatibility, NotBusMaster, Transfer8_16)
                                {0,1,3}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x02E8,             // Address Range Minimum
                                0x02E8,             // Address Range Maximum
                                0x00,               // Address Alignment
                                0x08,               // Address Length
                                )
                            IRQNoFlags ()
                                {3,4}
                            DMA (Compatibility, NotBusMaster, Transfer8_16)
                                {0,1,3}
                        }
                        EndDependentFn ()
                        /*** Disassembler: inserted missing EndDependentFn () ***/
                    })
                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateByteField (Arg0, 0x02, IOLO)
                        CreateByteField (Arg0, 0x03, IOHI)
                        CreateWordField (Arg0, 0x09, IRQ0)
                        CreateByteField (Arg0, 0x0C, DMA0)
                        ENCF ()
                        Store (0x05, LDN)
                        Store (IOLO, IOAL)
                        Store (IOHI, IOAH)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, INTR)
                        FindSetRightBit (DMA0, Local1)
                        Decrement (Local1)
                        Store (Local1, DMCH)
                        Store (0x81, ACTR)
                        EXCF ()
                    }

                    Method (_PSC, 0, NotSerialized)
                    {
                        ENCF ()
                        Store (0x05, LDN)
                        And (ACTR, 0x81, Local0)
                        If (LEqual (Local0, 0x81))
                        {
                            EXCF ()
                            Return (0x00)
                        }
                        Else
                        {
                            EXCF ()
                            Return (0x03)
                        }
                    }

                    Method (_PS0, 0, NotSerialized)
                    {
                        ENCF ()
                        Store (0x05, LDN)
                        Store (ACTR, Local0)
                        Or (Local0, 0x81, Local0)
                        Store (Local0, ACTR)
                        EXCF ()
                    }

                    Method (_PS3, 0, NotSerialized)
                    {
                        ENCF ()
                        Store (0x05, LDN)
                        Store (ACTR, Local0)
                        And (Local0, 0xFE, Local0)
                        Store (Local0, ACTR)
                        EXCF ()
                    }
                }

                Device (LPT)
                {
                    Name (_HID, EisaId ("PNP0400"))
                    Method (_STA, 0, NotSerialized)
                    {
                        ENCF ()
                        Store (0x03, LDN)
                        And (OPT1, 0x02, Local0)
                        If (LNot (LEqual (Local0, 0x02)))
                        {
                            If (ACTR)
                            {
                                EXCF ()
                                Return (0x0F)
                            }
                            Else
                            {
                                EXCF ()
                                Return (0x0D)
                            }
                        }
                        Else
                        {
                            EXCF ()
                            Return (0x00)
                        }
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        ENCF ()
                        Store (0x03, LDN)
                        Store (0x00, ACTR)
                        EXCF ()
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x03BC,             // Address Range Minimum
                                0x03BC,             // Address Range Maximum
                                0x00,               // Address Alignment
                                0x04,               // Address Length
                                )
                            IRQNoFlags ()
                                {7}
                        })
                        CreateWordField (BUF0, 0x02, IOLO)
                        CreateWordField (BUF0, 0x04, IOHI)
                        CreateByteField (BUF0, 0x07, LEN0)
                        CreateWordField (BUF0, 0x09, IRQ0)
                        ENCF ()
                        Store (0x03, LDN)
                        If (LNot (LEqual (ACTR, 0x00)))
                        {
                            And (OPT1, 0x02, Local0)
                            If (LNot (LEqual (Local0, 0x02)))
                            {
                                Or (ShiftLeft (IOAH, 0x08), IOAL, Local0)
                                Store (Local0, IOLO)
                                Store (Local0, IOHI)
                                If (LEqual (IOAL, 0xBC))
                                {
                                    Store (0x04, LEN0)
                                }
                                Else
                                {
                                    Store (0x08, LEN0)
                                }

                                ShiftLeft (0x01, INTR, IRQ0)
                            }
                        }

                        EXCF ()
                        Return (BUF0)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x0378,             // Address Range Minimum
                                0x0378,             // Address Range Maximum
                                0x00,               // Address Alignment
                                0x08,               // Address Length
                                )
                            IRQNoFlags ()
                                {5,7}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x0278,             // Address Range Minimum
                                0x0278,             // Address Range Maximum
                                0x00,               // Address Alignment
                                0x08,               // Address Length
                                )
                            IRQNoFlags ()
                                {5,7}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03BC,             // Address Range Minimum
                                0x03BC,             // Address Range Maximum
                                0x00,               // Address Alignment
                                0x04,               // Address Length
                                )
                            IRQNoFlags ()
                                {5,7}
                        }
                        EndDependentFn ()
                        /*** Disassembler: inserted missing EndDependentFn () ***/
                    })
                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateByteField (Arg0, 0x02, IOLO)
                        CreateByteField (Arg0, 0x03, IOHI)
                        CreateWordField (Arg0, 0x09, IRQ0)
                        ENCF ()
                        Store (0x03, LDN)
                        Store (IOLO, IOAL)
                        Store (IOHI, IOAH)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, INTR)
                        Store (0x01, ACTR)
                        EXCF ()
                    }

                    Method (_PSC, 0, NotSerialized)
                    {
                        ENCF ()
                        Store (0x03, LDN)
                        If (LAnd (ACTR, 0x01))
                        {
                            EXCF ()
                            Return (0x00)
                        }
                        Else
                        {
                            EXCF ()
                            Return (0x03)
                        }
                    }

                    Method (_PS0, 0, NotSerialized)
                    {
                        ENCF ()
                        Store (0x03, LDN)
                        Store (ACTR, Local0)
                        Or (Local0, 0x01, Local0)
                        Store (Local0, ACTR)
                        EXCF ()
                    }

                    Method (_PS3, 0, NotSerialized)
                    {
                        ENCF ()
                        Store (0x03, LDN)
                        Store (ACTR, Local0)
                        And (Local0, 0xFE, Local0)
                        Store (Local0, ACTR)
                        EXCF ()
                    }
                }

                Device (ECP)
                {
                    Name (_HID, EisaId ("PNP0401"))
                    Method (_STA, 0, NotSerialized)
                    {
                        ENCF ()
                        Store (0x03, LDN)
                        And (OPT1, 0x02, Local0)
                        If (LEqual (Local0, 0x02))
                        {
                            If (ACTR)
                            {
                                EXCF ()
                                Return (0x0F)
                            }
                            Else
                            {
                                EXCF ()
                                Return (0x0D)
                            }
                        }
                        Else
                        {
                            EXCF ()
                            Return (0x00)
                        }
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        ENCF ()
                        Store (0x03, LDN)
                        Store (0x00, ACTR)
                        EXCF ()
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x0378,             // Address Range Minimum
                                0x0378,             // Address Range Maximum
                                0x00,               // Address Alignment
                                0x08,               // Address Length
                                )
                            IO (Decode16,
                                0x0778,             // Address Range Minimum
                                0x0778,             // Address Range Maximum
                                0x00,               // Address Alignment
                                0x04,               // Address Length
                                )
                            IRQNoFlags ()
                                {7}
                            DMA (Compatibility, NotBusMaster, Transfer8_16)
                                {1}
                        })
                        CreateWordField (BUF0, 0x02, IOLO)
                        CreateWordField (BUF0, 0x04, IOHI)
                        CreateWordField (BUF0, 0x0A, I2LO)
                        CreateWordField (BUF0, 0x0C, I2HI)
                        CreateByteField (BUF0, 0x07, LEN1)
                        CreateByteField (BUF0, 0x0F, LEN2)
                        CreateWordField (BUF0, 0x11, IRQ0)
                        CreateByteField (BUF0, 0x14, DMA0)
                        ENCF ()
                        Store (0x03, LDN)
                        And (OPT1, 0x02, Local0)
                        If (LAnd (LNot (LEqual (ACTR, 0x00)), LEqual (Local0, 0x02)))
                        {
                            Or (ShiftLeft (IOAH, 0x08), IOAL, Local0)
                            Store (Local0, IOLO)
                            Store (Local0, IOHI)
                            Add (Local0, 0x0400, Local1)
                            Store (Local1, I2LO)
                            Store (Local1, I2HI)
                            If (LEqual (IOAL, 0xBC))
                            {
                                Store (0x04, LEN1)
                            }
                            Else
                            {
                                Store (0x08, LEN1)
                            }

                            ShiftLeft (0x01, INTR, IRQ0)
                            ShiftLeft (0x01, DMCH, DMA0)
                        }

                        EXCF ()
                        Return (BUF0)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x0378,             // Address Range Minimum
                                0x0378,             // Address Range Maximum
                                0x00,               // Address Alignment
                                0x08,               // Address Length
                                )
                            IO (Decode16,
                                0x0778,             // Address Range Minimum
                                0x0778,             // Address Range Maximum
                                0x00,               // Address Alignment
                                0x04,               // Address Length
                                )
                            IRQNoFlags ()
                                {5,7}
                            DMA (Compatibility, NotBusMaster, Transfer8_16)
                                {1,3}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x0278,             // Address Range Minimum
                                0x0278,             // Address Range Maximum
                                0x00,               // Address Alignment
                                0x08,               // Address Length
                                )
                            IO (Decode16,
                                0x0678,             // Address Range Minimum
                                0x0678,             // Address Range Maximum
                                0x00,               // Address Alignment
                                0x04,               // Address Length
                                )
                            IRQNoFlags ()
                                {5,7}
                            DMA (Compatibility, NotBusMaster, Transfer8_16)
                                {1,3}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03BC,             // Address Range Minimum
                                0x03BC,             // Address Range Maximum
                                0x00,               // Address Alignment
                                0x04,               // Address Length
                                )
                            IO (Decode16,
                                0x07BC,             // Address Range Minimum
                                0x07BC,             // Address Range Maximum
                                0x00,               // Address Alignment
                                0x04,               // Address Length
                                )
                            IRQNoFlags ()
                                {5,7}
                            DMA (Compatibility, NotBusMaster, Transfer8_16)
                                {1,3}
                        }
                        EndDependentFn ()
                        /*** Disassembler: inserted missing EndDependentFn () ***/
                    })
                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateByteField (Arg0, 0x02, IOLO)
                        CreateByteField (Arg0, 0x03, IOHI)
                        CreateWordField (Arg0, 0x11, IRQ0)
                        CreateByteField (Arg0, 0x14, DMA0)
                        ENCF ()
                        Store (0x03, LDN)
                        Store (IOLO, IOAL)
                        Store (IOHI, IOAH)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, INTR)
                        FindSetRightBit (DMA0, Local0)
                        Decrement (Local0)
                        Store (Local0, DMCH)
                        Store (0x01, ACTR)
                        EXCF ()
                    }

                    Method (_PSC, 0, NotSerialized)
                    {
                        ENCF ()
                        Store (0x03, LDN)
                        If (LAnd (ACTR, 0x01))
                        {
                            EXCF ()
                            Return (0x00)
                        }
                        Else
                        {
                            EXCF ()
                            Return (0x03)
                        }
                    }

                    Method (_PS0, 0, NotSerialized)
                    {
                        ENCF ()
                        Store (0x03, LDN)
                        Store (ACTR, Local0)
                        Or (Local0, 0x01, Local0)
                        Store (Local0, ACTR)
                        EXCF ()
                    }

                    Method (_PS3, 0, NotSerialized)
                    {
                        ENCF ()
                        Store (0x03, LDN)
                        Store (ACTR, Local0)
                        And (Local0, 0xFE, Local0)
                        Store (Local0, ACTR)
                        EXCF ()
                    }
                }

                Device (PS2M)
                {
                    Name (_HID, EisaId ("PNP0F13"))
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }

                    Name (_CRS, ResourceTemplate ()
                    {
                        IRQNoFlags ()
                            {12}
                    })
                }

                Device (EC0)
                {
                    Name (_HID, EisaId ("PNP0C09"))
                    Name (_GPE, 0x22)
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }

                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0062,             // Address Range Minimum
                            0x0062,             // Address Range Maximum
                            0x00,               // Address Alignment
                            0x01,               // Address Length
                            )
                        IO (Decode16,
                            0x0066,             // Address Range Minimum
                            0x0066,             // Address Range Maximum
                            0x00,               // Address Alignment
                            0x01,               // Address Length
                            )
                    })
                    OperationRegion (RAM, EmbeddedControl, 0x00, 0x7F)
                    Field (RAM, ByteAcc, Lock, Preserve)
                    {
                        Offset (0x01), 
                        SCIC,   8, 
                        Offset (0x04), 
                        CMCD,   8, 
                        DAT1,   8, 
                        DAT2,   8, 
                        DAT3,   8, 
                        Offset (0x48), 
                        P54S,   8, 
                        P55S,   8, 
                        P54T,   8, 
                        P55T,   8, 
                        P54D,   8, 
                        P55D,   8, 
                            ,   4, 
                        P54,    1, 
                        P55,    1, 
                        Offset (0x4F), 
                        Offset (0x50), 
                        P60S,   8, 
                        Offset (0x5A), 
                        P62T,   8, 
                        P63T,   8, 
                        P64T,   8, 
                        P65T,   8, 
                        Offset (0x78), 
                        P60,    1
                    }

                    OperationRegion (ECO1, SystemIO, 0x62, 0x01)
                    Field (ECO1, ByteAcc, Lock, Preserve)
                    {
                        PX62,   8
                    }

                    OperationRegion (ECO2, SystemIO, 0x66, 0x01)
                    Field (ECO2, ByteAcc, Lock, Preserve)
                    {
                        PX66,   8
                    }

                    Method (_Q01, 0, NotSerialized)
                    {
                        Store (0x42, \_SB.PCI0.AD4S.PXB1)
                    }

                    Method (_Q02, 0, NotSerialized)
                    {
                        Store (0x43, \_SB.PCI0.AD4S.PXB1)
                    }

                    Method (_Q05, 0, NotSerialized)
                    {
                        Store (0x34, \_SB.PCI0.AD4S.PXB1)
                    }

                    Method (_Q0F, 0, NotSerialized)
                    {
                        Store (0x41, \_SB.PCI0.AD4S.PXB1)
                    }

                    Method (_Q10, 0, NotSerialized)
                    {
                        Sleep (0x64)
                        Store (0x44, \_SB.PCI0.AD4S.PXB1)
                        Sleep (0x64)
                    }

                    Method (_Q11, 0, NotSerialized)
                    {
                        Store (0x45, \_SB.PCI0.AD4S.PXB1)
                    }

                    Method (_Q30, 0, NotSerialized)
                    {
                        \_SB.PCI0.AD4S.EC0.ECC5 (0x56)
                        Or (\_SB.PCI0.MX71.SPKC, 0x40, \_SB.PCI0.MX71.SPKC)
                        Store (0xFF, \_SB.PCI0.MX71.BEEP)
                        If (LEqual (\_SB.PCI0.AD4S.EC0.P60, 0x01))
                        {
                            Store (0x80, \_SB.PCI0.AD4S.EC0.P60S)
                        }
                        Else
                        {
                            Store (0x90, \_SB.PCI0.AD4S.EC0.P60S)
                            Store (0x3A, \_SB.PCI0.AD4S.PXB1)
                        }

                        Notify (\_SB.BAT0, 0x81)
                    }

                    Method (_Q32, 0, NotSerialized)
                    {
                        Store (0x47, \_SB.PCI0.AD4S.PXB1)
                    }

                    Method (_Q33, 0, NotSerialized)
                    {
                        Store (0x48, \_SB.PCI0.AD4S.PXB1)
                    }

                    Method (_Q34, 0, NotSerialized)
                    {
                        Store (0x49, \_SB.PCI0.AD4S.PXB1)
                    }

                    Method (_Q35, 0, NotSerialized)
                    {
                        Store (0x4A, \_SB.PCI0.AD4S.PXB1)
                    }

                    Method (ECC5, 1, NotSerialized)
                    {
                        Store (Arg0, \_SB.PCI0.AD4S.EC0.DAT1)
                        Store (0xC5, \_SB.PCI0.AD4S.EC0.CMCD)
                    }
                }
            }

            Device (OZ68)
            {
                Name (_ADR, 0x00130000)
                Name (_PRW, Package (0x02)
                {
                    0x09, 
                    0x01
                })
                OperationRegion (SB68, PCI_Config, 0x00, 0xFF)
                Field (SB68, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x93), 
                    PME0,   8, 
                    Offset (0xA4), 
                    PWRS,   8, 
                    PMES,   8
                }
            }

            Device (OZ69)
            {
                Name (_ADR, 0x00130001)
                Name (_PRW, Package (0x02)
                {
                    0x09, 
                    0x01
                })
                OperationRegion (SB69, PCI_Config, 0x00, 0xFF)
                Field (SB69, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x93), 
                    PME1,   8, 
                    Offset (0xA4), 
                    PWR1,   8, 
                    PM1S,   8
                }
            }

            Device (OBLN)
            {
                Name (_ADR, 0x000A0000)
                Name (_PRW, Package (0x02)
                {
                    0x09, 
                    0x04
                })
                OperationRegion (SBLN, PCI_Config, 0x00, 0xFF)
                Field (SBLN, ByteAcc, NoLock, Preserve)
                {
                    Offset (0xE1), 
                    PMES,   8
                }
            }

            Device (OBAU)
            {
                Name (_ADR, 0x00060000)
                Name (_PRW, Package (0x02)
                {
                    0x0C, 
                    0x01
                })
                OperationRegion (SBAU, PCI_Config, 0x00, 0xFF)
                Field (SBAU, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x46), 
                    RA46,   8, 
                    Offset (0xE0), 
                    RAE0,   8
                }
            }

            Device (USB0)
            {
                Name (_ADR, 0x00140000)
                Name (_PRW, Package (0x02)
                {
                    0x0B, 
                    0x01
                })
            }

            Device (MX71)
            {
                Name (_ADR, 0x00110000)
                OperationRegion (SB71, PCI_Config, 0x00, 0xFF)
                Field (SB71, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x45), 
                    R045,   8, 
                    R046,   8, 
                    Offset (0x49), 
                    R049,   8, 
                    Offset (0x7B), 
                    R07B,   8, 
                    Offset (0x83), 
                    R083,   8, 
                    Offset (0x87), 
                    R087,   8, 
                    R088,   8, 
                    Offset (0x97), 
                    R097,   8, 
                    R098,   8, 
                    R099,   8, 
                    Offset (0x9D), 
                    R09D,   8, 
                    Offset (0xAC), 
                    R0AC,   8, 
                    R0AD,   8, 
                    R0AE,   8, 
                    Offset (0xB2), 
                    SPKC,   8, 
                    LED0,   8, 
                    PLED,   8, 
                    Offset (0xD3), 
                    BEEP,   8, 
                    Offset (0xE0), 
                    PMIO,   16, 
                    SBIO,   16
                }
            }

            Device (PAGP)
            {
                Name (_ADR, 0x00010000)
                Device (VGA0)
                {
                    Name (_ADR, 0x00)
                    Method (_DOD, 0, NotSerialized)
                    {
                        If (LEqual (VGAS, 0x00))
                        {
                            And (\_SB.PCI0.MX71.R097, 0x02, Local0)
                            If (LEqual (Local0, 0x02))
                            {
                                Store (0x02, CRTS)
                                Store (0x02, LCDS)
                            }

                            And (\_SB.PCI0.AD4S.LLBW, 0x01, Local0)
                            If (LEqual (Local0, 0x01))
                            {
                                Store (0x01, CRTS)
                                Store (0x01, LCDS)
                            }

                            Store (0x01, VGAS)
                        }

                        Return (Package (0x03)
                        {
                            0x00010100, 
                            0x00010110, 
                            0x0200
                        })
                    }

                    Device (CRT0)
                    {
                        Method (_ADR, 0, NotSerialized)
                        {
                            Return (0x0100)
                        }

                        Method (_DCS, 0, NotSerialized)
                        {
                            Return (0x1F)
                        }

                        Method (_DGS, 0, NotSerialized)
                        {
                            Divide (CRTS, 0x03, Local0, Local1)
                            Add (CRTS, 0x01, CRTS)
                            If (LEqual (Local0, 0x00))
                            {
                                Return (0x01)
                            }

                            If (LEqual (Local0, 0x01))
                            {
                                Return (0x00)
                            }

                            If (LEqual (Local0, 0x02))
                            {
                                Return (0x01)
                            }
                            Return(Package(0x02){0x00, 0x00})
			}
                    }

                    Device (LCD0)
                    {
                        Method (_ADR, 0, NotSerialized)
                        {
                            Return (0x0110)
                        }

                        Method (_DCS, 0, NotSerialized)
                        {
                            Return (0x1F)
                        }

                        Method (_DGS, 0, NotSerialized)
                        {
                            Divide (LCDS, 0x03, Local0, Local1)
                            Add (LCDS, 0x01, LCDS)
                            If (LEqual (Local0, 0x00))
                            {
                                Return (0x01)
                            }

                            If (LEqual (Local0, 0x01))
                            {
                                Return (0x01)
                            }

                            If (LEqual (Local0, 0x02))
                            {
                                Return (0x00)
                            }
                            Return(Package(0x02){0x00, 0x00})
      			}

                        Method (_DDC, 1, NotSerialized)
                        {
                            If (LEqual (Arg0, 0x01))
                            {
                                Return (\_SB.PCI0.PAGP.VGA0.DDC4)
                            }

                            If (LEqual (Arg0, 0x02))
                            {
                                Concatenate (\_SB.PCI0.PAGP.VGA0.DDC4, \_SB.PCI0.PAGP.VGA0.DDC0, Local0)
                                Return (Local0)
                            }

                            Return (0x00)
                        }
                    }

                    Device (GTV0)
                    {
                        Method (_ADR, 0, NotSerialized)
                        {
                            Return (0x0200)
                        }

                        Method (_DCS, 0, NotSerialized)
                        {
                            Return (0x1F)
                        }

                        Method (_DDC, 1, NotSerialized)
                        {
                            If (LEqual (Arg0, 0x01))
                            {
                                Return (\_SB.PCI0.PAGP.VGA0.DDC3)
                            }

                            If (LEqual (Arg0, 0x02))
                            {
                                Concatenate (\_SB.PCI0.PAGP.VGA0.DDC3, \_SB.PCI0.PAGP.VGA0.DDC0, Local0)
                                Return (Local0)
                            }

                            Return (0x00)
                        }
                    }

                    Name (DDC0, Buffer (0x80)
                    {
                        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                    })
                    Name (DDC3, Buffer (0x80)
                    {
                        0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 
                        0x41, 0xD0, 0xFE, 0x09, 0x00, 0x00, 0x00, 0x00, 
                        0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        0xF0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        0x00, 0x00, 0x00, 0x21, 0x08, 0x00, 0x00, 0x00, 
                        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xD3
                    })
                    Name (DDC4, Buffer (0x80)
                    {
                        0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 
                        0x36, 0x7F, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        0x00, 0x00, 0x02, 0x00, 0x01, 0x28, 0x1E, 0x00, 
                        0xF0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        0x00, 0x00, 0x00, 0x21, 0x08, 0x00, 0x00, 0x00, 
                        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xEC
                    })
                }
            }
        }

        Device (MBRS)
        {
            Name (_HID, EisaId ("PNP0C02"))
            Name (MSBF, ResourceTemplate ()
            {
                Memory32Fixed (ReadOnly,
                    0xFFFC0000,         // Address Base
                    0x00030000,         // Address Length
                    )
                IO (Decode16,
                    0x0000,             // Address Range Minimum
                    0x0000,             // Address Range Maximum
                    0x00,               // Address Alignment
                    0x00,               // Address Length
                    )
                Memory24 (ReadWrite,
                    0x0000,             // Address Range Minimum
                    0x0000,             // Address Range Maximum
                    0x0000,             // Address Alignment
                    0x0A00,             // Address Length
                    )
                Memory24 (ReadOnly,
                    0x0F00,             // Address Range Minimum
                    0x0F00,             // Address Range Maximum
                    0x0000,             // Address Alignment
                    0x0100,             // Address Length
                    )
                Memory32 (ReadOnly,
                    0xFFFF0000,         // Address Range Minimum
                    0xFFFF0000,         // Address Range Maximum
                    0x00000000,         // Address Alignment
                    0x00010000,         // Address Length
                    )
                Memory32 (ReadWrite,
                    0x00100000,         // Address Range Minimum
                    0x00100000,         // Address Range Maximum
                    0x00000000,         // Address Alignment
                    0x00000000,         // Address Length
                    )
                Memory32 (ReadWrite,
                    0x00000000,         // Address Range Minimum
                    0x00000000,         // Address Range Maximum
                    0x00000000,         // Address Alignment
                    0x00000000,         // Address Length
                    )
                IO (Decode16,
                    0xF100,             // Address Range Minimum
                    0xF100,             // Address Range Maximum
                    0x00,               // Address Alignment
                    0x40,               // Address Length
                    )
                IO (Decode16,
                    0xF140,             // Address Range Minimum
                    0xF140,             // Address Range Maximum
                    0x00,               // Address Alignment
                    0x20,               // Address Length
                    )
                IO (Decode16,
                    0x1060,             // Address Range Minimum
                    0x1060,             // Address Range Maximum
                    0x00,               // Address Alignment
                    0x10,               // Address Length
                    )
                IO (Decode16,
                    0x0080,             // Address Range Minimum
                    0x0080,             // Address Range Maximum
                    0x00,               // Address Alignment
                    0x01,               // Address Length
                    )
                IO (Decode16,
                    0x0092,             // Address Range Minimum
                    0x0092,             // Address Range Maximum
                    0x00,               // Address Alignment
                    0x01,               // Address Length
                    )
                IO (Decode16,
                    0x00B0,             // Address Range Minimum
                    0x00B0,             // Address Range Maximum
                    0x00,               // Address Alignment
                    0x04,               // Address Length
                    )
                IO (Decode16,
                    0x040B,             // Address Range Minimum
                    0x040B,             // Address Range Maximum
                    0x00,               // Address Alignment
                    0x01,               // Address Length
                    )
                IO (Decode16,
                    0x04D0,             // Address Range Minimum
                    0x04D0,             // Address Range Maximum
                    0x00,               // Address Alignment
                    0x02,               // Address Length
                    )
            })
            Method (_CRS, 0, NotSerialized)
            {
                CreateDWordField (MSBF, 0x50, MEM1)
                Store (\_SB.PCI0.AD4S.SMIO, Local1)
                And (Local1, 0x01, Local1)
                If (LEqual (Local1, 0x00))
                {
                    Store (0x00F00000, MEM1)
                }
                Else
                {
                    Store (0x00E00000, MEM1)
                }

                CreateDWordField (MSBF, 0x58, MS00)
                CreateDWordField (MSBF, 0x5C, MS01)
                CreateDWordField (MSBF, 0x64, MEM2)
                Store (\_SB.PCI0.AD4S.EXMH, Local1)
                ShiftLeft (Local1, 0x08, Local1)
                Store (\_SB.PCI0.AD4S.EXML, Local2)
                Add (Local1, Local2, Local1)
                ShiftRight (Local1, 0x02, Local1)
                If (LGreater (Local1, 0x10))
                {
                    Subtract (Local1, 0x0F, Local1)
                    ShiftLeft (Local1, 0x14, Local1)
                    Store (Local1, MEM2)
                    Store (0x01000000, MS00)
                    Store (0x01000000, MS01)
                }

                Return (MSBF)
            }

            Method (_STA, 0, NotSerialized)
            {
                Return (0x0F)
            }
        }

        Device (LID)
        {
            Name (_HID, EisaId ("PNP0C0D"))
            Method (_LID, 0, NotSerialized)
            {
                If (LEqual (\LIDS, 0x00))
                {
                    Sleep (0x07D0)
                    Store (0x00, \LIDF)
                    Return (0x00)
                }
                Else
                {
                    If (LEqual (\LIDF, 0x01))
                    {
                        Store (0x00, \LIDF)
                        Return (0x00)
                    }
                    Else
                    {
                        Return (0x01)
                    }
                }
            }

            Name (_PRW, Package (0x02)
            {
                0x07, 
                0x04
            })
        }

        Device (AC)
        {
            Name (_HID, "ACPI0003")
            Name (_PCL, Package (0x01)
            {
                \_SB
            })
            Method (_PSR, 0, NotSerialized)
            {
                And (\_SB.PCI0.MX71.R098, 0x02, Local0)
                If (LEqual (Local0, 0x02))
                {
                    Return (0x01)
                }
                Else
                {
                    Return (0x00)
                }
            }

            Method (_STA, 0, NotSerialized)
            {
                Return (0x0F)
            }
        }

        Device (BAT0)
        {
            Name (_HID, EisaId ("PNP0C0A"))
            Name (_PCL, Package (0x01)
            {
                \_SB
            })
            Method (_STA, 0, NotSerialized)
            {
                Store (0x21, \_SB.PCI0.AD4S.PXB1)
                Store (0x35, \_SB.PCI0.AD4S.PXB1)
                If (LEqual (DAT1, 0x01))
                {
                    Return (0x1F)
                }
                Else
                {
                    Return (0x0F)
                }
            }

            Method (_BIF, 0, NotSerialized)
            {
                Store (0x22, \_SB.PCI0.AD4S.PXB1)
                Store (0x0E10, Local0)
                Store (0x0E10, Local1)
                Name (BUF0, Package (0x0D) {})
                Store (0x01, Index (BUF0, 0x00))
                Store (Local0, Index (BUF0, 0x01))
                Store (Local1, Index (BUF0, 0x02))
                Store (0x01, Index (BUF0, 0x03))
                Store (0x39D0, Index (BUF0, 0x04))
                Divide (Local0, 0x0A, Local1, Local2)
                Store (Local2, Index (BUF0, 0x05))
                Divide (Local0, 0x14, Local1, Local3)
                Store (Local3, Index (BUF0, 0x06))
                Subtract (Local2, Local3, Local4)
                Store (Local4, Index (BUF0, 0x07))
                Subtract (Local0, Local2, Local4)
                Store (Local4, Index (BUF0, 0x08))
                Name (MDL, Buffer (0x05)
                {
                    "AS06"
                })
                Store (MDL, Index (BUF0, 0x09))
                Name (SRLN, Buffer (0x02)
                {
                    " "
                })
                Store (SRLN, Index (BUF0, 0x0A))
                Name (BTYP, Buffer (0x05)
                {
                    "LION"
                })
                Store (BTYP, Index (BUF0, 0x0B))
                Store (0x00, Index (BUF0, 0x0C))
                Return (BUF0)
            }

            Method (_BST, 0, NotSerialized)
            {
                Store (0x23, \_SB.PCI0.AD4S.PXB1)
                Name (BUF0, Package (0x04) {})
                Store (0x40, \_SB.PCI0.AD4S.PXB1)
                And (\_SB.PCI0.MX71.R098, 0x02, Local0)
                If (LEqual (Local0, 0x02))
                {
                    Store (0x35, \_SB.PCI0.AD4S.PXB1)
                    If (LEqual (DAT1, 0x01))
                    {
                        If (LEqual (DAT2, 0x64))
                        {
                            Store (0x01, Index (BUF0, 0x00))
                        }
                        Else
                        {
                            Store (0x02, Index (BUF0, 0x00))
                        }
                    }
                    Else
                    {
                        Store (0x00, Index (BUF0, 0x00))
                        Store (0xFFFFFFFF, Index (BUF0, 0x01))
                        Store (0xFFFFFFFF, Index (BUF0, 0x02))
                        Store (0xFFFFFFFF, Index (BUF0, 0x03))
                        Return (BUF0)
                    }
                }
                Else
                {
                    If (LNot (LGreater (DAT2, 0x06)))
                    {
                        Store (0x05, Index (BUF0, 0x00))
                    }
                    Else
                    {
                        Store (0x01, Index (BUF0, 0x00))
                    }
                }

                Store (0x24, \_SB.PCI0.AD4S.PXB1)
                Multiply (DAT2, 0x24, Local2)
                Store (0x04B0, Index (BUF0, 0x01))
                Add (Local2, 0x14, Local2)
                Store (Local2, Index (BUF0, 0x02))
                Store (0x39D0, Index (BUF0, 0x03))
                Return (BUF0)
            }
        }
    }
}

