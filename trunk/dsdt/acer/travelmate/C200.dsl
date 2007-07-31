/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20051117
 *
 * Disassembly of (null), Wed Dec 14 01:19:33 2005
 */
DefinitionBlock ("DSDT.aml", "DSDT", 1, "INTEL ", "ALVISO  ", 0x06040000)
{
    OperationRegion (PRT0, SystemIO, 0x80, 0x04)
    Field (PRT0, DWordAcc, Lock, Preserve)
    {
        P80H,   32
    }

    OperationRegion (IO_T, SystemIO, 0x0800, 0x10)
    Field (IO_T, ByteAcc, NoLock, Preserve)
    {
        Offset (0x02), 
        Offset (0x04), 
        Offset (0x06), 
        Offset (0x08), 
        TRP0,   8, 
        Offset (0x0A), 
        Offset (0x0B), 
        Offset (0x0C), 
        Offset (0x0D), 
        Offset (0x0E), 
        Offset (0x0F), 
        Offset (0x10)
    }

    OperationRegion (PMIO, SystemIO, 0x1000, 0x3C)
    Field (PMIO, ByteAcc, NoLock, Preserve)
    {
        Offset (0x28), 
            ,   1, 
        HOTS,   1, 
        Offset (0x2A), 
        BAYS,   2, 
        Offset (0x2B), 
            ,   3, 
        LIDS,   1, 
        Z000,   1, 
        Offset (0x2C), 
            ,   1, 
        HOTP,   1
    }

    OperationRegion (GPIO, SystemIO, 0x1180, 0x3C)
    Field (GPIO, ByteAcc, NoLock, Preserve)
    {
        GU00,   8, 
        GU01,   8, 
        GU02,   8, 
        GU03,   8, 
        GIO0,   8, 
        GIO1,   8, 
        GIO2,   8, 
        GIO3,   8, 
        Offset (0x0C), 
        GL00,   8, 
        GL01,   8, 
        BAYO,   1, 
            ,   4, 
        GP21,   1, 
            ,   1, 
        BAYR,   1, 
            ,   1, 
        GP25,   1, 
        Offset (0x10), 
        Offset (0x18), 
        GB00,   8, 
        GB01,   8, 
        GB02,   8, 
        GB03,   8, 
        Offset (0x2C), 
        GIV0,   8, 
            ,   3, 
        LIDP,   1, 
        Z001,   1, 
        Offset (0x2E), 
        GIV2,   8, 
        GIV3,   8, 
        GU04,   8, 
        GU05,   8, 
        GU06,   8, 
        GU07,   8, 
        GIO4,   8, 
        GIO5,   8, 
        GIO6,   8, 
        GIO7,   8, 
            ,   1, 
        GP33,   1, 
        Offset (0x39), 
        GL05,   8, 
        GL06,   8, 
        GL07,   8
    }

    OperationRegion (MNVS, SystemMemory, 0x3FE8AD2C, 0x0100)
    Field (MNVS, AnyAcc, Lock, Preserve)
    {
        OSYS,   16, 
        SMIF,   8, 
        PRM0,   8, 
        PRM1,   8, 
        SCIF,   8, 
        PRM2,   8, 
        PRM3,   8, 
        Offset (0x09), 
        Offset (0x0A), 
        Offset (0x0B), 
        P80D,   32, 
        Offset (0x10), 
        Offset (0x11), 
        Offset (0x12), 
        Offset (0x14), 
        Offset (0x1E), 
        Offset (0x28), 
        APIC,   8, 
        CPUL,   8, 
        CPUH,   8, 
        GV3E,   8, 
        HTTE,   8, 
        WTHT,   8, 
        Offset (0x32), 
        Offset (0x3C), 
        IGDS,   8, 
        TLST,   8, 
        CADL,   8, 
        PADL,   8, 
        CSTE,   16, 
        NSTE,   16, 
        SSTE,   16, 
        NDID,   8, 
        DID1,   32, 
        DID2,   32, 
        DID3,   32, 
        DID4,   32, 
        DID5,   32, 
        Offset (0x67), 
        Offset (0x69), 
        Offset (0x6E), 
        Offset (0x78), 
        D400,   8, 
        Offset (0x82), 
        GTF0,   56, 
        GTF2,   56, 
        IDEM,   8
    }

    OperationRegion (RCRB, SystemMemory, 0xF0008000, 0x4000)
    Field (RCRB, DWordAcc, Lock, Preserve)
    {
        Offset (0x1000), 
        Offset (0x3000), 
        Offset (0x3404), 
        HPAS,   2, 
            ,   5, 
        HPAE,   1, 
        Offset (0x3418), 
            ,   1, 
        PATD,   1, 
        SATD,   1, 
        SMBD,   1, 
        AZAD,   1, 
        A97D,   1, 
        Offset (0x341A), 
        RP1D,   1, 
        RP2D,   1, 
        RP3D,   1, 
        RP4D,   1
    }

    Mutex (MUTX, 0x00)
    Name (_S0, Package (0x03)
    {
        0x00, 
        0x00, 
        0x00
    })
    Name (_S3, Package (0x03)
    {
        0x05, 
        0x05, 
        0x00
    })
    Name (_S4, Package (0x03)
    {
        0x06, 
        0x06, 
        0x00
    })
    Name (_S5, Package (0x03)
    {
        0x07, 
        0x07, 
        0x00
    })
    Scope (\_PR)
    {
        Processor (CPU0, 0x00, 0x00001010, 0x06) {}
        Processor (CPU1, 0x01, 0x00001010, 0x06) {}
    }

    Name (\DSEN, 0x00)
    Name (\ECON, 0x00)
    Name (\GPIC, 0x00)
    Name (\CTYP, 0x00)
    Name (\L01C, 0x00)
    Name (\INSX, 0x00)
    Name (\IS34, 0x00)
    Name (\PPMF, 0x80000000)
    Method (\_PIC, 1, NotSerialized)
    {
        Store (Arg0, GPIC)
    }

    Method (_PTS, 1, NotSerialized)
    {
        Store (0x00, P80D)
        P8XH (0x00, Arg0)
        If (LEqual (Arg0, 0x04))
        {
            Store (0x01, INS4)
            Acquire (\_SB.PCI0.LPCB.EC0.MUT1, 0xFFFF)
            Store (0x01, \_SB.PCI0.LPCB.EC0.FLS4)
            Release (\_SB.PCI0.LPCB.EC0.MUT1)
        }

        If (\_SB.ECOK)
        {
            Acquire (\_SB.PCI0.LPCB.EC0.MUT1, 0xFFFF)
            If (LEqual (\_SB.PCI0.PCIB.LANC.LANP, 0x00))
            {
                Store (0x00, \_SB.PCI0.LPCB.EC0.VAUX)
            }
            Else
            {
                Store (0x01, \_SB.PCI0.LPCB.EC0.VAUX)
            }

            Release (\_SB.PCI0.LPCB.EC0.MUT1)
        }

        \_SB.PHSR (0x08, 0x00)
        Store (0x00, HOTP)
    }

    Method (_WAK, 1, NotSerialized)
    {
        P8XH (0x00, 0x00)
        Store (0x00, IS34)
        Store (\_SB.PCI0.PATA.PRID.BAY.BAYF (), Local0)
        If (LEqual (Local0, 0x00))
        {
            \_SB.PHSR (0x0D, 0x01)
            Store (0x00, BAYR)
            Notify (\_SB.PCI0.PATA.PRID.BAY, 0x03)
            Sleep (0x01F4)
        }

        If (LEqual (Arg0, 0x03))
        {
            \_SB.PHSR (0x00, 0x00)
            Store (0x01, INSX)
        }

        If (LEqual (Arg0, 0x04))
        {
            Store (0x00, INS4)
            Store (0x01, INSX)
        }

        \_SB.PHSR (0x08, 0x01)
        If (LOr (LEqual (Arg0, 0x04), LEqual (Arg0, 0x03)))
        {
            Store (0x01, IS34)
            Store (\_SB.BTEN, \_SB.PCI0.LPCB.EC0.BLTH)
            Store (\_SB.WLAN, \_SB.PCI0.LPCB.EC0.WLAN)
            Store (0x01, \_SB.PCI0.LPCB.EC0.CPLE)
        }

        If (Z001)
        {
            If (LEqual (\_SB.PCI0.DOCK.DCKS, 0x00))
            {
                XOr (Z001, 0x01, Z001)
                Store (0x00, Z001)
            }
        }
        Else
        {
            If (LEqual (\_SB.PCI0.DOCK.DCKS, 0x01))
            {
                XOr (Z001, 0x01, Z001)
                Store (0x01, Z001)
            }
        }

        Return (Package (0x02)
        {
            0x00, 
            0x00
        })
    }

    Scope (\_GPE)
    {
        Method (_L01, 0, NotSerialized)
        {
            Add (L01C, 0x01, L01C)
            P8XH (0x00, 0x01)
            P8XH (0x01, L01C)
            Sleep (0x64)
            If (\_SB.PCI0.RP01.HPCS)
            {
                If (\_SB.PCI0.RP01.PDC1)
                {
                    Store (0x01, \_SB.PCI0.RP01.PDC1)
                    Notify (\_SB.PCI0.RP01, 0x00)
                }

                Store (0x01, \_SB.PCI0.RP01.HPCS)
            }

            If (\_SB.PCI0.RP02.HPCS)
            {
                If (\_SB.PCI0.RP02.PDC2)
                {
                    Store (0x01, \_SB.PCI0.RP02.PDC2)
                    Notify (\_SB.PCI0.RP02, 0x00)
                }

                Store (0x01, \_SB.PCI0.RP02.HPCS)
            }

            If (\_SB.PCI0.RP03.HPCS)
            {
                If (\_SB.PCI0.RP03.PDC3)
                {
                    Store (0x01, \_SB.PCI0.RP03.PDC3)
                }

                Store (0x01, \_SB.PCI0.RP03.HPCS)
            }

            If (\_SB.PCI0.RP04.HPCS)
            {
                If (\_SB.PCI0.RP04.PDC4)
                {
                    Store (0x01, \_SB.PCI0.RP04.PDC4)
                    Notify (\_SB.PCI0.RP04, 0x00)
                }

                Store (0x01, \_SB.PCI0.RP04.HPCS)
            }
        }

        Method (_L03, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.USB1, 0x02)
        }

        Method (_L04, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.USB2, 0x02)
        }

        Method (_L05, 0, NotSerialized)
        {
            If (AZAD) {}
            Else
            {
                Notify (\_SB.PCI0.AZAL, 0x02)
            }
        }

        Method (_L09, 0, NotSerialized)
        {
            If (\_SB.PCI0.RP01.PSP1)
            {
                Store (0x01, \_SB.PCI0.RP01.PSP1)
                Store (0x01, \_SB.PCI0.RP01.PMCS)
                Notify (\_SB.PCI0.RP01, 0x02)
            }

            If (\_SB.PCI0.RP02.PSP2)
            {
                Store (0x01, \_SB.PCI0.RP02.PSP2)
                Store (0x01, \_SB.PCI0.RP02.PMCS)
                Notify (\_SB.PCI0.RP02, 0x02)
            }

            If (\_SB.PCI0.RP03.PSP3)
            {
                Store (0x01, \_SB.PCI0.RP03.PSP3)
                Store (0x01, \_SB.PCI0.RP03.PMCS)
                Notify (\_SB.PCI0.RP03, 0x02)
            }

            If (\_SB.PCI0.RP04.PSP4)
            {
                Store (0x01, \_SB.PCI0.RP04.PSP4)
                Store (0x01, \_SB.PCI0.RP04.PMCS)
                Notify (\_SB.PCI0.RP04, 0x02)
            }
        }

        Method (_L0B, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.PCIB, 0x02)
        }

        Method (_L0C, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.USB3, 0x02)
        }

        Method (_L0D, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.USB7, 0x02)
        }

        Method (_L0E, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.USB4, 0x02)
        }

        Method (_L1B, 0, NotSerialized)
        {
            Notify (\_SB.LID, 0x80)
        }
    }

    Method (GETB, 3, Serialized)
    {
        Multiply (Arg0, 0x08, Local0)
        Multiply (Arg1, 0x08, Local1)
        CreateField (Arg2, Local0, Local1, TBF3)
        Return (TBF3)
    }

    Method (HKDS, 1, Serialized)
    {
        If (LEqual (0x00, DSEN))
        {
            Store (Arg0, SMIF)
            Store (0x00, TRP0)
            If (LEqual (SMIF, 0x00))
            {
                If (LNot (LEqual (CADL, PADL)))
                {
                    Store (CADL, PADL)
                    If (LEqual (OSYS, 0x07D1))
                    {
                        Notify (\_SB.PCI0, 0x00)
                    }
                    Else
                    {
                        Notify (\_SB.PCI0.GFX0, 0x00)
                    }

                    Sleep (0x02EE)
                }

                Notify (\_SB.PCI0.GFX0, 0x80)
            }
        }

        If (LEqual (0x01, DSEN))
        {
            Store (Increment (Arg0), SMIF)
            Store (0x00, TRP0)
            If (LEqual (SMIF, 0x00))
            {
                Notify (\_SB.PCI0.GFX0, 0x81)
            }
        }
    }

    Method (LSDS, 1, Serialized)
    {
        If (Arg0)
        {
            HKDS (0x0C)
        }
        Else
        {
            HKDS (0x0E)
        }

        If (LNot (LEqual (DSEN, 0x01)))
        {
            Sleep (0x32)
            While (LEqual (DSEN, 0x02))
            {
                Sleep (0x32)
            }
        }
    }

    Method (P8XH, 2, Serialized)
    {
        If (LEqual (Arg0, 0x00))
        {
            Store (Or (And (P80D, 0xFFFFFF00), Arg1), P80D)
        }

        If (LEqual (Arg0, 0x01))
        {
            Store (Or (And (P80D, 0xFFFF00FF), ShiftLeft (Arg1, 0x08)), P80D)
        }

        If (LEqual (Arg0, 0x02))
        {
            Store (Or (And (P80D, 0xFF00FFFF), ShiftLeft (Arg1, 0x10)), P80D)
        }

        If (LEqual (Arg0, 0x03))
        {
            Store (Or (And (P80D, 0x00FFFFFF), ShiftLeft (Arg1, 0x18)), P80D)
        }

        Store (P80D, P80H)
    }

    Method (PNOT, 0, Serialized)
    {
        If (HTTE)
        {
            If (LEqual (And (PDC0, 0x0A), 0x0A))
            {
                Notify (\_PR.CPU0, 0x80)
            }

            If (LEqual (And (PDC1, 0x0A), 0x0A))
            {
                Notify (\_PR.CPU1, 0x80)
            }
        }
        Else
        {
            Notify (\_PR.CPU0, 0x80)
            Sleep (0x64)
            Notify (\_PR.CPU0, 0x81)
        }
    }

    Method (VTOB, 1, NotSerialized)
    {
        Store (0x01, Local0)
        ShiftLeft (Local0, Arg0, Local0)
        Return (Local0)
    }

    Method (BTOV, 1, NotSerialized)
    {
        ShiftRight (Arg0, 0x01, Local0)
        Store (0x00, Local1)
        While (Local0)
        {
            Increment (Local1)
            ShiftRight (Local0, 0x01, Local0)
        }

        Return (Local1)
    }

    Method (MKWD, 2, NotSerialized)
    {
        If (And (Arg1, 0x80))
        {
            Store (0xFFFF0000, Local0)
        }
        Else
        {
            Store (Zero, Local0)
        }

        Or (Local0, Arg0, Local0)
        Or (Local0, ShiftLeft (Arg1, 0x08), Local0)
        Return (Local0)
    }

    Method (POSW, 1, NotSerialized)
    {
        If (And (Arg0, 0x8000))
        {
            If (LEqual (Arg0, 0xFFFF))
            {
                Return (0xFFFFFFFF)
            }
            Else
            {
                Not (Arg0, Local0)
                Increment (Local0)
                And (Local0, 0xFFFF, Local0)
                Return (Local0)
            }
        }
        Else
        {
            Return (Arg0)
        }
    }

    Method (GBFE, 3, NotSerialized)
    {
        CreateByteField (Arg0, Arg1, TIDX)
        Store (TIDX, Arg2)
    }

    Method (PBFE, 3, NotSerialized)
    {
        CreateByteField (Arg0, Arg1, TIDX)
        Store (Arg2, TIDX)
    }

    Method (ITOS, 1, NotSerialized)
    {
        Store (Buffer (0x09)
            {
                0x30, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                0x00
            }, Local0)
        Store (Buffer (0x11)
            {
                "0123456789ABCDEF"
            }, Local7)
        Store (0x08, Local1)
        Store (0x00, Local2)
        Store (0x00, Local3)
        While (Local1)
        {
            Decrement (Local1)
            And (ShiftRight (Arg0, ShiftLeft (Local1, 0x02)), 0x0F, Local4)
            If (Local4)
            {
                Store (Ones, Local3)
            }

            If (Local3)
            {
                GBFE (Local7, Local4, RefOf (Local5))
                PBFE (Local0, Local2, Local5)
                Increment (Local2)
            }
        }

        Return (Local0)
    }

    Method (GETP, 1, Serialized)
    {
        If (LEqual (And (Arg0, 0x09), 0x00))
        {
            Return (0xFFFFFFFF)
        }

        If (LEqual (And (Arg0, 0x09), 0x08))
        {
            Return (0x0384)
        }

        ShiftRight (And (Arg0, 0x0300), 0x08, Local0)
        ShiftRight (And (Arg0, 0x3000), 0x0C, Local1)
        Return (Multiply (0x1E, Subtract (0x09, Add (Local0, Local1))))
    }

    Method (GDMA, 5, Serialized)
    {
        If (Arg0)
        {
            If (LAnd (Arg1, Arg4))
            {
                Return (0x14)
            }

            If (LAnd (Arg2, Arg4))
            {
                Return (Multiply (Subtract (0x04, Arg3), 0x0F))
            }

            Return (Multiply (Subtract (0x04, Arg3), 0x1E))
        }

        Return (0xFFFFFFFF)
    }

    Method (GETT, 1, Serialized)
    {
        Return (Multiply (0x1E, Subtract (0x09, Add (And (ShiftRight (Arg0, 0x02), 0x03), And (Arg0, 0x03)))))
    }

    Method (GETF, 3, Serialized)
    {
        Name (TMPF, 0x00)
        If (Arg0)
        {
            Or (TMPF, 0x01, TMPF)
        }

        If (And (Arg2, 0x02))
        {
            Or (TMPF, 0x02, TMPF)
        }

        If (Arg1)
        {
            Or (TMPF, 0x04, TMPF)
        }

        If (And (Arg2, 0x20))
        {
            Or (TMPF, 0x08, TMPF)
        }

        If (And (Arg2, 0x4000))
        {
            Or (TMPF, 0x10, TMPF)
        }

        Return (TMPF)
    }

    Method (SETP, 3, Serialized)
    {
        If (LGreater (Arg0, 0xF0))
        {
            Return (0x08)
        }
        Else
        {
            If (And (Arg1, 0x02))
            {
                If (LAnd (LNot (LGreater (Arg0, 0x78)), And (Arg2, 0x02)))
                {
                    Return (0x2301)
                }

                If (LAnd (LNot (LGreater (Arg0, 0xB4)), And (Arg2, 0x01)))
                {
                    Return (0x2101)
                }
            }

            Return (0x1001)
        }
    }

    Method (SDMA, 1, Serialized)
    {
        If (LNot (LGreater (Arg0, 0x14)))
        {
            Return (0x01)
        }

        If (LNot (LGreater (Arg0, 0x1E)))
        {
            Return (0x02)
        }

        If (LNot (LGreater (Arg0, 0x2D)))
        {
            Return (0x01)
        }

        If (LNot (LGreater (Arg0, 0x3C)))
        {
            Return (0x02)
        }

        If (LNot (LGreater (Arg0, 0x5A)))
        {
            Return (0x01)
        }

        Return (0x00)
    }

    Method (SETT, 3, Serialized)
    {
        If (And (Arg1, 0x02))
        {
            If (LAnd (LNot (LGreater (Arg0, 0x78)), And (Arg2, 0x02)))
            {
                Return (0x0B)
            }

            If (LAnd (LNot (LGreater (Arg0, 0xB4)), And (Arg2, 0x01)))
            {
                Return (0x09)
            }
        }

        Return (0x04)
    }

    OperationRegion (NV1, SystemIO, 0x72, 0x02)
    Field (NV1, ByteAcc, NoLock, Preserve)
    {
        INDX,   8, 
        DATA,   8
    }

    IndexField (INDX, DATA, ByteAcc, NoLock, Preserve)
    {
        Offset (0x6E), 
        INS4,   1, 
        Offset (0x70), 
        DLST,   8, 
        DSNB,   1
    }

    Scope (\_SB)
    {
        Name (ECOK, 0x00)
        Device (PCI0)
        {
            Method (_INI, 0, NotSerialized)
            {
                If (CondRefOf (_OSI, Local0))
                {
                    Store (0x07D1, OSYS)
                    If (HTTE) {}
                }
                Else
                {
                    If (LOr (LEqual (SizeOf (_OS), 0x14), LEqual (SizeOf (_OS), 0x05)))
                    {
                        Store (0x07D0, OSYS)
                    }
                    Else
                    {
                        If (LEqual (SizeOf (_OS), 0x27))
                        {
                            Store (0x07CF, OSYS)
                        }
                        Else
                        {
                            Store (0x07CE, OSYS)
                        }
                    }
                }

                If (LNot (LGreater (OSYS, 0x07CF)))
                {
                    Store (0x01, ECON)
                }

                \_SB.PCI0.PATA.PRID.BAY.BAYF ()
            }

            Method (_S3D, 0, NotSerialized)
            {
                Return (0x02)
            }

            Method (_S4D, 0, NotSerialized)
            {
                Return (0x02)
            }

            Name (_HID, EisaId ("PNP0A08"))
            Name (_CID, 0x030AD041)
            Name (_ADR, 0x00)
            Name (_BBN, 0x00)
            OperationRegion (HBUS, PCI_Config, 0x40, 0xC0)
            Field (HBUS, DWordAcc, NoLock, Preserve)
            {
                Offset (0x14), 
                    ,   1, 
                PEGA,   1, 
                Offset (0x50), 
                    ,   4, 
                PM0H,   2, 
                Offset (0x51), 
                PM1L,   2, 
                    ,   2, 
                PM1H,   2, 
                Offset (0x52), 
                PM2L,   2, 
                    ,   2, 
                PM2H,   2, 
                Offset (0x53), 
                PM3L,   2, 
                    ,   2, 
                PM3H,   2, 
                Offset (0x54), 
                PM4L,   2, 
                    ,   2, 
                PM4H,   2, 
                Offset (0x55), 
                PM5L,   2, 
                    ,   2, 
                PM5H,   2, 
                Offset (0x56), 
                PM6L,   2, 
                    ,   2, 
                PM6H,   2, 
                Offset (0x57), 
                    ,   7, 
                HENA,   1, 
                Offset (0x5C), 
                    ,   3, 
                TOUD,   5
            }

            Name (BUF0, ResourceTemplate ()
            {
                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                    0x0000,             // Address Space Granularity
                    0x0000,             // Address Range Minimum
                    0x00FF,             // Address Range Maximum
                    0x0000,             // Address Translation Offset
                    0x0100,             // Address Length
                    0x00,,)
                DWordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x00000000,         // Address Space Granularity
                    0x00000000,         // Address Range Minimum
                    0x00000CF7,         // Address Range Maximum
                    0x00000000,         // Address Translation Offset
                    0x00000CF8,         // Address Length
                    0x00,,, TypeStatic)
                IO (Decode16,
                    0x0CF8,             // Address Range Minimum
                    0x0CF8,             // Address Range Maximum
                    0x01,               // Address Alignment
                    0x08,               // Address Length
                    )
                DWordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x00000000,         // Address Space Granularity
                    0x00000D00,         // Address Range Minimum
                    0x0000BFFF,         // Address Range Maximum
                    0x00000000,         // Address Translation Offset
                    0x0000B300,         // Address Length
                    0x00,,, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Address Space Granularity
                    0x000A0000,         // Address Range Minimum
                    0x000BFFFF,         // Address Range Maximum
                    0x00000000,         // Address Translation Offset
                    0x00020000,         // Address Length
                    0x00,,, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Address Space Granularity
                    0x000C0000,         // Address Range Minimum
                    0x000C3FFF,         // Address Range Maximum
                    0x00000000,         // Address Translation Offset
                    0x00004000,         // Address Length
                    0x00,,, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Address Space Granularity
                    0x000C4000,         // Address Range Minimum
                    0x000C7FFF,         // Address Range Maximum
                    0x00000000,         // Address Translation Offset
                    0x00004000,         // Address Length
                    0x00,,, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Address Space Granularity
                    0x000C8000,         // Address Range Minimum
                    0x000CBFFF,         // Address Range Maximum
                    0x00000000,         // Address Translation Offset
                    0x00004000,         // Address Length
                    0x00,,, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Address Space Granularity
                    0x000CC000,         // Address Range Minimum
                    0x000CFFFF,         // Address Range Maximum
                    0x00000000,         // Address Translation Offset
                    0x00004000,         // Address Length
                    0x00,,, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Address Space Granularity
                    0x000D0000,         // Address Range Minimum
                    0x000D3FFF,         // Address Range Maximum
                    0x00000000,         // Address Translation Offset
                    0x00004000,         // Address Length
                    0x00,,, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Address Space Granularity
                    0x000D4000,         // Address Range Minimum
                    0x000D7FFF,         // Address Range Maximum
                    0x00000000,         // Address Translation Offset
                    0x00004000,         // Address Length
                    0x00,,, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Address Space Granularity
                    0x000D8000,         // Address Range Minimum
                    0x000DBFFF,         // Address Range Maximum
                    0x00000000,         // Address Translation Offset
                    0x00004000,         // Address Length
                    0x00,,, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Address Space Granularity
                    0x000DC000,         // Address Range Minimum
                    0x000DFFFF,         // Address Range Maximum
                    0x00000000,         // Address Translation Offset
                    0x00004000,         // Address Length
                    0x00,,, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Address Space Granularity
                    0x000E0000,         // Address Range Minimum
                    0x000E3FFF,         // Address Range Maximum
                    0x00000000,         // Address Translation Offset
                    0x00004000,         // Address Length
                    0x00,,, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Address Space Granularity
                    0x000E4000,         // Address Range Minimum
                    0x000E7FFF,         // Address Range Maximum
                    0x00000000,         // Address Translation Offset
                    0x00004000,         // Address Length
                    0x00,,, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Address Space Granularity
                    0x000E8000,         // Address Range Minimum
                    0x000EBFFF,         // Address Range Maximum
                    0x00000000,         // Address Translation Offset
                    0x00004000,         // Address Length
                    0x00,,, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Address Space Granularity
                    0x000EC000,         // Address Range Minimum
                    0x000EFFFF,         // Address Range Maximum
                    0x00000000,         // Address Translation Offset
                    0x00004000,         // Address Length
                    0x00,,, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Address Space Granularity
                    0x000F0000,         // Address Range Minimum
                    0x000FFFFF,         // Address Range Maximum
                    0x00000000,         // Address Translation Offset
                    0x00010000,         // Address Length
                    0x00,,, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Address Space Granularity
                    0x00000000,         // Address Range Minimum
                    0xFEBFFFFF,         // Address Range Maximum
                    0x00000000,         // Address Translation Offset
                    0x00000000,         // Address Length
                    0x00,,, AddressRangeMemory, TypeStatic)
            })
            Method (_CRS, 0, Serialized)
            {
                If (PM1L)
                {
                    CreateDWordField (BUF0, 0x80, C0LN)
                    Store (Zero, C0LN)
                }

                If (LEqual (PM1L, 0x01))
                {
                    CreateBitField (BUF0, 0x0378, C0RW)
                    Store (Zero, C0RW)
                }

                If (PM1H)
                {
                    CreateDWordField (BUF0, 0x9B, C4LN)
                    Store (Zero, C4LN)
                }

                If (LEqual (PM1H, 0x01))
                {
                    CreateBitField (BUF0, 0x0450, C4RW)
                    Store (Zero, C4RW)
                }

                If (PM2L)
                {
                    CreateDWordField (BUF0, 0xB6, C8LN)
                    Store (Zero, C8LN)
                }

                If (LEqual (PM2L, 0x01))
                {
                    CreateBitField (BUF0, 0x0528, C8RW)
                    Store (Zero, C8RW)
                }

                If (PM2H)
                {
                    CreateDWordField (BUF0, 0xD1, CCLN)
                    Store (Zero, CCLN)
                }

                If (LEqual (PM2H, 0x01))
                {
                    CreateBitField (BUF0, 0x0600, CCRW)
                    Store (Zero, CCRW)
                }

                If (PM3L)
                {
                    CreateDWordField (BUF0, 0xEC, D0LN)
                    Store (Zero, D0LN)
                }

                If (LEqual (PM3L, 0x01))
                {
                    CreateBitField (BUF0, 0x06D8, D0RW)
                    Store (Zero, D0RW)
                }

                If (PM3H)
                {
                    CreateDWordField (BUF0, 0x0107, D4LN)
                    Store (Zero, D4LN)
                }

                If (LEqual (PM3H, 0x01))
                {
                    CreateBitField (BUF0, 0x07B0, D4RW)
                    Store (Zero, D4RW)
                }

                If (PM4L)
                {
                    CreateDWordField (BUF0, 0x0122, D8LN)
                    Store (Zero, D8LN)
                }

                If (LEqual (PM4L, 0x01))
                {
                    CreateBitField (BUF0, 0x0888, D8RW)
                    Store (Zero, D8RW)
                }

                If (PM4H)
                {
                    CreateDWordField (BUF0, 0x013D, DCLN)
                    Store (Zero, DCLN)
                }

                If (LEqual (PM4H, 0x01))
                {
                    CreateBitField (BUF0, 0x0960, DCRW)
                    Store (Zero, DCRW)
                }

                If (PM5L)
                {
                    CreateDWordField (BUF0, 0x0158, E0LN)
                    Store (Zero, E0LN)
                }

                If (LEqual (PM5L, 0x01))
                {
                    CreateBitField (BUF0, 0x0A38, E0RW)
                    Store (Zero, E0RW)
                }

                If (PM5H)
                {
                    CreateDWordField (BUF0, 0x0173, E4LN)
                    Store (Zero, E4LN)
                }

                If (LEqual (PM5H, 0x01))
                {
                    CreateBitField (BUF0, 0x0B10, E4RW)
                    Store (Zero, E4RW)
                }

                If (PM6L)
                {
                    CreateDWordField (BUF0, 0x018E, E8LN)
                    Store (Zero, E8LN)
                }

                If (LEqual (PM6L, 0x01))
                {
                    CreateBitField (BUF0, 0x0BE8, E8RW)
                    Store (Zero, E8RW)
                }

                If (PM6H)
                {
                    CreateDWordField (BUF0, 0x01A9, ECLN)
                    Store (Zero, ECLN)
                }

                If (LEqual (PM6H, 0x01))
                {
                    CreateBitField (BUF0, 0x0CC0, ECRW)
                    Store (Zero, ECRW)
                }

                If (PM0H)
                {
                    CreateDWordField (BUF0, 0x01C4, F0LN)
                    Store (Zero, F0LN)
                }

                If (LEqual (PM0H, 0x01))
                {
                    CreateBitField (BUF0, 0x0D98, F0RW)
                    Store (Zero, F0RW)
                }

                CreateDWordField (BUF0, 0x01D3, M1MN)
                CreateDWordField (BUF0, 0x01D7, M1MX)
                CreateDWordField (BUF0, 0x01DF, M1LN)
                ShiftLeft (TOUD, 0x1B, M1MN)
                Add (Subtract (M1MX, M1MN), 0x01, M1LN)
                Return (BUF0)
            }

            Device (PDRC)
            {
                Name (_HID, EisaId ("PNP0C02"))
                Name (_UID, 0x01)
                Name (_CRS, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0xE0000000,         // Address Base
                        0x10000000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xF0000000,         // Address Base
                        0x00004000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xF0004000,         // Address Base
                        0x00001000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xF0005000,         // Address Base
                        0x00001000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xF0008000,         // Address Base
                        0x00004000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFED20000,         // Address Base
                        0x00070000,         // Address Length
                        )
                })
            }

            Method (_PRT, 0, NotSerialized)
            {
                If (GPIC)
                {
                    Return (Package (0x11)
                    {
                        Package (0x04)
                        {
                            0x0001FFFF, 
                            0x00, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x0002FFFF, 
                            0x00, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x0007FFFF, 
                            0x00, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x001BFFFF, 
                            0x00, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x00, 
                            0x00, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x01, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x02, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x03, 
                            0x00, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x00, 
                            0x00, 
                            0x17
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x01, 
                            0x00, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x02, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x03, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x001EFFFF, 
                            0x00, 
                            0x00, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x001EFFFF, 
                            0x01, 
                            0x00, 
                            0x14
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x00, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x01, 
                            0x00, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x03, 
                            0x00, 
                            0x10
                        }
                    })
                }
                Else
                {
                    Return (Package (0x11)
                    {
                        Package (0x04)
                        {
                            0x0001FFFF, 
                            0x00, 
                            \_SB.PCI0.LPCB.LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0002FFFF, 
                            0x00, 
                            \_SB.PCI0.LPCB.LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0007FFFF, 
                            0x00, 
                            \_SB.PCI0.LPCB.LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001BFFFF, 
                            0x00, 
                            \_SB.PCI0.LPCB.LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x00, 
                            \_SB.PCI0.LPCB.LNKB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x01, 
                            \_SB.PCI0.LPCB.LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x02, 
                            \_SB.PCI0.LPCB.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x03, 
                            \_SB.PCI0.LPCB.LNKD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x00, 
                            \_SB.PCI0.LPCB.LNKH, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x01, 
                            \_SB.PCI0.LPCB.LNKD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x02, 
                            \_SB.PCI0.LPCB.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x03, 
                            \_SB.PCI0.LPCB.LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001EFFFF, 
                            0x00, 
                            \_SB.PCI0.LPCB.LNKB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001EFFFF, 
                            0x01, 
                            \_SB.PCI0.LPCB.LNKE, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x00, 
                            \_SB.PCI0.LPCB.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x01, 
                            \_SB.PCI0.LPCB.LNKD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x03, 
                            \_SB.PCI0.LPCB.LNKA, 
                            0x00
                        }
                    })
                }
            }

            Device (PEGP)
            {
                Name (_ADR, 0x00010000)
                Method (_STA, 0, NotSerialized)
                {
                    If (PEGA)
                    {
                        Return (0x0F)
                    }
                    Else
                    {
                        Return (0x00)
                    }
                }

                Method (_PRT, 0, NotSerialized)
                {
                    If (GPIC)
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                0x00, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                0x00, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                0x00, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                0x00, 
                                0x13
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                \_SB.PCI0.LPCB.LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                \_SB.PCI0.LPCB.LNKB, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                \_SB.PCI0.LPCB.LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                \_SB.PCI0.LPCB.LNKD, 
                                0x00
                            }
                        })
                    }
                }

                Device (VGA)
                {
                    Name (_ADR, 0x00)
                    Name (SWIT, 0x01)
                    Name (CRTA, 0x00)
                    Name (LCDA, 0x01)
                    Name (TV0A, 0x00)
                    Name (DVIA, 0x00)
                    Name (TOGF, 0x00)
                    Name (LSTF, 0x00)
                    Name (DISD, 0x01)
                    Name (WDAS, 0x01)
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }

                    Name (_PSC, 0x00)
                    Method (_PS0, 0, NotSerialized)
                    {
                        Store (0x00, _PSC)
                    }

                    Method (_PS3, 0, NotSerialized)
                    {
                        Store (0x03, _PSC)
                    }

                    Method (_DOS, 1, NotSerialized)
                    {
                        Store (And (Arg0, 0x03), SWIT)
                    }

                    Method (_DOD, 0, NotSerialized)
                    {
                        Return (Package (0x04)
                        {
                            0x00010100, 
                            0x00010110, 
                            0x00010200, 
                            0x00010210
                        })
                    }

                    Device (CRT)
                    {
                        Name (_ADR, 0x0100)
                        Method (_DCS, 0, NotSerialized)
                        {
                            If (CRTA)
                            {
                                Return (0x1F)
                            }
                            Else
                            {
                                Return (0x1D)
                            }
                        }

                        Method (_DGS, 0, NotSerialized)
                        {
                            If (CRTA)
                            {
                                Return (0x01)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }

                        Method (_DSS, 1, NotSerialized)
                        {
                            Store ("CRT --_DSS", Debug)
                        }
                    }

                    Device (DVI)
                    {
                        Name (_ADR, 0x0210)
                        Method (_DCS, 0, NotSerialized)
                        {
                            If (DVIA)
                            {
                                Return (0x1F)
                            }
                            Else
                            {
                                Return (0x1D)
                            }
                        }

                        Method (_DGS, 0, NotSerialized)
                        {
                            If (DVIA)
                            {
                                Return (0x01)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }

                        Method (_DSS, 1, NotSerialized)
                        {
                            Store ("DVI --_DSS", Debug)
                        }
                    }

                    Device (TV0)
                    {
                        Name (_ADR, 0x0200)
                        Method (_DCS, 0, NotSerialized)
                        {
                            If (TV0A)
                            {
                                Return (0x1F)
                            }
                            Else
                            {
                                Return (0x1D)
                            }
                        }

                        Method (_DGS, 0, NotSerialized)
                        {
                            If (TV0A)
                            {
                                Return (0x01)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }

                        Method (_DSS, 1, NotSerialized)
                        {
                            Store ("TV --_DSS", Debug)
                        }
                    }

                    Device (LCD)
                    {
                        Name (_ADR, 0x0110)
                        Method (_DCS, 0, NotSerialized)
                        {
                            If (LCDA)
                            {
                                Return (0x1F)
                            }
                            Else
                            {
                                Return (0x1D)
                            }
                        }

                        Method (_DGS, 0, NotSerialized)
                        {
                            Store (LCDA, Local0)
                            If (LCDA)
                            {
                                Return (0x01)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }

                        Method (_DSS, 1, NotSerialized)
                        {
                            Store ("LCD --_DSS", Debug)
                        }
                    }

                    Method (SWIH, 0, NotSerialized)
                    {
                        Store (\_SB.PHSR (0x06, 0x00), Local2)
                        Store (And (Local2, 0x03), WDAS)
                        Store (And (ShiftRight (Local2, 0x04), 0x03), DISD)
                        GETD ()
                        If (LEqual (WDAS, 0x03))
                        {
                            Increment (TOGF)
                            If (LGreater (TOGF, 0x03))
                            {
                                Store (0x01, TOGF)
                            }

                            Store (TOGF, Local1)
                            If (LEqual (Local1, 0x01))
                            {
                                Store (0x01, LCDA)
                                Store (0x00, CRTA)
                                Store (0x00, TV0A)
                                Store (0x00, DVIA)
                            }
                            Else
                            {
                                If (LEqual (Local1, 0x03))
                                {
                                    Store (0x01, LCDA)
                                    Store (0x01, CRTA)
                                    Store (0x00, TV0A)
                                    Store (0x00, DVIA)
                                }
                                Else
                                {
                                    If (LEqual (Local1, 0x02))
                                    {
                                        Store (0x00, LCDA)
                                        Store (0x01, CRTA)
                                        Store (0x00, TV0A)
                                        Store (0x00, DVIA)
                                    }
                                }
                            }
                        }
                        Else
                        {
                            If (LEqual (WDAS, 0x01))
                            {
                                Store (0x01, LCDA)
                                Store (0x00, CRTA)
                                Store (0x00, TV0A)
                                Store (0x00, DVIA)
                            }
                            Else
                            {
                                If (LEqual (WDAS, 0x02))
                                {
                                    Store (0x00, LCDA)
                                    Store (0x01, CRTA)
                                    Store (0x00, TV0A)
                                    Store (0x00, DVIA)
                                }
                                Else
                                {
                                    Store (0x01, LCDA)
                                    Store (0x01, CRTA)
                                    Store (0x01, TV0A)
                                    Store (0x01, DVIA)
                                }
                            }
                        }

                        Notify (VGA, 0x80)
                        Return (0x00)
                    }

                    Method (GETD, 0, NotSerialized)
                    {
                        Store (DISD, Local0)
                        If (LNot (LGreater (WDAS, 0x03)))
                        {
                            If (LEqual (Local0, 0x03))
                            {
                                Store (0x03, TOGF)
                            }

                            If (LEqual (Local0, 0x02))
                            {
                                Store (0x02, TOGF)
                            }

                            If (LEqual (Local0, 0x01))
                            {
                                Store (0x01, TOGF)
                            }

                            If (LEqual (Local0, 0x00))
                            {
                                Store (0x00, TOGF)
                            }
                        }
                    }
                }
            }

            Device (GFX0)
            {
                Name (_ADR, 0x00020000)
                Method (_STA, 0, NotSerialized)
                {
                    If (PEGA)
                    {
                        Return (0x00)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }

                OperationRegion (VNVS, SystemMemory, 0x3FE8AE2C, 0x00010000)
                Field (VNVS, AnyAcc, Lock, Preserve)
                {
                    VBF1,   262144, 
                    VBF2,   262144
                }

                Method (_DOS, 1, NotSerialized)
                {
                    Store (And (Arg0, 0x03), DSEN)
                }

                Method (_DOD, 0, NotSerialized)
                {
                    If (LEqual (NDID, 0x01))
                    {
                        Name (TMP1, Package (0x01)
                        {
                            0xFFFFFFFF
                        })
                        Store (Or (0x00010000, DID1), Index (TMP1, 0x00))
                        Return (TMP1)
                    }

                    If (LEqual (NDID, 0x02))
                    {
                        Name (TMP2, Package (0x02)
                        {
                            0xFFFFFFFF, 
                            0xFFFFFFFF
                        })
                        Store (Or (0x00010000, DID1), Index (TMP2, 0x00))
                        Store (Or (0x00010000, DID2), Index (TMP2, 0x01))
                        Return (TMP2)
                    }

                    If (LEqual (NDID, 0x03))
                    {
                        Name (TMP3, Package (0x03)
                        {
                            0xFFFFFFFF, 
                            0xFFFFFFFF, 
                            0xFFFFFFFF
                        })
                        Store (Or (0x00010000, DID1), Index (TMP3, 0x00))
                        Store (Or (0x00010000, DID2), Index (TMP3, 0x01))
                        Store (Or (0x00010000, DID3), Index (TMP3, 0x02))
                        Return (TMP3)
                    }

                    If (LEqual (NDID, 0x04))
                    {
                        Name (TMP4, Package (0x04)
                        {
                            0xFFFFFFFF, 
                            0xFFFFFFFF, 
                            0xFFFFFFFF, 
                            0xFFFFFFFF
                        })
                        Store (Or (0x00010000, DID1), Index (TMP4, 0x00))
                        Store (Or (0x00010000, DID2), Index (TMP4, 0x01))
                        Store (Or (0x00010000, DID3), Index (TMP4, 0x02))
                        Store (Or (0x00010000, DID4), Index (TMP4, 0x03))
                        Return (TMP4)
                    }

                    Name (TMP5, Package (0x05)
                    {
                        0xFFFFFFFF, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF
                    })
                    Store (Or (0x00010000, DID1), Index (TMP5, 0x00))
                    Store (Or (0x00010000, DID2), Index (TMP5, 0x01))
                    Store (Or (0x00010000, DID3), Index (TMP5, 0x02))
                    Store (Or (0x00010000, DID4), Index (TMP5, 0x03))
                    Store (Or (0x00010000, DID5), Index (TMP5, 0x04))
                    Return (TMP5)
                }

                Method (_ROM, 2, NotSerialized)
                {
                    If (LNot (LLess (Arg0, 0x8000)))
                    {
                        Return (GETB (Subtract (Arg0, 0x8000), Arg1, VBF2))
                    }

                    If (LGreater (Add (Arg0, Arg1), 0x8000))
                    {
                        Subtract (0x8000, Arg0, Local0)
                        Subtract (Arg1, Local0, Local1)
                        Store (GETB (Arg0, Local0, VBF1), Local3)
                        Store (GETB (0x00, Local1, VBF2), Local4)
                        Concatenate (Local3, Local4, Local5)
                        Return (Local5)
                    }

                    Return (GETB (Arg0, Arg1, VBF1))
                }

                Device (DD01)
                {
                    Method (_ADR, 0, Serialized)
                    {
                        Return (And (0xFFFF, DID1))
                    }

                    Method (_DCS, 0, NotSerialized)
                    {
                        Store (0x01, SMIF)
                        Store (0x00, TRP0)
                        If (And (CSTE, 0x01))
                        {
                            Return (0x1F)
                        }

                        Return (0x1D)
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        If (And (NSTE, 0x01))
                        {
                            Return (0x01)
                        }

                        Return (0x00)
                    }

                    Method (_DSS, 1, NotSerialized)
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE)
                        }
                    }
                }

                Device (DD02)
                {
                    Method (_ADR, 0, Serialized)
                    {
                        Return (And (0xFFFF, DID2))
                    }

                    Method (_DCS, 0, NotSerialized)
                    {
                        Store (0x01, SMIF)
                        Store (0x00, TRP0)
                        If (And (CSTE, 0x02))
                        {
                            Return (0x1F)
                        }

                        Return (0x1D)
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        If (And (NSTE, 0x02))
                        {
                            Return (0x01)
                        }

                        Return (0x00)
                    }

                    Method (_DSS, 1, NotSerialized)
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE)
                        }
                    }
                }

                Device (DD03)
                {
                    Method (_ADR, 0, Serialized)
                    {
                        Return (And (0xFFFF, DID3))
                    }

                    Method (_DCS, 0, NotSerialized)
                    {
                        Store (0x01, SMIF)
                        Store (0x00, TRP0)
                        If (And (CSTE, 0x04))
                        {
                            Return (0x1F)
                        }

                        Return (0x1D)
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        If (And (NSTE, 0x04))
                        {
                            Return (0x01)
                        }

                        Return (0x00)
                    }

                    Method (_DSS, 1, NotSerialized)
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE)
                        }
                    }
                }

                Device (DD04)
                {
                    Method (_ADR, 0, Serialized)
                    {
                        Return (And (0xFFFF, DID4))
                    }

                    Method (_DCS, 0, NotSerialized)
                    {
                        Store (0x01, SMIF)
                        Store (0x00, TRP0)
                        If (And (CSTE, 0x08))
                        {
                            Return (0x1F)
                        }

                        Return (0x1D)
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        If (And (NSTE, 0x08))
                        {
                            Return (0x01)
                        }

                        Return (0x00)
                    }

                    Method (_DSS, 1, NotSerialized)
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE)
                        }
                    }
                }

                Device (DD05)
                {
                    Method (_ADR, 0, Serialized)
                    {
                        Return (And (0xFFFF, DID5))
                    }

                    Method (_DCS, 0, NotSerialized)
                    {
                        Store (0x01, SMIF)
                        Store (0x00, TRP0)
                        If (And (CSTE, 0x10))
                        {
                            Return (0x1F)
                        }

                        Return (0x1D)
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        If (And (NSTE, 0x10))
                        {
                            Return (0x01)
                        }

                        Return (0x00)
                    }

                    Method (_DSS, 1, NotSerialized)
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE)
                        }
                    }
                }
            }

            Device (AZAL)
            {
                Name (_ADR, 0x001B0000)
                Name (_PRW, Package (0x02)
                {
                    0x05, 
                    0x03
                })
            }

            Device (RP01)
            {
                Name (_ADR, 0x001C0000)
                OperationRegion (P1CS, PCI_Config, 0x40, 0x0100)
                Field (P1CS, AnyAcc, NoLock, WriteAsZeros)
                {
                    Offset (0x1A), 
                    ABP1,   1, 
                        ,   2, 
                    PDC1,   1, 
                        ,   2, 
                    PDS1,   1, 
                    Offset (0x20), 
                    Offset (0x22), 
                    PSP1,   1, 
                    Offset (0x9C), 
                        ,   30, 
                    HPCS,   1, 
                    PMCS,   1
                }

                Device (PXS1)
                {
                    Name (_ADR, 0x00)
                    Method (_RMV, 0, NotSerialized)
                    {
                        Return (0x01)
                    }
                }

                Name (_PRW, Package (0x02)
                {
                    0x09, 
                    0x04
                })
                Method (_PRT, 0, NotSerialized)
                {
                    If (\GPIC)
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                0x00, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                0x00, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                0x00, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                0x00, 
                                0x13
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                \_SB.PCI0.LPCB.LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                \_SB.PCI0.LPCB.LNKB, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                \_SB.PCI0.LPCB.LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                \_SB.PCI0.LPCB.LNKD, 
                                0x00
                            }
                        })
                    }
                }
            }

            Device (RP02)
            {
                Name (_ADR, 0x001C0001)
                OperationRegion (P2CS, PCI_Config, 0x40, 0x0100)
                Field (P2CS, AnyAcc, NoLock, WriteAsZeros)
                {
                    Offset (0x1A), 
                    ABP2,   1, 
                        ,   2, 
                    PDC2,   1, 
                        ,   2, 
                    PDS2,   1, 
                    Offset (0x20), 
                    Offset (0x22), 
                    PSP2,   1, 
                    Offset (0x9C), 
                        ,   30, 
                    HPCS,   1, 
                    PMCS,   1
                }

                Device (PXS2)
                {
                    Name (_ADR, 0x00)
                    Method (_RMV, 0, NotSerialized)
                    {
                        Return (0x01)
                    }
                }

                Name (_PRW, Package (0x02)
                {
                    0x09, 
                    0x04
                })
                Method (_PRT, 0, NotSerialized)
                {
                    If (\GPIC)
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                0x00, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                0x00, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                0x00, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                0x00, 
                                0x10
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                \_SB.PCI0.LPCB.LNKB, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                \_SB.PCI0.LPCB.LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                \_SB.PCI0.LPCB.LNKD, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                \_SB.PCI0.LPCB.LNKA, 
                                0x00
                            }
                        })
                    }
                }
            }

            Device (RP03)
            {
                Name (_ADR, 0x001C0002)
                OperationRegion (P3CS, PCI_Config, 0x40, 0x0100)
                Field (P3CS, AnyAcc, NoLock, WriteAsZeros)
                {
                    Offset (0x10), 
                        ,   4, 
                    LDP3,   1, 
                    Offset (0x1A), 
                    ABP3,   1, 
                        ,   2, 
                    PDC3,   1, 
                        ,   2, 
                    PDS3,   1, 
                    Offset (0x20), 
                    Offset (0x22), 
                    PSP3,   1, 
                    Offset (0x9B), 
                        ,   6, 
                    Z002,   1, 
                    Z003,   1, 
                        ,   30, 
                    HPCS,   1, 
                    PMCS,   1
                }

                Scope (\_SB.PCI0)
                {
                    Device (DOCK)
                    {
                        Name (_HID, EisaId ("PNP0C15"))
                        Name (_UID, 0x01)
                        Name (_BDN, "EZ4 ")
                        Name (DCKS, 0x00)
                        Method (_DCK, 1, NotSerialized)
                        {
                            If (LEqual (Arg0, 0x01))
                            {
                                Return (0x01)
                            }
                            Else
                            {
                                Store (0x01, \_SB.PCI0.RP03.LDP3)
                            }
                        }

                        Method (_EJ0, 1, NotSerialized)
                        {
                            Store (0x01, \_SB.PCI0.RP03.LDP3)
                            Store (0x01, HOTS)
                        }

                        Method (_STA, 0, NotSerialized)
                        {
                            If (LEqual (\_SB.PCI0.RP03.LDP3, 0x01))
                            {
                                Return (0x00)
                            }
                            Else
                            {
                                If (DCKS)
                                {
                                    Return (0x0F)
                                }
                                Else
                                {
                                    Return (0x00)
                                }
                            }
                        }
                    }
                }

                Device (PXHA)
                {
                    Name (_ADR, 0x00)
                    Name (_EJD, "_SB.PCI0.DOCK")
                    Method (_INI, 0, NotSerialized)
                    {
                        If (LEqual (\_SB.PCI0.RP03.PDS3, 0x01))
                        {
                            Store (0x01, \_SB.PCI0.DOCK.DCKS)
                        }
                        Else
                        {
                            Store (0x00, \_SB.PCI0.DOCK.DCKS)
                            Store (0x01, \_SB.PCI0.RP03.LDP3)
                        }

                        If (LNot (LLess (OSYS, 0x07D1)))
                        {
                            Store (CFGD, \PPMF)
                            If (LEqual (\_SB.PCI0.DOCK.DCKS, 0x01))
                            {
                                And (CFGD, 0xFFFFFF3F, CFGD)
                            }
                            Else
                            {
                                Store (\PPMF, CFGD)
                            }

                            Notify (\_PR.CPU0, 0x81)
                            Sleep (0x012C)
                        }
                    }

                    Name (_PSC, 0x00)
                    Method (_PS0, 0, NotSerialized)
                    {
                        Store (0x00, _PSC)
                    }

                    Method (_PS3, 0, NotSerialized)
                    {
                        Store (0x03, _PSC)
                    }

                    Method (_PRT, 0, NotSerialized)
                    {
                        Return (Package (0x0A)
                        {
                            Package (0x04)
                            {
                                0x0002FFFF, 
                                0x00, 
                                0x00, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0x0002FFFF, 
                                0x01, 
                                0x00, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0x0002FFFF, 
                                0x02, 
                                0x00, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0x0003FFFF, 
                                0x00, 
                                0x00, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0x0003FFFF, 
                                0x01, 
                                0x00, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0x0003FFFF, 
                                0x02, 
                                0x00, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0x0004FFFF, 
                                0x00, 
                                0x00, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x00, 
                                0x00, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0x0006FFFF, 
                                0x00, 
                                0x00, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0x0006FFFF, 
                                0x01, 
                                0x00, 
                                0x13
                            }
                        })
                    }

                    Device (PXHI)
                    {
                        Name (_ADR, 0x00040000)
                        Name (_PSC, 0x00)
                        Method (_PS0, 0, NotSerialized)
                        {
                            If (LAnd (LEqual (\INSX, 0x01), LEqual (OSYS, 0x07D0)))
                            {
                                \_SB.PHSR (0x09, 0x00)
                                Store (0x00, \INSX)
                            }

                            Store (0x00, _PSC)
                        }

                        Method (_PS3, 0, NotSerialized)
                        {
                            Store (0x03, _PSC)
                        }
                    }

                    Device (PXHC)
                    {
                        Name (_ADR, 0x00050000)
                        Name (_PSC, 0x00)
                        Method (_PS0, 0, NotSerialized)
                        {
                            If (LAnd (LEqual (\INSX, 0x01), LEqual (OSYS, 0x07D0)))
                            {
                                \_SB.PHSR (0x09, 0x00)
                                Store (0x00, \INSX)
                            }

                            Store (0x00, _PSC)
                        }

                        Method (_PS3, 0, NotSerialized)
                        {
                            Store (0x03, _PSC)
                        }
                    }

                    Device (PXHM)
                    {
                        Name (_ADR, 0x00060000)
                        Name (_PSC, 0x00)
                        Method (_PS0, 0, NotSerialized)
                        {
                            If (LAnd (LEqual (\INSX, 0x01), LEqual (OSYS, 0x07D0)))
                            {
                                \_SB.PHSR (0x09, 0x00)
                                Store (0x00, \INSX)
                            }

                            Store (0x00, _PSC)
                        }

                        Method (_PS3, 0, NotSerialized)
                        {
                            Store (0x03, _PSC)
                        }
                    }
                }

                Scope (\_GPE)
                {
                    Method (_L1C, 0, NotSerialized)
                    {
                        Sleep (0x012C)
                        Store (0x01, Z000)
                        Store (Z000, Local1)
                        If (LEqual (Local1, 0x01))
                        {
                            Store (Z001, Local0)
                            If (Local0)
                            {
                                Store (\PPMF, CFGD)
                                Notify (\_PR.CPU0, 0x81)
                                Sleep (0x012C)
                                Store (0x00, \_SB.PCI0.DOCK.DCKS)
                                Notify (\_SB.PCI0.DOCK, 0x01)
                            }
                            Else
                            {
                                And (CFGD, 0xFFFFFF3F, CFGD)
                                Notify (\_PR.CPU0, 0x81)
                                Sleep (0x012C)
                                Store (0x00, \_SB.PCI0.RP03.LDP3)
                                Store (0x01, \_SB.PCI0.DOCK.DCKS)
                                Sleep (0x01F4)
                                \_SB.PHSR (0x07, 0x00)
                                Sleep (0x01F4)
                                Notify (\_SB.PCI0.DOCK, 0x00)
                            }

                            XOr (Z001, 0x01, Z001)
                        }
                    }
                }
            }

            Device (RP04)
            {
                Name (_ADR, 0x001C0003)
                OperationRegion (P4CS, PCI_Config, 0x40, 0x0100)
                Field (P4CS, AnyAcc, NoLock, WriteAsZeros)
                {
                    Offset (0x1A), 
                    ABP4,   1, 
                        ,   2, 
                    PDC4,   1, 
                        ,   2, 
                    PDS4,   1, 
                    Offset (0x20), 
                    Offset (0x22), 
                    PSP4,   1, 
                    Offset (0x9C), 
                        ,   30, 
                    HPCS,   1, 
                    PMCS,   1
                }

                Name (_PRW, Package (0x02)
                {
                    0x09, 
                    0x04
                })
                Method (_PRT, 0, NotSerialized)
                {
                    If (\GPIC)
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                0x00, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                0x00, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                0x00, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                0x00, 
                                0x12
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                \_SB.PCI0.LPCB.LNKD, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                \_SB.PCI0.LPCB.LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                \_SB.PCI0.LPCB.LNKB, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                \_SB.PCI0.LPCB.LNKC, 
                                0x00
                            }
                        })
                    }
                }
            }

            Device (USB1)
            {
                Name (_ADR, 0x001D0000)
                OperationRegion (U1CS, PCI_Config, 0xC4, 0x04)
                Field (U1CS, DWordAcc, NoLock, Preserve)
                {
                    U1EN,   2
                }

                Name (_PRW, Package (0x02)
                {
                    0x03, 
                    0x03
                })
                Method (_PSW, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Store (0x03, U1EN)
                    }
                    Else
                    {
                        Store (0x00, U1EN)
                    }
                }

                Method (_S3D, 0, NotSerialized)
                {
                    Return (0x02)
                }

                Method (_S4D, 0, NotSerialized)
                {
                    Return (0x02)
                }
            }

            Device (USB2)
            {
                Name (_ADR, 0x001D0001)
                OperationRegion (U2CS, PCI_Config, 0xC4, 0x04)
                Field (U2CS, DWordAcc, NoLock, Preserve)
                {
                    U2EN,   2
                }

                Name (_PRW, Package (0x02)
                {
                    0x04, 
                    0x03
                })
                Method (_PSW, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Store (0x03, U2EN)
                    }
                    Else
                    {
                        Store (0x00, U2EN)
                    }
                }

                Method (_S3D, 0, NotSerialized)
                {
                    Return (0x02)
                }

                Method (_S4D, 0, NotSerialized)
                {
                    Return (0x02)
                }
            }

            Device (USB3)
            {
                Name (_ADR, 0x001D0002)
                OperationRegion (U2CS, PCI_Config, 0xC4, 0x04)
                Field (U2CS, DWordAcc, NoLock, Preserve)
                {
                    U3EN,   2
                }

                Name (_PRW, Package (0x02)
                {
                    0x0C, 
                    0x03
                })
                Method (_PSW, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Store (0x03, U3EN)
                    }
                    Else
                    {
                        Store (0x00, U3EN)
                    }
                }

                Method (_S3D, 0, NotSerialized)
                {
                    Return (0x02)
                }

                Method (_S4D, 0, NotSerialized)
                {
                    Return (0x02)
                }
            }

            Device (USB4)
            {
                Name (_ADR, 0x001D0003)
                OperationRegion (U4CS, PCI_Config, 0xC4, 0x04)
                Field (U4CS, DWordAcc, NoLock, Preserve)
                {
                    U4EN,   2
                }

                Method (_S3D, 0, NotSerialized)
                {
                    Return (0x02)
                }

                Method (_S4D, 0, NotSerialized)
                {
                    Return (0x02)
                }
            }

            Device (USB7)
            {
                Name (_ADR, 0x001D0007)
                Name (_PRW, Package (0x02)
                {
                    0x0D, 
                    0x03
                })
            }

            Device (PCIB)
            {
                Name (_ADR, 0x001E0000)
                Method (_PRT, 0, NotSerialized)
                {
                    If (GPIC)
                    {
                        Return (Package (0x06)
                        {
                            Package (0x04)
                            {
                                0x0009FFFF, 
                                0x00, 
                                0x00, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0x0009FFFF, 
                                0x01, 
                                0x00, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0x0009FFFF, 
                                0x02, 
                                0x00, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0x0006FFFF, 
                                0x00, 
                                0x00, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0x0003FFFF, 
                                0x00, 
                                0x00, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0x0003FFFF, 
                                0x01, 
                                0x00, 
                                0x13
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x15)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                \_SB.PCI0.LPCB.LNKF, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                \_SB.PCI0.LPCB.LNKG, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                \_SB.PCI0.LPCB.LNKH, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                \_SB.PCI0.LPCB.LNKE, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0001FFFF, 
                                0x00, 
                                \_SB.PCI0.LPCB.LNKG, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0001FFFF, 
                                0x01, 
                                \_SB.PCI0.LPCB.LNKF, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0001FFFF, 
                                0x02, 
                                \_SB.PCI0.LPCB.LNKE, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0001FFFF, 
                                0x03, 
                                \_SB.PCI0.LPCB.LNKH, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0002FFFF, 
                                0x00, 
                                \_SB.PCI0.LPCB.LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0002FFFF, 
                                0x01, 
                                \_SB.PCI0.LPCB.LNKD, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0002FFFF, 
                                0x02, 
                                \_SB.PCI0.LPCB.LNKB, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0002FFFF, 
                                0x03, 
                                \_SB.PCI0.LPCB.LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0003FFFF, 
                                0x00, 
                                \_SB.PCI0.LPCB.LNKD, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0003FFFF, 
                                0x01, 
                                \_SB.PCI0.LPCB.LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0003FFFF, 
                                0x02, 
                                \_SB.PCI0.LPCB.LNKF, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0003FFFF, 
                                0x03, 
                                \_SB.PCI0.LPCB.LNKG, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x00, 
                                \_SB.PCI0.LPCB.LNKB, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x01, 
                                \_SB.PCI0.LPCB.LNKE, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x02, 
                                \_SB.PCI0.LPCB.LNKG, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x03, 
                                \_SB.PCI0.LPCB.LNKF, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0008FFFF, 
                                0x00, 
                                \_SB.PCI0.LPCB.LNKE, 
                                0x00
                            }
                        })
                    }
                }

                Device (LANC)
                {
                    Name (_ADR, 0x00060000)
                    Name (_PRW, Package (0x02)
                    {
                        0x0B, 
                        0x04
                    })
                    Name (LANP, 0x00)
                    Method (_PSW, 1, NotSerialized)
                    {
                        If (LEqual (Arg0, 0x00))
                        {
                            Store (0x00, LANP)
                        }
                        Else
                        {
                            Store (0x01, LANP)
                        }
                    }
                }
            }

            Device (LPCB)
            {
                Name (_ADR, 0x001F0000)
                OperationRegion (LPC0, PCI_Config, 0x40, 0xC0)
                Field (LPC0, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x20), 
                    PARC,   8, 
                    PBRC,   8, 
                    PCRC,   8, 
                    PDRC,   8, 
                    Offset (0x28), 
                    PERC,   8, 
                    PFRC,   8, 
                    PGRC,   8, 
                    PHRC,   8, 
                    Offset (0x40), 
                    IOD0,   8, 
                    IOD1,   8, 
                    Z004,   1, 
                    Z005,   1, 
                    LPTE,   1, 
                    Offset (0x60), 
                        ,   7, 
                    C4C3,   1
                }

                Device (LNKA)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x01)
                    Method (_DIS, 0, Serialized)
                    {
                        Store (0x80, PARC)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared)
                            {1,3,4,5,6,7,10,12,14,15}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Name (RTLA, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared)
                                {}
                        })
                        CreateWordField (RTLA, 0x01, IRQ0)
                        Store (Zero, IRQ0)
                        ShiftLeft (0x01, And (PARC, 0x0F), IRQ0)
                        Return (RTLA)
                    }

                    Method (_SRS, 1, Serialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PARC)
                    }

                    Method (_STA, 0, Serialized)
                    {
                        If (And (PARC, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }
                }

                Device (LNKB)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x02)
                    Method (_DIS, 0, Serialized)
                    {
                        Store (0x80, PBRC)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared)
                            {1,3,4,5,6,7,11,12,14,15}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Name (RTLB, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared)
                                {}
                        })
                        CreateWordField (RTLB, 0x01, IRQ0)
                        Store (Zero, IRQ0)
                        ShiftLeft (0x01, And (PBRC, 0x0F), IRQ0)
                        Return (RTLB)
                    }

                    Method (_SRS, 1, Serialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PBRC)
                    }

                    Method (_STA, 0, Serialized)
                    {
                        If (And (PBRC, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }
                }

                Device (LNKC)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x03)
                    Method (_DIS, 0, Serialized)
                    {
                        Store (0x80, PCRC)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared)
                            {1,3,4,5,6,7,10,12,14,15}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Name (RTLC, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared)
                                {}
                        })
                        CreateWordField (RTLC, 0x01, IRQ0)
                        Store (Zero, IRQ0)
                        ShiftLeft (0x01, And (PCRC, 0x0F), IRQ0)
                        Return (RTLC)
                    }

                    Method (_SRS, 1, Serialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PCRC)
                    }

                    Method (_STA, 0, Serialized)
                    {
                        If (And (PCRC, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }
                }

                Device (LNKD)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x04)
                    Method (_DIS, 0, Serialized)
                    {
                        Store (0x80, PDRC)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared)
                            {1,3,4,5,6,7,11,12,14,15}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Name (RTLD, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared)
                                {}
                        })
                        CreateWordField (RTLD, 0x01, IRQ0)
                        Store (Zero, IRQ0)
                        ShiftLeft (0x01, And (PDRC, 0x0F), IRQ0)
                        Return (RTLD)
                    }

                    Method (_SRS, 1, Serialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PDRC)
                    }

                    Method (_STA, 0, Serialized)
                    {
                        If (And (PDRC, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }
                }

                Device (LNKE)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x05)
                    Method (_DIS, 0, Serialized)
                    {
                        Store (0x80, PERC)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared)
                            {1,3,4,5,6,7,10,12,14,15}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Name (RTLE, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared)
                                {}
                        })
                        CreateWordField (RTLE, 0x01, IRQ0)
                        Store (Zero, IRQ0)
                        ShiftLeft (0x01, And (PERC, 0x0F), IRQ0)
                        Return (RTLE)
                    }

                    Method (_SRS, 1, Serialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PERC)
                    }

                    Method (_STA, 0, Serialized)
                    {
                        If (And (PERC, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }
                }

                Device (LNKF)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x06)
                    Method (_DIS, 0, Serialized)
                    {
                        Store (0x80, PFRC)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared)
                            {1,3,4,5,6,7,11,12,14,15}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Name (RTLF, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared)
                                {}
                        })
                        CreateWordField (RTLF, 0x01, IRQ0)
                        Store (Zero, IRQ0)
                        ShiftLeft (0x01, And (PFRC, 0x0F), IRQ0)
                        Return (RTLF)
                    }

                    Method (_SRS, 1, Serialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PFRC)
                    }

                    Method (_STA, 0, Serialized)
                    {
                        If (And (PFRC, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }
                }

                Device (LNKG)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x07)
                    Method (_DIS, 0, Serialized)
                    {
                        Store (0x80, PGRC)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared)
                            {1,3,4,5,6,7,10,12,14,15}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Name (RTLG, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared)
                                {}
                        })
                        CreateWordField (RTLG, 0x01, IRQ0)
                        Store (Zero, IRQ0)
                        ShiftLeft (0x01, And (PGRC, 0x0F), IRQ0)
                        Return (RTLG)
                    }

                    Method (_SRS, 1, Serialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PGRC)
                    }

                    Method (_STA, 0, Serialized)
                    {
                        If (And (PGRC, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }
                }

                Device (LNKH)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x08)
                    Method (_DIS, 0, Serialized)
                    {
                        Store (0x80, PHRC)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared)
                            {1,3,4,5,6,7,11,12,14,15}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Name (RTLH, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared)
                                {}
                        })
                        CreateWordField (RTLH, 0x01, IRQ0)
                        Store (Zero, IRQ0)
                        ShiftLeft (0x01, And (PHRC, 0x0F), IRQ0)
                        Return (RTLH)
                    }

                    Method (_SRS, 1, Serialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PHRC)
                    }

                    Method (_STA, 0, Serialized)
                    {
                        If (And (PHRC, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }
                }

                Device (EC0)
                {
                    Name (_HID, EisaId ("PNP0C09"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0062,             // Address Range Minimum
                            0x0062,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x01,               // Address Length
                            )
                        IO (Decode16,
                            0x0066,             // Address Range Minimum
                            0x0066,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x01,               // Address Length
                            )
                    })
                    Name (_GPE, 0x1D)
                    Name (SEL0, 0xF0)
                    Name (BFLG, 0x00)
                    Method (_REG, 2, NotSerialized)
                    {
                        If (LEqual (Arg0, 0x03))
                        {
                            Store (Arg1, Local0)
                            If (Local0)
                            {
                                Store (0x01, ECOK)
                            }
                            Else
                            {
                                Store (0x00, ECOK)
                            }
                        }

                        If (\_SB.ECOK)
                        {
                            Store (0x00, DSNB)
                            Acquire (\_SB.PCI0.LPCB.EC0.MUT1, 0xFFFF)
                            Store (0x03, \_SB.PCI0.LPCB.EC0.RG59)
                            Store (\_SB.BTEN, \_SB.PCI0.LPCB.EC0.BLTH)
                            Store (\_SB.WLAN, \_SB.PCI0.LPCB.EC0.WLAN)
                            Store (0x01, \_SB.PCI0.LPCB.EC0.CPLE)
                            Store (\_SB.PHSR (0x05, 0x00), DOFF)
                            Release (\_SB.PCI0.LPCB.EC0.MUT1)
                        }
                    }

                    OperationRegion (ERAM, EmbeddedControl, 0x00, 0xFF)
                    Field (ERAM, ByteAcc, NoLock, Preserve)
                    {
                        Offset (0x04), 
                        CMCM,   8, 
                        CMD1,   8, 
                        CMD2,   8, 
                        CMD3,   8, 
                        Offset (0x18), 
                        SMPR,   8, 
                        SMST,   8, 
                        SMAD,   8, 
                        SMCM,   8, 
                        SMD0,   256, 
                        BCNT,   8, 
                        SMAA,   8, 
                        BATD,   16, 
                        ACDF,   1, 
                        Offset (0x41), 
                            ,   4, 
                        FPR1,   1, 
                        FLS4,   1, 
                        S5LW,   1, 
                        PFLG,   1, 
                        Offset (0x43), 
                        TMSS,   2, 
                            ,   2, 
                        BANK,   4, 
                        Offset (0x45), 
                        VFAN,   1, 
                        Offset (0x46), 
                        RL01,   1, 
                        RD01,   1, 
                        RF01,   1, 
                        RP01,   1, 
                        RB01,   1, 
                        RC01,   1, 
                            ,   1, 
                        R701,   1, 
                        R801,   1, 
                        RM01,   1, 
                        RI01,   1, 
                            ,   1, 
                            ,   1, 
                            ,   1, 
                        RA01,   1, 
                        RR01,   1, 
                        RL10,   1, 
                        RD10,   1, 
                        RF10,   1, 
                        RP10,   1, 
                        RB10,   1, 
                        RC10,   1, 
                            ,   1, 
                        R710,   1, 
                        R810,   1, 
                        RM10,   1, 
                        RI10,   1, 
                            ,   1, 
                            ,   1, 
                            ,   1, 
                        RA10,   1, 
                        RR10,   1, 
                        LIDE,   1, 
                        BAYE,   1, 
                        PRDE,   1, 
                        WP01,   1, 
                        WB01,   1, 
                        WC01,   1, 
                            ,   1, 
                        W701,   1, 
                        W801,   1, 
                        WM01,   1, 
                        WI01,   1, 
                            ,   1, 
                            ,   1, 
                            ,   1, 
                        WA01,   1, 
                        WR01,   1, 
                        LIDS,   1, 
                        BAYI,   1, 
                        PRCT,   1, 
                        WP10,   1, 
                        WB10,   1, 
                        WC10,   1, 
                            ,   1, 
                        W710,   1, 
                        W810,   1, 
                        WM10,   1, 
                        WI10,   1, 
                            ,   1, 
                            ,   1, 
                            ,   1, 
                        WA10,   1, 
                        WR10,   1, 
                        Offset (0x53), 
                        DOFF,   8, 
                        Offset (0x57), 
                        RG57,   8, 
                        CTMP,   8, 
                        RG59,   8, 
                        RG5A,   8, 
                        RG5B,   8, 
                        FSPD,   16, 
                        VTMP,   8, 
                        WLAN,   1, 
                        BLTH,   1, 
                        CPLE,   1, 
                        Offset (0x61), 
                        BRLV,   8, 
                        Offset (0x63), 
                            ,   7, 
                        VGAF,   1, 
                        Offset (0x71), 
                        MBTS,   1, 
                        MBTF,   1, 
                        Offset (0x72), 
                        MBTC,   1, 
                            ,   2, 
                        LION,   1, 
                        Offset (0x77), 
                        BA1C,   8, 
                        Offset (0x81), 
                        ABTS,   1, 
                        ABFC,   1, 
                            ,   3, 
                        ABBL,   1, 
                        Z006,   1, 
                        ABCT,   1, 
                        ABCG,   1, 
                            ,   2, 
                        ABTP,   1, 
                        Offset (0x87), 
                        BA2C,   8, 
                        Offset (0x8A), 
                        ACUR,   16, 
                        Offset (0x94), 
                        BYPS,   1, 
                        Offset (0xC1), 
                        MCUR,   16, 
                        MBRM,   16, 
                        MBVG,   16, 
                        BTST,   8, 
                        ABCR,   16, 
                        ABRM,   16, 
                        ABVG,   16, 
                        Offset (0xD0), 
                        EBPL,   1, 
                        Offset (0xD1), 
                        PWRE,   1, 
                        Offset (0xD2), 
                            ,   6, 
                        VAUX,   1, 
                        Offset (0xD6), 
                        DBPL,   8, 
                        Offset (0xD8), 
                        LFCC,   16, 
                        BTSN,   16, 
                        BTDC,   16, 
                        BTDV,   16, 
                        BTMN,   8, 
                        BTMD,   8, 
                        AFCC,   16, 
                        ABSN,   16, 
                        ABDC,   16, 
                        ABDV,   16, 
                        ABMN,   8, 
                        ABMD,   8, 
                        TRDV,   3
                    }

                    Field (ERAM, ByteAcc, NoLock, Preserve)
                    {
                        Offset (0x1C), 
                        SMW0,   16
                    }

                    Field (ERAM, ByteAcc, NoLock, Preserve)
                    {
                        Offset (0x1C), 
                        SMB0,   8
                    }

                    Field (ERAM, ByteAcc, NoLock, Preserve)
                    {
                        Offset (0x1C), 
                        FLD0,   64
                    }

                    Field (ERAM, ByteAcc, NoLock, Preserve)
                    {
                        Offset (0x1C), 
                        FLD1,   128
                    }

                    Field (ERAM, ByteAcc, NoLock, Preserve)
                    {
                        Offset (0x1C), 
                        FLD2,   192
                    }

                    Field (ERAM, ByteAcc, NoLock, Preserve)
                    {
                        Offset (0x1C), 
                        FLD3,   256
                    }

                    Mutex (MUT1, 0x00)
                    Mutex (MUT0, 0x00)
                    Method (SMRD, 4, NotSerialized)
                    {
                        If (LEqual (\_SB.ECOK, 0x00))
                        {
                            Return (0xFF)
                        }

                        If (LNot (LEqual (Arg0, 0x07)))
                        {
                            If (LNot (LEqual (Arg0, 0x09)))
                            {
                                If (LNot (LEqual (Arg0, 0x0B)))
                                {
                                    Return (0x19)
                                }
                            }
                        }

                        Acquire (MUT0, 0xFFFF)
                        Store (0x04, Local0)
                        While (LGreater (Local0, 0x01))
                        {
                            And (SMST, 0x40, SMST)
                            Store (Arg2, SMCM)
                            Store (Arg1, SMAD)
                            Store (Arg0, SMPR)
                            Store (0x00, Local3)
                            While (LNot (And (SMST, 0xBF, Local1)))
                            {
                                Sleep (0x02)
                                Increment (Local3)
                                If (LEqual (Local3, 0x32))
                                {
                                    And (SMST, 0x40, SMST)
                                    Store (Arg2, SMCM)
                                    Store (Arg1, SMAD)
                                    Store (Arg0, SMPR)
                                    Store (0x00, Local3)
                                }
                            }

                            If (LEqual (Local1, 0x80))
                            {
                                Store (0x00, Local0)
                            }
                            Else
                            {
                                Decrement (Local0)
                            }
                        }

                        If (Local0)
                        {
                            Store (And (Local1, 0x1F), Local0)
                        }
                        Else
                        {
                            If (LEqual (Arg0, 0x07))
                            {
                                Store (SMB0, Arg3)
                            }

                            If (LEqual (Arg0, 0x09))
                            {
                                Store (SMW0, Arg3)
                            }

                            If (LEqual (Arg0, 0x0B))
                            {
                                Store (BCNT, Local3)
                                ShiftRight (0x0100, 0x03, Local2)
                                If (LGreater (Local3, Local2))
                                {
                                    Store (Local2, Local3)
                                }

                                If (LLess (Local3, 0x09))
                                {
                                    Store (FLD0, Local2)
                                }
                                Else
                                {
                                    If (LLess (Local3, 0x11))
                                    {
                                        Store (FLD1, Local2)
                                    }
                                    Else
                                    {
                                        If (LLess (Local3, 0x19))
                                        {
                                            Store (FLD2, Local2)
                                        }
                                        Else
                                        {
                                            Store (FLD3, Local2)
                                        }
                                    }
                                }

                                Increment (Local3)
                                Store (Buffer (Local3) {}, Local4)
                                Decrement (Local3)
                                Store (Zero, Local5)
                                While (LGreater (Local3, Local5))
                                {
                                    GBFE (Local2, Local5, RefOf (Local6))
                                    PBFE (Local4, Local5, Local6)
                                    Increment (Local5)
                                }

                                PBFE (Local4, Local5, 0x00)
                                Store (Local4, Arg3)
                            }
                        }

                        Release (MUT0)
                        Return (Local0)
                    }

                    Method (SMWR, 4, NotSerialized)
                    {
                        If (LEqual (\_SB.ECOK, 0x00))
                        {
                            Return (0xFF)
                        }

                        If (LNot (LEqual (Arg0, 0x06)))
                        {
                            If (LNot (LEqual (Arg0, 0x08)))
                            {
                                If (LNot (LEqual (Arg0, 0x0A)))
                                {
                                    Return (0x19)
                                }
                            }
                        }

                        Acquire (MUT0, 0xFFFF)
                        Store (0x04, Local0)
                        While (LGreater (Local0, 0x01))
                        {
                            If (LEqual (Arg0, 0x06))
                            {
                                Store (Arg3, SMB0)
                            }

                            If (LEqual (Arg0, 0x08))
                            {
                                Store (Arg3, SMW0)
                            }

                            If (LEqual (Arg0, 0x0A))
                            {
                                Store (Arg3, SMD0)
                            }

                            And (SMST, 0x40, SMST)
                            Store (Arg2, SMCM)
                            Store (Arg1, SMAD)
                            Store (Arg0, SMPR)
                            Store (0x00, Local3)
                            While (LNot (And (SMST, 0xBF, Local1)))
                            {
                                Sleep (0x02)
                                Increment (Local3)
                                If (LEqual (Local3, 0x32))
                                {
                                    And (SMST, 0x40, SMST)
                                    Store (Arg2, SMCM)
                                    Store (Arg1, SMAD)
                                    Store (Arg0, SMPR)
                                    Store (0x00, Local3)
                                }
                            }

                            If (LEqual (Local1, 0x80))
                            {
                                Store (0x00, Local0)
                            }
                            Else
                            {
                                Decrement (Local0)
                            }
                        }

                        If (Local0)
                        {
                            Store (And (Local1, 0x1F), Local0)
                        }

                        Release (MUT0)
                        Return (Local0)
                    }

                    Method (APOL, 1, NotSerialized)
                    {
                        Store (Arg0, DBPL)
                        Store (0x01, EBPL)
                    }

                    Name (PSTA, 0x00)
                    Method (CPOL, 1, NotSerialized)
                    {
                        If (LEqual (PSTA, 0x00))
                        {
                            If (LNot (LEqual (\_SB.ECOK, 0x00)))
                            {
                                APOL (Arg0)
                                Store (0x01, PSTA)
                            }
                        }
                    }

                    Method (_Q20, 0, NotSerialized)
                    {
                        If (\_SB.ECOK)
                        {
                            Acquire (\_SB.PCI0.LPCB.EC0.MUT1, 0xFFFF)
                            If (And (SMST, 0x40))
                            {
                                Store (SMAA, Local0)
                                If (LEqual (Local0, 0x14))
                                {
                                    And (SMST, 0xBF, SMST)
                                    Store (PWRE, Local1)
                                    If (Local1)
                                    {
                                        Store (0x00, PWRE)
                                        Store (0x12, BFLG)
                                        CPOL (0x01)
                                    }
                                }

                                If (LEqual (Local0, 0x16))
                                {
                                    And (SMST, 0xBF, SMST)
                                    Store (0x04, \_SB.BAT1.BCRI)
                                    Notify (\_SB.BAT1, 0x80)
                                    Sleep (0x01F4)
                                    Store (0x04, \_SB.BAT2.BCRI)
                                    Notify (\_SB.BAT2, 0x80)
                                }
                                Else
                                {
                                    Store (0x00, \_SB.BAT1.BCRI)
                                    Store (0x00, \_SB.BAT2.BCRI)
                                }
                            }

                            Release (\_SB.PCI0.LPCB.EC0.MUT1)
                        }
                    }

                    Method (_Q09, 0, NotSerialized)
                    {
                        If (\_SB.ECOK)
                        {
                            Store (0x00, \_SB.PCI0.LPCB.EC0.PSTA)
                            \_SB.BAT1.Z007 ()
                            \_SB.BAT2.Z007 ()
                            Notify (\_SB.ACAD, 0x80)
                            Sleep (0x01F4)
                            Notify (\_SB.BAT1, 0x80)
                            Sleep (0x01F4)
                            Notify (\_SB.BAT2, 0x80)
                            If (\_SB.BAT1.BTCH)
                            {
                                \_SB.BAT1.UBIF ()
                                Notify (\_SB.BAT1, 0x81)
                                Store (0x00, \_SB.BAT1.BTCH)
                            }

                            If (\_SB.BAT2.BTCH)
                            {
                                \_SB.BAT2.UBIF ()
                                Notify (\_SB.BAT2, 0x81)
                                Store (0x00, \_SB.BAT2.BTCH)
                            }
                        }
                    }

                    Method (_Q8A, 0, NotSerialized)
                    {
                        Store (0x8A, P80H)
                        \_SB.PCI0.PATA.PRID.BAY.Z008 ()
                    }

                    Method (_Q0D, 0, NotSerialized)
                    {
                        Notify (\_SB.SLPB, 0x80)
                    }

                    Method (_Q0E, 0, NotSerialized)
                    {
                        If (\_SB.PCI0.PEGA)
                        {
                            \_SB.PCI0.PEGP.VGA.SWIH ()
                        }
                        Else
                        {
                            Store (0x01, TLST)
                            HKDS (0x0A)
                        }
                    }

                    Method (_Q0F, 0, NotSerialized)
                    {
                    }
                }

                Device (DMAC)
                {
                    Name (_HID, EisaId ("PNP0200"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0000,             // Address Range Minimum
                            0x0000,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x20,               // Address Length
                            )
                        IO (Decode16,
                            0x0081,             // Address Range Minimum
                            0x0081,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x11,               // Address Length
                            )
                        IO (Decode16,
                            0x0093,             // Address Range Minimum
                            0x0093,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x0D,               // Address Length
                            )
                        IO (Decode16,
                            0x00C0,             // Address Range Minimum
                            0x00C0,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x20,               // Address Length
                            )
                        DMA (Compatibility, NotBusMaster, Transfer8_16)
                            {4}
                    })
                }

                Device (HPET)
                {
                    Name (_HID, EisaId ("PNP0103"))
                    Name (BUF0, ResourceTemplate ()
                    {
                        IRQNoFlags ()
                            {0}
                        IRQNoFlags ()
                            {8}
                        Memory32Fixed (ReadOnly,
                            0xFED00000,         // Address Base
                            0x00000400,         // Address Length
                            )
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        If (LNot (LLess (OSYS, 0x07D1)))
                        {
                            If (HPAE)
                            {
                                Return (0x0F)
                            }
                        }
                        Else
                        {
                            If (HPAE)
                            {
                                Return (0x0B)
                            }
                        }

                        Return (0x00)
                    }

                    Method (_CRS, 0, Serialized)
                    {
                        If (HPAE)
                        {
                            CreateDWordField (BUF0, 0x0A, HPT0)
                            If (LEqual (HPAS, 0x01))
                            {
                                Store (0xFED01000, HPT0)
                            }

                            If (LEqual (HPAS, 0x02))
                            {
                                Store (0xFED02000, HPT0)
                            }

                            If (LEqual (HPAS, 0x03))
                            {
                                Store (0xFED03000, HPT0)
                            }
                        }

                        Return (BUF0)
                    }
                }

                Device (IPIC)
                {
                    Name (_HID, EisaId ("PNP0000"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0020,             // Address Range Minimum
                            0x0020,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x02,               // Address Length
                            )
                        IO (Decode16,
                            0x0024,             // Address Range Minimum
                            0x0024,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x02,               // Address Length
                            )
                        IO (Decode16,
                            0x0028,             // Address Range Minimum
                            0x0028,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x02,               // Address Length
                            )
                        IO (Decode16,
                            0x002C,             // Address Range Minimum
                            0x002C,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x02,               // Address Length
                            )
                        IO (Decode16,
                            0x0030,             // Address Range Minimum
                            0x0030,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x02,               // Address Length
                            )
                        IO (Decode16,
                            0x0034,             // Address Range Minimum
                            0x0034,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x02,               // Address Length
                            )
                        IO (Decode16,
                            0x0038,             // Address Range Minimum
                            0x0038,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x02,               // Address Length
                            )
                        IO (Decode16,
                            0x003C,             // Address Range Minimum
                            0x003C,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x02,               // Address Length
                            )
                        IO (Decode16,
                            0x00A0,             // Address Range Minimum
                            0x00A0,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x02,               // Address Length
                            )
                        IO (Decode16,
                            0x00A4,             // Address Range Minimum
                            0x00A4,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x02,               // Address Length
                            )
                        IO (Decode16,
                            0x00A8,             // Address Range Minimum
                            0x00A8,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x02,               // Address Length
                            )
                        IO (Decode16,
                            0x00AC,             // Address Range Minimum
                            0x00AC,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x02,               // Address Length
                            )
                        IO (Decode16,
                            0x00B0,             // Address Range Minimum
                            0x00B0,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x02,               // Address Length
                            )
                        IO (Decode16,
                            0x00B4,             // Address Range Minimum
                            0x00B4,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x02,               // Address Length
                            )
                        IO (Decode16,
                            0x00B8,             // Address Range Minimum
                            0x00B8,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x02,               // Address Length
                            )
                        IO (Decode16,
                            0x00BC,             // Address Range Minimum
                            0x00BC,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x02,               // Address Length
                            )
                        IO (Decode16,
                            0x04D0,             // Address Range Minimum
                            0x04D0,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x02,               // Address Length
                            )
                        IRQNoFlags ()
                            {2}
                    })
                }

                Device (MATH)
                {
                    Name (_HID, EisaId ("PNP0C04"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x00F0,             // Address Range Minimum
                            0x00F0,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x01,               // Address Length
                            )
                        IRQNoFlags ()
                            {13}
                    })
                }

                Device (LDRC)
                {
                    Name (_HID, EisaId ("PNP0C02"))
                    Name (_UID, 0x02)
                    Name (BUF1, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x002E,             // Address Range Minimum
                            0x002E,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x02,               // Address Length
                            )
                        IO (Decode16,
                            0x004E,             // Address Range Minimum
                            0x004E,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x02,               // Address Length
                            )
                        IO (Decode16,
                            0x0061,             // Address Range Minimum
                            0x0061,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x01,               // Address Length
                            )
                        IO (Decode16,
                            0x0063,             // Address Range Minimum
                            0x0063,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x01,               // Address Length
                            )
                        IO (Decode16,
                            0x0065,             // Address Range Minimum
                            0x0065,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x01,               // Address Length
                            )
                        IO (Decode16,
                            0x0067,             // Address Range Minimum
                            0x0067,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x01,               // Address Length
                            )
                        IO (Decode16,
                            0x0068,             // Address Range Minimum
                            0x006F,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x08,               // Address Length
                            )
                        IO (Decode16,
                            0x0070,             // Address Range Minimum
                            0x0070,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x01,               // Address Length
                            )
                        IO (Decode16,
                            0x0080,             // Address Range Minimum
                            0x0080,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x01,               // Address Length
                            )
                        IO (Decode16,
                            0x0092,             // Address Range Minimum
                            0x0092,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x01,               // Address Length
                            )
                        IO (Decode16,
                            0x00B2,             // Address Range Minimum
                            0x00B2,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x02,               // Address Length
                            )
                        IO (Decode16,
                            0x0680,             // Address Range Minimum
                            0x0680,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x80,               // Address Length
                            )
                        IO (Decode16,
                            0x0800,             // Address Range Minimum
                            0x0800,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x10,               // Address Length
                            )
                        IO (Decode16,
                            0x1000,             // Address Range Minimum
                            0x1000,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x80,               // Address Length
                            )
                        IO (Decode16,
                            0x1180,             // Address Range Minimum
                            0x1180,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x40,               // Address Length
                            )
                        IO (Decode16,
                            0x1600,             // Address Range Minimum
                            0x1600,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x80,               // Address Length
                            )
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Return (BUF1)
                    }
                }

                Device (RTC)
                {
                    Name (_HID, EisaId ("PNP0B00"))
                    Name (BUF0, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0070,             // Address Range Minimum
                            0x0070,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x08,               // Address Length
                            )
                    })
                    Name (BUF1, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0070,             // Address Range Minimum
                            0x0070,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x08,               // Address Length
                            )
                        IRQNoFlags ()
                            {8}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        If (HPAE)
                        {
                            Return (BUF0)
                        }

                        Return (BUF1)
                    }
                }

                Device (TIMR)
                {
                    Name (_HID, EisaId ("PNP0100"))
                    Name (BUF0, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0040,             // Address Range Minimum
                            0x0040,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x04,               // Address Length
                            )
                        IO (Decode16,
                            0x0050,             // Address Range Minimum
                            0x0050,             // Address Range Maximum
                            0x10,               // Address Alignment
                            0x04,               // Address Length
                            )
                    })
                    Name (BUF1, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0040,             // Address Range Minimum
                            0x0040,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x04,               // Address Length
                            )
                        IO (Decode16,
                            0x0050,             // Address Range Minimum
                            0x0050,             // Address Range Maximum
                            0x10,               // Address Alignment
                            0x04,               // Address Length
                            )
                        IRQNoFlags ()
                            {0}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        If (HPAE)
                        {
                            Return (BUF0)
                        }

                        Return (BUF1)
                    }
                }

                Device (SIO)
                {
                    Name (_HID, EisaId ("PNP0A05"))
                    OperationRegion (SIIO, SystemIO, 0x4E, 0x02)
                    Field (SIIO, ByteAcc, NoLock, Preserve)
                    {
                        INDX,   8, 
                        DATA,   8
                    }

                    Mutex (N393, 0x00)
                    IndexField (INDX, DATA, ByteAcc, NoLock, Preserve)
                    {
                        Offset (0x07), 
                        LDN,    8, 
                        Offset (0x26), 
                            ,   1, 
                        LPTE,   1, 
                        Z009,   1, 
                        Z00A,   1, 
                        Offset (0x30), 
                        ACTR,   1, 
                        Offset (0x60), 
                        IOAH,   8, 
                        IOAL,   8, 
                        Offset (0x70), 
                        INTR,   8, 
                        Offset (0x74), 
                        DMCH,   8, 
                        Offset (0xF0), 
                        OPT1,   8
                    }

                    Method (ENFG, 1, NotSerialized)
                    {
                        Acquire (N393, 0xFFFF)
                        Store (0x07, INDX)
                        Store (Arg0, DATA)
                    }

                    Method (EXFG, 0, NotSerialized)
                    {
                        Release (N393)
                    }

                    Device (FIR)
                    {
                        Name (_HID, EisaId ("NSC6001"))
                        Method (_STA, 0, NotSerialized)
                        {
                            If (\_SB.COM0)
                            {
                                ENFG (0x02)
                                If (LEqual (Z009, 0x00))
                                {
                                    If (ACTR)
                                    {
                                        Store (0x0F, Local0)
                                    }
                                    Else
                                    {
                                        Store (0x0D, Local0)
                                    }
                                }
                                Else
                                {
                                    Store (0x00, Local0)
                                }

                                EXFG ()
                            }
                            Else
                            {
                                Store (0x00, Local0)
                            }

                            Return (Local0)
                        }

                        Method (_DIS, 0, NotSerialized)
                        {
                            ENFG (0x02)
                            If (ACTR)
                            {
                                Store (0x00, ACTR)
                                Store (0x00, INTR)
                                Store (0x00, IOAH)
                                Store (0x00, IOAL)
                                Store (0x00, DMCH)
                            }

                            EXFG ()
                            Store (0x00, \_SB.PCI0.LPCB.Z005)
                        }

                        Name (_PRS, ResourceTemplate ()
                        {
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02F8,             // Address Range Minimum
                                    0x02F8,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IRQNoFlags ()
                                    {3}
                                DMA (Compatibility, NotBusMaster, Transfer8)
                                    {0}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02F8,             // Address Range Minimum
                                    0x02F8,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IRQNoFlags ()
                                    {4}
                                DMA (Compatibility, NotBusMaster, Transfer8)
                                    {0}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02F8,             // Address Range Minimum
                                    0x02F8,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IRQNoFlags ()
                                    {3}
                                DMA (Compatibility, NotBusMaster, Transfer8)
                                    {1}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02F8,             // Address Range Minimum
                                    0x02F8,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IRQNoFlags ()
                                    {4}
                                DMA (Compatibility, NotBusMaster, Transfer8)
                                    {1}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02F8,             // Address Range Minimum
                                    0x02F8,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IRQNoFlags ()
                                    {3}
                                DMA (Compatibility, NotBusMaster, Transfer8)
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02F8,             // Address Range Minimum
                                    0x02F8,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IRQNoFlags ()
                                    {4}
                                DMA (Compatibility, NotBusMaster, Transfer8)
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03F8,             // Address Range Minimum
                                    0x03F8,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IRQNoFlags ()
                                    {4}
                                DMA (Compatibility, NotBusMaster, Transfer8)
                                    {0}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03F8,             // Address Range Minimum
                                    0x03F8,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IRQNoFlags ()
                                    {3}
                                DMA (Compatibility, NotBusMaster, Transfer8)
                                    {0}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03F8,             // Address Range Minimum
                                    0x03F8,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IRQNoFlags ()
                                    {4}
                                DMA (Compatibility, NotBusMaster, Transfer8)
                                    {1}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03F8,             // Address Range Minimum
                                    0x03F8,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IRQNoFlags ()
                                    {3}
                                DMA (Compatibility, NotBusMaster, Transfer8)
                                    {1}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03F8,             // Address Range Minimum
                                    0x03F8,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IRQNoFlags ()
                                    {4}
                                DMA (Compatibility, NotBusMaster, Transfer8)
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03F8,             // Address Range Minimum
                                    0x03F8,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IRQNoFlags ()
                                    {3}
                                DMA (Compatibility, NotBusMaster, Transfer8)
                                    {3}
                            }
                            EndDependentFn ()
                        })
                        Method (_CRS, 0, NotSerialized)
                        {
                            Name (DCRS, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x0000,             // Address Range Minimum
                                    0x0000,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IRQNoFlags ()
                                    {3}
                                DMA (Compatibility, NotBusMaster, Transfer8)
                                    {0}
                            })
                            ENFG (0x02)
                            If (ACTR)
                            {
                                Store (IOAH, Local1)
                                Store (IOAL, Local0)
                                Store (Local0, Index (DCRS, 0x02))
                                Store (Local0, Index (DCRS, 0x04))
                                Store (Local1, Index (DCRS, 0x03))
                                Store (Local1, Index (DCRS, 0x05))
                                ShiftLeft (0x01, INTR, Local0)
                                Store (Local0, Index (DCRS, 0x09))
                                ShiftRight (Local0, 0x08, Local1)
                                Store (Local1, Index (DCRS, 0x0A))
                                ShiftLeft (0x01, DMCH, Local0)
                                Store (Local0, Index (DCRS, 0x0C))
                                ShiftRight (Local0, 0x08, Local1)
                                Store (Local1, Index (DCRS, 0x0D))
                            }
                            Else
                            {
                                Store (0x00, Index (DCRS, 0x02))
                                Store (0x00, Index (DCRS, 0x04))
                                Store (0x00, Index (DCRS, 0x03))
                                Store (0x00, Index (DCRS, 0x05))
                                Store (0x00, Index (DCRS, 0x09))
                                Store (0x00, Index (DCRS, 0x0A))
                                Store (0x00, Index (DCRS, 0x0C))
                                Store (0x00, Index (DCRS, 0x0D))
                            }

                            EXFG ()
                            Return (DCRS)
                        }

                        Method (_SRS, 1, NotSerialized)
                        {
                            CreateByteField (Arg0, 0x02, ADRL)
                            CreateByteField (Arg0, 0x03, ADRM)
                            CreateWordField (Arg0, 0x09, IRQM)
                            CreateWordField (Arg0, 0x0C, DMAM)
                            FindSetRightBit (IRQM, Local0)
                            Decrement (Local0)
                            FindSetRightBit (DMAM, Local1)
                            Decrement (Local1)
                            And (IOD0, 0x0F, Local2)
                            If (LEqual (ADRM, 0x03))
                            {
                                If (LEqual (ADRL, 0xF8))
                                {
                                    Store (Local2, IOD0)
                                }
                                Else
                                {
                                    Or (Local2, 0x70, IOD0)
                                }
                            }
                            Else
                            {
                                If (LEqual (ADRL, 0xF8))
                                {
                                    Or (Local2, 0x10, IOD0)
                                }
                                Else
                                {
                                    Or (Local2, 0x50, IOD0)
                                }
                            }

                            Store (0x01, \_SB.PCI0.LPCB.Z005)
                            ENFG (0x02)
                            Store (Local0, INTR)
                            Store (Local1, DMCH)
                            Store (ADRM, IOAH)
                            Store (ADRL, IOAL)
                            Store (0x01, ACTR)
                            Or (0x80, OPT1, OPT1)
                            EXFG ()
                        }
                    }

                    Device (COMA)
                    {
                        Name (_HID, EisaId ("WACF004"))
                        Method (_STA, 0, NotSerialized)
                        {
                            ENFG (0x03)
                            If (LEqual (Z00A, 0x00))
                            {
                                If (ACTR)
                                {
                                    Store (0x0F, Local0)
                                }
                                Else
                                {
                                    Store (0x0D, Local0)
                                }
                            }
                            Else
                            {
                                Store (0x00, Local0)
                            }

                            EXFG ()
                            If (LEqual (Local0, 0x00))
                            {
                                Store (0x00, \_SB.PCI0.LPCB.Z004)
                            }

                            Return (Local0)
                        }

                        Method (_DIS, 0, NotSerialized)
                        {
                            ENFG (0x03)
                            If (ACTR)
                            {
                                Store (0x00, ACTR)
                                Store (0x00, INTR)
                                Store (0x00, IOAH)
                                Store (0x00, IOAL)
                            }

                            EXFG ()
                            Store (0x00, \_SB.PCI0.LPCB.Z004)
                        }

                        Name (_PRS, ResourceTemplate ()
                        {
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03F8,             // Address Range Minimum
                                    0x03F8,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IRQNoFlags ()
                                    {4}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02F8,             // Address Range Minimum
                                    0x02F8,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IRQNoFlags ()
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03E8,             // Address Range Minimum
                                    0x03E8,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IRQNoFlags ()
                                    {4}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02E8,             // Address Range Minimum
                                    0x02E8,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IRQNoFlags ()
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03F8,             // Address Range Minimum
                                    0x03F8,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IRQNoFlags ()
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02F8,             // Address Range Minimum
                                    0x02F8,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IRQNoFlags ()
                                    {4}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03E8,             // Address Range Minimum
                                    0x03E8,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IRQNoFlags ()
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02E8,             // Address Range Minimum
                                    0x02E8,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IRQNoFlags ()
                                    {4}
                            }
                            EndDependentFn ()
                        })
                        Method (_CRS, 0, NotSerialized)
                        {
                            Name (DCRS, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x03F8,             // Address Range Minimum
                                    0x03F8,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IRQNoFlags ()
                                    {4}
                            })
                            ENFG (0x03)
                            If (ACTR)
                            {
                                Store (IOAH, Local1)
                                Store (IOAL, Local0)
                                Store (Local0, Index (DCRS, 0x02))
                                Store (Local0, Index (DCRS, 0x04))
                                Store (Local1, Index (DCRS, 0x03))
                                Store (Local1, Index (DCRS, 0x05))
                                ShiftLeft (0x01, INTR, Local0)
                                Store (Local0, Index (DCRS, 0x09))
                                ShiftRight (Local0, 0x08, Local1)
                                Store (Local1, Index (DCRS, 0x0A))
                            }
                            Else
                            {
                                Store (0x00, Index (DCRS, 0x02))
                                Store (0x00, Index (DCRS, 0x04))
                                Store (0x00, Index (DCRS, 0x03))
                                Store (0x00, Index (DCRS, 0x05))
                                Store (0x00, Index (DCRS, 0x09))
                                Store (0x00, Index (DCRS, 0x0A))
                            }

                            EXFG ()
                            Return (DCRS)
                        }

                        Method (_SRS, 1, NotSerialized)
                        {
                            CreateByteField (Arg0, 0x02, ADRL)
                            CreateByteField (Arg0, 0x03, ADRM)
                            CreateWordField (Arg0, 0x09, IRQM)
                            FindSetRightBit (IRQM, Local0)
                            Decrement (Local0)
                            And (IOD0, 0xF0, Local1)
                            If (LEqual (ADRM, 0x03))
                            {
                                If (LEqual (ADRL, 0xF8))
                                {
                                    Store (Local1, IOD0)
                                }
                                Else
                                {
                                    Or (Local1, 0x07, IOD0)
                                }
                            }
                            Else
                            {
                                If (LEqual (ADRL, 0xF8))
                                {
                                    Or (Local1, 0x01, IOD0)
                                }
                                Else
                                {
                                    Or (Local1, 0x05, IOD0)
                                }
                            }

                            Store (0x01, \_SB.PCI0.LPCB.Z004)
                            ENFG (0x03)
                            Store (Local0, INTR)
                            Store (ADRM, IOAH)
                            Store (ADRL, IOAL)
                            Store (0x01, ACTR)
                            EXFG ()
                        }
                    }

                    Device (COMB)
                    {
                        Name (_HID, EisaId ("PNP0502"))
                        Method (_STA, 0, NotSerialized)
                        {
                            If (\_SB.COM0)
                            {
                                Store (0x00, Local0)
                            }
                            Else
                            {
                                ENFG (0x02)
                                If (LEqual (Z009, 0x00))
                                {
                                    If (ACTR)
                                    {
                                        Store (0x0F, Local0)
                                    }
                                    Else
                                    {
                                        Store (0x0D, Local0)
                                    }
                                }
                                Else
                                {
                                    Store (0x00, Local0)
                                }

                                EXFG ()
                            }

                            Return (Local0)
                        }

                        Method (_DIS, 0, NotSerialized)
                        {
                            ENFG (0x02)
                            If (ACTR)
                            {
                                Store (0x00, ACTR)
                                Store (0x00, INTR)
                                Store (0x00, IOAH)
                                Store (0x00, IOAL)
                            }

                            EXFG ()
                            Store (0x00, \_SB.PCI0.LPCB.Z005)
                        }

                        Name (_PRS, ResourceTemplate ()
                        {
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02F8,             // Address Range Minimum
                                    0x02F8,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IRQNoFlags ()
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02F8,             // Address Range Minimum
                                    0x02F8,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IRQNoFlags ()
                                    {4}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03F8,             // Address Range Minimum
                                    0x03F8,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IRQNoFlags ()
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03F8,             // Address Range Minimum
                                    0x03F8,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IRQNoFlags ()
                                    {4}
                            }
                            EndDependentFn ()
                        })
                        Method (_CRS, 0, NotSerialized)
                        {
                            Name (DCRS, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x02F8,             // Address Range Minimum
                                    0x02F8,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IRQNoFlags ()
                                    {3}
                            })
                            ENFG (0x02)
                            If (ACTR)
                            {
                                Store (IOAH, Local1)
                                Store (IOAL, Local0)
                                Store (Local0, Index (DCRS, 0x02))
                                Store (Local0, Index (DCRS, 0x04))
                                Store (Local1, Index (DCRS, 0x03))
                                Store (Local1, Index (DCRS, 0x05))
                                ShiftLeft (0x01, INTR, Local0)
                                Store (Local0, Index (DCRS, 0x09))
                                ShiftRight (Local0, 0x08, Local1)
                                Store (Local1, Index (DCRS, 0x0A))
                            }
                            Else
                            {
                                Store (0x00, Index (DCRS, 0x02))
                                Store (0x00, Index (DCRS, 0x04))
                                Store (0x00, Index (DCRS, 0x03))
                                Store (0x00, Index (DCRS, 0x05))
                                Store (0x00, Index (DCRS, 0x09))
                                Store (0x00, Index (DCRS, 0x0A))
                            }

                            EXFG ()
                            Return (DCRS)
                        }

                        Method (_SRS, 1, NotSerialized)
                        {
                            CreateByteField (Arg0, 0x02, ADRL)
                            CreateByteField (Arg0, 0x03, ADRM)
                            CreateWordField (Arg0, 0x09, IRQM)
                            FindSetRightBit (IRQM, Local0)
                            Decrement (Local0)
                            And (IOD0, 0x0F, Local1)
                            If (LEqual (ADRM, 0x03))
                            {
                                If (LEqual (ADRL, 0xF8))
                                {
                                    Store (Local1, IOD0)
                                }
                                Else
                                {
                                    Or (Local1, 0x70, IOD0)
                                }
                            }
                            Else
                            {
                                If (LEqual (ADRL, 0xF8))
                                {
                                    Or (Local1, 0x10, IOD0)
                                }
                                Else
                                {
                                    Or (Local1, 0x50, IOD0)
                                }
                            }

                            Store (0x01, \_SB.PCI0.LPCB.Z005)
                            ENFG (0x02)
                            Store (Local0, INTR)
                            Store (ADRM, IOAH)
                            Store (ADRL, IOAL)
                            Store (0x01, ACTR)
                            EXFG ()
                        }
                    }

                    Device (ECP)
                    {
                        Name (_HID, EisaId ("PNP0401"))
                        Name (_UID, 0x03)
                        Method (_STA, 0, NotSerialized)
                        {
                            ENFG (0x01)
                            Store (OPT1, Local0)
                            Store (LPTE, Local2)
                            Store (ACTR, Local3)
                            EXFG ()
                            ShiftRight (Local0, 0x05, Local0)
                            If (LAnd (LEqual (Local2, 0x00), LOr (LEqual (Local0, 0x04), LEqual (Local0, 0x07))))
                            {
                                If (\_SB.DOCK)
                                {
                                    ShiftLeft (Local3, 0x01, Local1)
                                    Add (0x0D, Local1, Local1)
                                }
                                Else
                                {
                                    Store (0x00, Local1)
                                }
                            }
                            Else
                            {
                                Store (0x00, Local1)
                            }

                            Return (Local1)
                        }

                        Method (_DIS, 0, NotSerialized)
                        {
                            ENFG (0x01)
                            Store (OPT1, Local0)
                            ShiftRight (Local0, 0x05, Local0)
                            If (LAnd (LEqual (LPTE, 0x00), LOr (LEqual (Local0, 0x04), LEqual (Local0, 0x07))))
                            {
                                If (ACTR)
                                {
                                    Store (0x00, ACTR)
                                    Store (0x00, INTR)
                                    Store (0x00, IOAH)
                                    Store (0x00, IOAL)
                                    Store (0x00, DMCH)
                                }

                                Store (0x00, \_SB.PCI0.LPCB.LPTE)
                            }

                            EXFG ()
                        }

                        Name (_PRS, ResourceTemplate ()
                        {
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0378,             // Address Range Minimum
                                    0x0378,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IO (Decode16,
                                    0x0778,             // Address Range Minimum
                                    0x0778,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IRQNoFlags ()
                                    {7}
                                DMA (Compatibility, NotBusMaster, Transfer8)
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0278,             // Address Range Minimum
                                    0x0278,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IO (Decode16,
                                    0x0678,             // Address Range Minimum
                                    0x0678,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IRQNoFlags ()
                                    {5}
                                DMA (Compatibility, NotBusMaster, Transfer8)
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0378,             // Address Range Minimum
                                    0x0378,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IO (Decode16,
                                    0x0778,             // Address Range Minimum
                                    0x0778,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IRQNoFlags ()
                                    {5}
                                DMA (Compatibility, NotBusMaster, Transfer8)
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0278,             // Address Range Minimum
                                    0x0278,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IO (Decode16,
                                    0x0678,             // Address Range Minimum
                                    0x0678,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IRQNoFlags ()
                                    {7}
                                DMA (Compatibility, NotBusMaster, Transfer8)
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0378,             // Address Range Minimum
                                    0x0378,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IO (Decode16,
                                    0x0778,             // Address Range Minimum
                                    0x0778,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IRQNoFlags ()
                                    {7}
                                DMA (Compatibility, NotBusMaster, Transfer8)
                                    {1}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0278,             // Address Range Minimum
                                    0x0278,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IO (Decode16,
                                    0x0678,             // Address Range Minimum
                                    0x0678,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IRQNoFlags ()
                                    {5}
                                DMA (Compatibility, NotBusMaster, Transfer8)
                                    {1}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0378,             // Address Range Minimum
                                    0x0378,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IO (Decode16,
                                    0x0778,             // Address Range Minimum
                                    0x0778,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IRQNoFlags ()
                                    {5}
                                DMA (Compatibility, NotBusMaster, Transfer8)
                                    {1}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0278,             // Address Range Minimum
                                    0x0278,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IO (Decode16,
                                    0x0678,             // Address Range Minimum
                                    0x0678,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IRQNoFlags ()
                                    {7}
                                DMA (Compatibility, NotBusMaster, Transfer8)
                                    {1}
                            }
                            EndDependentFn ()
                        })
                        Method (_CRS, 0, NotSerialized)
                        {
                            Name (DCRS, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x0000,             // Address Range Minimum
                                    0x0000,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IO (Decode16,
                                    0x0000,             // Address Range Minimum
                                    0x0000,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IRQNoFlags ()
                                    {7}
                                DMA (Compatibility, NotBusMaster, Transfer8)
                                    {3}
                            })
                            ENFG (0x01)
                            If (ACTR)
                            {
                                Store (IOAH, Local1)
                                Store (IOAL, Local0)
                                Store (Local0, Index (DCRS, 0x02))
                                Store (Local0, Index (DCRS, 0x0A))
                                Store (Local0, Index (DCRS, 0x04))
                                Store (Local0, Index (DCRS, 0x0C))
                                Store (Local1, Index (DCRS, 0x03))
                                Store (Local1, Index (DCRS, 0x05))
                                Add (Local1, 0x04, Local1)
                                Store (Local1, Index (DCRS, 0x0B))
                                Store (Local1, Index (DCRS, 0x0D))
                                ShiftLeft (0x01, INTR, Local0)
                                Store (Local0, Index (DCRS, 0x11))
                                ShiftRight (Local0, 0x08, Local1)
                                Store (Local1, Index (DCRS, 0x12))
                                ShiftLeft (0x01, DMCH, Local0)
                                Store (Local0, Index (DCRS, 0x14))
                                ShiftRight (Local0, 0x08, Local1)
                                Store (Local1, Index (DCRS, 0x15))
                            }
                            Else
                            {
                                Store (0x00, Index (DCRS, 0x02))
                                Store (0x00, Index (DCRS, 0x0A))
                                Store (0x00, Index (DCRS, 0x04))
                                Store (0x00, Index (DCRS, 0x0C))
                                Store (0x00, Index (DCRS, 0x03))
                                Store (0x00, Index (DCRS, 0x05))
                                Store (0x00, Index (DCRS, 0x0B))
                                Store (0x00, Index (DCRS, 0x0D))
                                Store (0x00, Index (DCRS, 0x11))
                                Store (0x00, Index (DCRS, 0x12))
                                Store (0x00, Index (DCRS, 0x14))
                                Store (0x00, Index (DCRS, 0x15))
                            }

                            EXFG ()
                            Return (DCRS)
                        }

                        Method (_SRS, 1, NotSerialized)
                        {
                            CreateByteField (Arg0, 0x02, ADRL)
                            CreateByteField (Arg0, 0x03, ADRM)
                            CreateWordField (Arg0, 0x11, IRQM)
                            CreateWordField (Arg0, 0x14, DMAM)
                            FindSetRightBit (IRQM, Local0)
                            Decrement (Local0)
                            FindSetRightBit (DMAM, Local1)
                            Decrement (Local1)
                            Store (0x00, \_SB.PCI0.LPCB.LPTE)
                            And (IOD1, 0xF0, Local2)
                            If (LEqual (ADRM, 0x03))
                            {
                                Store (Local2, IOD1)
                            }
                            Else
                            {
                                Or (Local2, 0x01, IOD1)
                            }

                            Store (0x01, \_SB.PCI0.LPCB.LPTE)
                            ENFG (0x01)
                            Store (Local0, INTR)
                            Store (Local1, DMCH)
                            Store (ADRM, IOAH)
                            Store (ADRL, IOAL)
                            Store (0x01, ACTR)
                            EXFG ()
                        }
                    }

                    Device (EPP)
                    {
                        Name (_HID, EisaId ("PNP0400"))
                        Name (_UID, 0x02)
                        Method (_STA, 0, NotSerialized)
                        {
                            ENFG (0x01)
                            Store (OPT1, Local0)
                            Store (LPTE, Local2)
                            Store (ACTR, Local3)
                            EXFG ()
                            ShiftRight (Local0, 0x05, Local0)
                            If (LAnd (LEqual (Local2, 0x00), LOr (LEqual (Local0, 0x02), LEqual (Local0, 0x03))))
                            {
                                If (\_SB.DOCK)
                                {
                                    ShiftLeft (Local3, 0x01, Local1)
                                    Add (0x0D, Local1, Local1)
                                }
                                Else
                                {
                                    Store (0x00, Local1)
                                }
                            }
                            Else
                            {
                                Store (0x00, Local1)
                            }

                            Return (Local1)
                        }

                        Method (_DIS, 0, NotSerialized)
                        {
                            ENFG (0x01)
                            Store (OPT1, Local0)
                            ShiftRight (Local0, 0x05, Local0)
                            If (LAnd (LEqual (LPTE, 0x00), LOr (LEqual (Local0, 0x02), LEqual (Local0, 0x03))))
                            {
                                If (ACTR)
                                {
                                    Store (0x00, ACTR)
                                    Store (0x00, INTR)
                                    Store (0x00, IOAH)
                                    Store (0x00, IOAL)
                                }

                                Store (0x00, \_SB.PCI0.LPCB.LPTE)
                            }

                            EXFG ()
                        }

                        Name (_PRS, ResourceTemplate ()
                        {
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0378,             // Address Range Minimum
                                    0x0378,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IO (Decode16,
                                    0x0778,             // Address Range Minimum
                                    0x0778,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IRQNoFlags ()
                                    {7}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0278,             // Address Range Minimum
                                    0x0278,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IO (Decode16,
                                    0x0678,             // Address Range Minimum
                                    0x0678,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IRQNoFlags ()
                                    {5}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0378,             // Address Range Minimum
                                    0x0378,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IO (Decode16,
                                    0x0778,             // Address Range Minimum
                                    0x0778,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IRQNoFlags ()
                                    {5}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0278,             // Address Range Minimum
                                    0x0278,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IO (Decode16,
                                    0x0678,             // Address Range Minimum
                                    0x0678,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IRQNoFlags ()
                                    {7}
                            }
                            EndDependentFn ()
                        })
                        Method (_CRS, 0, NotSerialized)
                        {
                            Name (DCRS, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x0000,             // Address Range Minimum
                                    0x0000,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IO (Decode16,
                                    0x0000,             // Address Range Minimum
                                    0x0000,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IRQNoFlags ()
                                    {7}
                            })
                            ENFG (0x01)
                            If (ACTR)
                            {
                                Store (IOAH, Local1)
                                Store (IOAL, Local0)
                                Store (Local0, Index (DCRS, 0x02))
                                Store (Local0, Index (DCRS, 0x0A))
                                Store (Local0, Index (DCRS, 0x04))
                                Store (Local0, Index (DCRS, 0x0C))
                                Store (Local1, Index (DCRS, 0x03))
                                Store (Local1, Index (DCRS, 0x05))
                                Add (Local1, 0x04, Local1)
                                Store (Local1, Index (DCRS, 0x0B))
                                Store (Local1, Index (DCRS, 0x0D))
                                ShiftLeft (0x01, INTR, Local0)
                                Store (Local0, Index (DCRS, 0x11))
                                ShiftRight (Local0, 0x08, Local1)
                                Store (Local1, Index (DCRS, 0x12))
                            }
                            Else
                            {
                                Store (0x00, Index (DCRS, 0x02))
                                Store (0x00, Index (DCRS, 0x0A))
                                Store (0x00, Index (DCRS, 0x04))
                                Store (0x00, Index (DCRS, 0x0C))
                                Store (0x00, Index (DCRS, 0x03))
                                Store (0x00, Index (DCRS, 0x05))
                                Store (0x00, Index (DCRS, 0x0B))
                                Store (0x00, Index (DCRS, 0x0D))
                                Store (0x00, Index (DCRS, 0x11))
                                Store (0x00, Index (DCRS, 0x12))
                            }

                            EXFG ()
                            Return (DCRS)
                        }

                        Method (_SRS, 1, NotSerialized)
                        {
                            CreateByteField (Arg0, 0x02, ADRL)
                            CreateByteField (Arg0, 0x03, ADRM)
                            CreateWordField (Arg0, 0x11, IRQM)
                            FindSetRightBit (IRQM, Local0)
                            Decrement (Local0)
                            Store (0x00, \_SB.PCI0.LPCB.LPTE)
                            And (IOD1, 0xF0, Local2)
                            If (LEqual (ADRM, 0x03))
                            {
                                Store (Local2, IOD1)
                            }
                            Else
                            {
                                Or (Local2, 0x01, IOD1)
                            }

                            Store (0x01, \_SB.PCI0.LPCB.LPTE)
                            ENFG (0x01)
                            Store (Local0, INTR)
                            Store (ADRM, IOAH)
                            Store (ADRL, IOAL)
                            Store (0x01, ACTR)
                            EXFG ()
                        }
                    }

                    Device (LPTB)
                    {
                        Name (_HID, EisaId ("PNP0400"))
                        Name (_UID, 0x01)
                        Method (_STA, 0, NotSerialized)
                        {
                            ENFG (0x01)
                            Store (OPT1, Local0)
                            Store (LPTE, Local2)
                            Store (ACTR, Local3)
                            EXFG ()
                            ShiftRight (Local0, 0x05, Local0)
                            If (LAnd (LEqual (Local2, 0x00), LEqual (Local0, 0x01)))
                            {
                                If (\_SB.DOCK)
                                {
                                    ShiftLeft (Local3, 0x01, Local1)
                                    Add (0x0D, Local1, Local1)
                                }
                                Else
                                {
                                    Store (0x00, Local1)
                                }
                            }
                            Else
                            {
                                Store (0x00, Local1)
                            }

                            Return (Local1)
                        }

                        Method (_DIS, 0, NotSerialized)
                        {
                            ENFG (0x01)
                            Store (OPT1, Local0)
                            ShiftRight (Local0, 0x05, Local0)
                            If (LAnd (LEqual (LPTE, 0x00), LEqual (Local0, 0x01)))
                            {
                                If (ACTR)
                                {
                                    Store (0x00, ACTR)
                                    Store (0x00, INTR)
                                    Store (0x00, IOAH)
                                    Store (0x00, IOAL)
                                }

                                Store (0x00, \_SB.PCI0.LPCB.LPTE)
                            }

                            EXFG ()
                        }

                        Name (_PRS, ResourceTemplate ()
                        {
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0378,             // Address Range Minimum
                                    0x0378,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IO (Decode16,
                                    0x0778,             // Address Range Minimum
                                    0x0778,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IRQNoFlags ()
                                    {7}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0278,             // Address Range Minimum
                                    0x0278,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IO (Decode16,
                                    0x0678,             // Address Range Minimum
                                    0x0678,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IRQNoFlags ()
                                    {5}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0378,             // Address Range Minimum
                                    0x0378,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IO (Decode16,
                                    0x0778,             // Address Range Minimum
                                    0x0778,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IRQNoFlags ()
                                    {5}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0278,             // Address Range Minimum
                                    0x0278,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IO (Decode16,
                                    0x0678,             // Address Range Minimum
                                    0x0678,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IRQNoFlags ()
                                    {7}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03BC,             // Address Range Minimum
                                    0x03BC,             // Address Range Maximum
                                    0x04,               // Address Alignment
                                    0x04,               // Address Length
                                    )
                                IO (Decode16,
                                    0x07BC,             // Address Range Minimum
                                    0x07BC,             // Address Range Maximum
                                    0x04,               // Address Alignment
                                    0x04,               // Address Length
                                    )
                                IRQNoFlags ()
                                    {7}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03BC,             // Address Range Minimum
                                    0x03BC,             // Address Range Maximum
                                    0x04,               // Address Alignment
                                    0x04,               // Address Length
                                    )
                                IO (Decode16,
                                    0x07BC,             // Address Range Minimum
                                    0x07BC,             // Address Range Maximum
                                    0x04,               // Address Alignment
                                    0x04,               // Address Length
                                    )
                                IRQNoFlags ()
                                    {5}
                            }
                            EndDependentFn ()
                        })
                        Method (_CRS, 0, NotSerialized)
                        {
                            Name (DCRS, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x0000,             // Address Range Minimum
                                    0x0000,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IO (Decode16,
                                    0x0000,             // Address Range Minimum
                                    0x0000,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IRQNoFlags ()
                                    {7}
                            })
                            ENFG (0x01)
                            If (ACTR)
                            {
                                Store (IOAH, Local1)
                                Store (IOAL, Local0)
                                Store (Local0, Index (DCRS, 0x02))
                                Store (Local0, Index (DCRS, 0x0A))
                                Store (Local0, Index (DCRS, 0x04))
                                Store (Local0, Index (DCRS, 0x0C))
                                Store (Local1, Index (DCRS, 0x03))
                                Store (Local1, Index (DCRS, 0x05))
                                Add (Local1, 0x04, Local1)
                                Store (Local1, Index (DCRS, 0x0B))
                                Store (Local1, Index (DCRS, 0x0D))
                                If (And (Local0, 0x04))
                                {
                                    Store (0x04, Local0)
                                }
                                Else
                                {
                                    Store (0x08, Local0)
                                }

                                Store (Local0, Index (DCRS, 0x06))
                                Store (Local0, Index (DCRS, 0x07))
                                Store (Local0, Index (DCRS, 0x0E))
                                Store (Local0, Index (DCRS, 0x0F))
                                ShiftLeft (0x01, INTR, Local0)
                                Store (Local0, Index (DCRS, 0x11))
                                ShiftRight (Local0, 0x08, Local1)
                                Store (Local1, Index (DCRS, 0x12))
                            }
                            Else
                            {
                                Store (0x00, Index (DCRS, 0x02))
                                Store (0x00, Index (DCRS, 0x0A))
                                Store (0x00, Index (DCRS, 0x04))
                                Store (0x00, Index (DCRS, 0x0C))
                                Store (0x00, Index (DCRS, 0x03))
                                Store (0x00, Index (DCRS, 0x05))
                                Store (0x00, Index (DCRS, 0x0B))
                                Store (0x00, Index (DCRS, 0x0D))
                                Store (0x00, Index (DCRS, 0x11))
                                Store (0x00, Index (DCRS, 0x12))
                            }

                            EXFG ()
                            Return (DCRS)
                        }

                        Method (_SRS, 1, NotSerialized)
                        {
                            CreateByteField (Arg0, 0x02, ADRL)
                            CreateByteField (Arg0, 0x03, ADRM)
                            CreateWordField (Arg0, 0x11, IRQM)
                            FindSetRightBit (IRQM, Local0)
                            Decrement (Local0)
                            Store (0x00, \_SB.PCI0.LPCB.LPTE)
                            And (IOD1, 0xF0, Local2)
                            If (LEqual (ADRM, 0x03))
                            {
                                If (LEqual (ADRL, 0xBC))
                                {
                                    Or (Local2, 0x02, IOD1)
                                }
                                Else
                                {
                                    Store (Local2, IOD1)
                                }
                            }
                            Else
                            {
                                Or (Local2, 0x01, IOD1)
                            }

                            Store (0x01, \_SB.PCI0.LPCB.LPTE)
                            ENFG (0x01)
                            Store (Local0, INTR)
                            Store (ADRM, IOAH)
                            Store (ADRL, IOAL)
                            Store (0x01, ACTR)
                            EXFG ()
                        }
                    }

                    Device (LPT)
                    {
                        Name (_HID, EisaId ("PNP0400"))
                        Name (_UID, 0x00)
                        Method (_STA, 0, NotSerialized)
                        {
                            ENFG (0x01)
                            Store (OPT1, Local0)
                            Store (LPTE, Local2)
                            Store (ACTR, Local3)
                            EXFG ()
                            ShiftRight (Local0, 0x05, Local0)
                            If (LAnd (LEqual (Local2, 0x00), LEqual (Local0, 0x00)))
                            {
                                If (\_SB.DOCK)
                                {
                                    ShiftLeft (Local3, 0x01, Local1)
                                    Add (0x0D, Local1, Local1)
                                }
                                Else
                                {
                                    Store (0x00, Local1)
                                }
                            }
                            Else
                            {
                                Store (0x00, Local1)
                            }

                            Return (Local1)
                        }

                        Method (_DIS, 0, NotSerialized)
                        {
                            ENFG (0x01)
                            Store (OPT1, Local0)
                            ShiftRight (Local0, 0x05, Local0)
                            If (LAnd (LEqual (LPTE, 0x00), LEqual (Local0, 0x00)))
                            {
                                If (ACTR)
                                {
                                    Store (0x00, ACTR)
                                    Store (0x00, INTR)
                                    Store (0x00, IOAH)
                                    Store (0x00, IOAL)
                                }

                                Store (0x00, \_SB.PCI0.LPCB.LPTE)
                            }

                            EXFG ()
                        }

                        Name (_PRS, ResourceTemplate ()
                        {
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0378,             // Address Range Minimum
                                    0x0378,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IO (Decode16,
                                    0x0778,             // Address Range Minimum
                                    0x0778,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IRQNoFlags ()
                                    {7}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0278,             // Address Range Minimum
                                    0x0278,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IO (Decode16,
                                    0x0678,             // Address Range Minimum
                                    0x0678,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IRQNoFlags ()
                                    {5}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0378,             // Address Range Minimum
                                    0x0378,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IO (Decode16,
                                    0x0778,             // Address Range Minimum
                                    0x0778,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IRQNoFlags ()
                                    {5}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0278,             // Address Range Minimum
                                    0x0278,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IO (Decode16,
                                    0x0678,             // Address Range Minimum
                                    0x0678,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IRQNoFlags ()
                                    {7}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03BC,             // Address Range Minimum
                                    0x03BC,             // Address Range Maximum
                                    0x04,               // Address Alignment
                                    0x04,               // Address Length
                                    )
                                IO (Decode16,
                                    0x07BC,             // Address Range Minimum
                                    0x07BC,             // Address Range Maximum
                                    0x04,               // Address Alignment
                                    0x04,               // Address Length
                                    )
                                IRQNoFlags ()
                                    {7}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03BC,             // Address Range Minimum
                                    0x03BC,             // Address Range Maximum
                                    0x04,               // Address Alignment
                                    0x04,               // Address Length
                                    )
                                IO (Decode16,
                                    0x07BC,             // Address Range Minimum
                                    0x07BC,             // Address Range Maximum
                                    0x04,               // Address Alignment
                                    0x04,               // Address Length
                                    )
                                IRQNoFlags ()
                                    {5}
                            }
                            EndDependentFn ()
                        })
                        Method (_CRS, 0, NotSerialized)
                        {
                            Name (DCRS, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x0000,             // Address Range Minimum
                                    0x0000,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IO (Decode16,
                                    0x0000,             // Address Range Minimum
                                    0x0000,             // Address Range Maximum
                                    0x08,               // Address Alignment
                                    0x08,               // Address Length
                                    )
                                IRQNoFlags ()
                                    {7}
                            })
                            ENFG (0x01)
                            If (ACTR)
                            {
                                Store (IOAH, Local1)
                                Store (IOAL, Local0)
                                Store (Local0, Index (DCRS, 0x02))
                                Store (Local0, Index (DCRS, 0x0A))
                                Store (Local0, Index (DCRS, 0x04))
                                Store (Local0, Index (DCRS, 0x0C))
                                Store (Local1, Index (DCRS, 0x03))
                                Store (Local1, Index (DCRS, 0x05))
                                Add (Local1, 0x04, Local1)
                                Store (Local1, Index (DCRS, 0x0B))
                                Store (Local1, Index (DCRS, 0x0D))
                                If (And (Local0, 0x04))
                                {
                                    Store (0x04, Local0)
                                }
                                Else
                                {
                                    Store (0x08, Local0)
                                }

                                Store (Local0, Index (DCRS, 0x06))
                                Store (Local0, Index (DCRS, 0x07))
                                Store (Local0, Index (DCRS, 0x0E))
                                Store (Local0, Index (DCRS, 0x0F))
                                ShiftLeft (0x01, INTR, Local0)
                                Store (Local0, Index (DCRS, 0x11))
                                ShiftRight (Local0, 0x08, Local1)
                                Store (Local1, Index (DCRS, 0x12))
                            }
                            Else
                            {
                                Store (0x00, Index (DCRS, 0x02))
                                Store (0x00, Index (DCRS, 0x0A))
                                Store (0x00, Index (DCRS, 0x04))
                                Store (0x00, Index (DCRS, 0x0C))
                                Store (0x00, Index (DCRS, 0x03))
                                Store (0x00, Index (DCRS, 0x05))
                                Store (0x00, Index (DCRS, 0x0B))
                                Store (0x00, Index (DCRS, 0x0D))
                                Store (0x00, Index (DCRS, 0x11))
                                Store (0x00, Index (DCRS, 0x12))
                            }

                            EXFG ()
                            Return (DCRS)
                        }

                        Method (_SRS, 1, NotSerialized)
                        {
                            CreateByteField (Arg0, 0x02, ADRL)
                            CreateByteField (Arg0, 0x03, ADRM)
                            CreateWordField (Arg0, 0x11, IRQM)
                            FindSetRightBit (IRQM, Local0)
                            Decrement (Local0)
                            Store (0x00, \_SB.PCI0.LPCB.LPTE)
                            And (IOD1, 0xF0, Local2)
                            If (LEqual (ADRM, 0x03))
                            {
                                If (LEqual (ADRL, 0xBC))
                                {
                                    Or (Local2, 0x02, IOD1)
                                }
                                Else
                                {
                                    Store (Local2, IOD1)
                                }
                            }
                            Else
                            {
                                Or (Local2, 0x01, IOD1)
                            }

                            Store (0x01, \_SB.PCI0.LPCB.LPTE)
                            ENFG (0x01)
                            Store (Local0, INTR)
                            Store (ADRM, IOAH)
                            Store (ADRL, IOAL)
                            Store (0x01, ACTR)
                            EXFG ()
                        }
                    }
                }

                Device (PS2K)
                {
                    Name (_HID, EisaId ("PNP0303"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0060,             // Address Range Minimum
                            0x0060,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x01,               // Address Length
                            )
                        IO (Decode16,
                            0x0064,             // Address Range Minimum
                            0x0064,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x01,               // Address Length
                            )
                        IRQ (Edge, ActiveHigh, Exclusive)
                            {1}
                    })
                }

                Device (PS2M)
                {
                    Name (_HID, EisaId ("SYN1003"))
                    Name (_CID, Package (0x03)
                    {
                        0x00102E4F, 
                        0x02002E4F, 
                        0x130FD041
                    })
                    Name (_CRS, ResourceTemplate ()
                    {
                        IRQ (Edge, ActiveHigh, Exclusive)
                            {12}
                    })
                }
            }

            Device (PATA)
            {
                Name (_ADR, 0x001F0001)
                OperationRegion (PACS, PCI_Config, 0x40, 0xC0)
                Field (PACS, DWordAcc, NoLock, Preserve)
                {
                    PRIT,   16, 
                    Offset (0x04), 
                    PSIT,   4, 
                    Offset (0x08), 
                    SYNC,   4, 
                    Offset (0x0A), 
                    SDT0,   2, 
                        ,   2, 
                    SDT1,   2, 
                    Offset (0x14), 
                    ICR0,   4, 
                    ICR1,   4, 
                    ICR2,   4, 
                    ICR3,   4, 
                    ICR4,   4, 
                    ICR5,   4
                }

                Device (PRID)
                {
                    Name (_ADR, 0x00)
                    Method (_GTM, 0, NotSerialized)
                    {
                        Return (Buffer (0x14)
                        {
                            0x78, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 
                            0x78, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 
                            0x1F, 0x00, 0x00, 0x00
                        })
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        CreateDWordField (Arg0, 0x00, PIO0)
                        CreateDWordField (Arg0, 0x04, DMA0)
                        CreateDWordField (Arg0, 0x08, PIO1)
                        CreateDWordField (Arg0, 0x0C, DMA1)
                        CreateDWordField (Arg0, 0x10, FLAG)
                        If (LEqual (SizeOf (Arg1), 0x0200))
                        {
                            And (PRIT, 0x40F0, PRIT)
                            And (SYNC, 0x02, SYNC)
                            Store (0x00, SDT0)
                            And (ICR0, 0x02, ICR0)
                            And (ICR1, 0x02, ICR1)
                            And (ICR3, 0x02, ICR3)
                            And (ICR5, 0x02, ICR5)
                            CreateWordField (Arg1, 0x62, W490)
                            CreateWordField (Arg1, 0x6A, W530)
                            CreateWordField (Arg1, 0x7E, W630)
                            CreateWordField (Arg1, 0x80, W640)
                            CreateWordField (Arg1, 0xB0, W880)
                            CreateWordField (Arg1, 0xBA, W930)
                            Or (PRIT, 0x8004, PRIT)
                            If (LAnd (And (FLAG, 0x02), And (W490, 0x0800)))
                            {
                                Or (PRIT, 0x02, PRIT)
                            }

                            Or (PRIT, SETP (PIO0, W530, W640), PRIT)
                            If (And (FLAG, 0x01))
                            {
                                Or (SYNC, 0x01, SYNC)
                                Store (SDMA (DMA0), SDT0)
                                If (LLess (DMA0, 0x1E))
                                {
                                    Or (ICR3, 0x01, ICR3)
                                }

                                If (LLess (DMA0, 0x3C))
                                {
                                    Or (ICR0, 0x01, ICR0)
                                }

                                If (And (W930, 0x2000))
                                {
                                    Or (ICR1, 0x01, ICR1)
                                }
                            }
                        }

                        If (LEqual (SizeOf (Arg2), 0x0200))
                        {
                            And (PRIT, 0x3F0F, PRIT)
                            Store (0x00, PSIT)
                            And (SYNC, 0x01, SYNC)
                            Store (0x00, SDT1)
                            And (ICR0, 0x01, ICR0)
                            And (ICR1, 0x01, ICR1)
                            And (ICR3, 0x01, ICR3)
                            And (ICR5, 0x01, ICR5)
                            CreateWordField (Arg2, 0x62, W491)
                            CreateWordField (Arg2, 0x6A, W531)
                            CreateWordField (Arg2, 0x7E, W631)
                            CreateWordField (Arg2, 0x80, W641)
                            CreateWordField (Arg2, 0xB0, W881)
                            CreateWordField (Arg2, 0xBA, W931)
                            Or (PRIT, 0x8040, PRIT)
                            If (LAnd (And (FLAG, 0x08), And (W491, 0x0800)))
                            {
                                Or (PRIT, 0x20, PRIT)
                            }

                            If (And (FLAG, 0x10))
                            {
                                Or (PRIT, 0x4000, PRIT)
                                If (LGreater (PIO1, 0xF0))
                                {
                                    Or (PRIT, 0x80, PRIT)
                                }
                                Else
                                {
                                    Or (PRIT, 0x10, PRIT)
                                    Store (SETT (PIO1, W531, W641), PSIT)
                                }
                            }

                            If (And (FLAG, 0x04))
                            {
                                Or (SYNC, 0x02, SYNC)
                                Store (SDMA (DMA1), SDT1)
                                If (LLess (DMA1, 0x1E))
                                {
                                    Or (ICR3, 0x02, ICR3)
                                }

                                If (LLess (DMA1, 0x3C))
                                {
                                    Or (ICR0, 0x02, ICR0)
                                }

                                If (And (W931, 0x2000))
                                {
                                    Or (ICR1, 0x02, ICR1)
                                }
                            }
                        }
                    }

                    Device (P_D0)
                    {
                        Name (_ADR, 0x00)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Name (PIB0, Buffer (0x0E)
                            {
                                0x03, 0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF, 0x03, 
                                0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF
                            })
                            CreateByteField (PIB0, 0x01, PMD0)
                            CreateByteField (PIB0, 0x08, DMD0)
                            If (And (PRIT, 0x02))
                            {
                                If (LEqual (And (PRIT, 0x09), 0x08))
                                {
                                    Store (0x08, PMD0)
                                }
                                Else
                                {
                                    Store (0x0A, PMD0)
                                    ShiftRight (And (PRIT, 0x0300), 0x08, Local0)
                                    ShiftRight (And (PRIT, 0x3000), 0x0C, Local1)
                                    Add (Local0, Local1, Local2)
                                    If (LEqual (0x03, Local2))
                                    {
                                        Store (0x0B, PMD0)
                                    }

                                    If (LEqual (0x05, Local2))
                                    {
                                        Store (0x0C, PMD0)
                                    }
                                }
                            }
                            Else
                            {
                                Store (0x01, PMD0)
                            }

                            If (And (SYNC, 0x01))
                            {
                                Store (Or (SDT0, 0x40), DMD0)
                                If (And (ICR1, 0x01))
                                {
                                    If (And (ICR0, 0x01))
                                    {
                                        Add (DMD0, 0x02, DMD0)
                                    }

                                    If (And (ICR3, 0x01))
                                    {
                                        Store (0x45, DMD0)
                                    }
                                }
                            }
                            Else
                            {
                                Or (Subtract (And (PMD0, 0x07), 0x02), 0x20, DMD0)
                            }

                            Return (PIB0)
                        }
                    }

                    Device (BAY)
                    {
                        Name (_ADR, 0x01)
                        Name (IDER, 0x00)
                        Name (BAYE, 0x00)
                        Method (_INI, 0, NotSerialized)
                        {
                            Store (\_SB.PCI0.PATA.PRID.BAY._STA (), Local0)
                            If (Local0)
                            {
                                Store (0x01, BAYE)
                            }
                            Else
                            {
                                Store (0x00, BAYE)
                            }
                        }

                        Method (_STA, 0, NotSerialized)
                        {
                            And (0x03, BAYS, BAYS)
                            Store (BAYS, Local0)
                            If (Or (LEqual (Local0, 0x03), LEqual (Local0, 0x00)))
                            {
                                Return (0x00)
                            }
                            Else
                            {
                                Return (0x0F)
                            }
                        }

                        Method (XEJ0, 1, NotSerialized)
                        {
                            If (Arg0)
                            {
                                \_SB.PHSR (0x0D, 0x01)
                                Sleep (0x012C)
                                Store (0x00, BAYR)
                                Sleep (0x01F4)
                                Store (0x01, BAYR)
                                Sleep (0x01F4)
                            }
                        }

                        Method (BAYF, 0, NotSerialized)
                        {
                            Store (\_SB.PCI0.PATA.PRID.BAY._STA (), Local0)
                            If (Local0)
                            {
                                Store (0x01, \_SB.PCI0.PATA.PRID.BAY.IDER)
                                Store (0xAA, P80H)
                            }
                            Else
                            {
                                Store (0x00, \_SB.PCI0.PATA.PRID.BAY.IDER)
                            }

                            Return (Local0)
                        }

                        Method (Z008, 0, NotSerialized)
                        {
                            If (\_SB.ECOK)
                            {
                                Acquire (\_SB.PCI0.LPCB.EC0.MUT1, 0xFFFF)
                                Store (\_SB.PCI0.LPCB.EC0.BAYE, Local1)
                                Store (\_SB.PCI0.LPCB.EC0.BAYI, Local2)
                                Store (0x01, \_SB.PCI0.LPCB.EC0.BAYE)
                                Release (\_SB.PCI0.LPCB.EC0.MUT1)
                            }

                            If (Local1)
                            {
                                If (Local2)
                                {
                                    Store (\_SB.PCI0.PATA.PRID.BAY._STA (), Local0)
                                    If (Local0)
                                    {
                                        If (LEqual (BAYE, 0x00))
                                        {
                                            If (LEqual (\_SB.PHSR (0x0D, 0x02), 0x00))
                                            {
                                                \_SB.PHSR (0x0D, 0x01)
                                                Store (0x00, BAYR)
                                                Sleep (0x012C)
                                            }

                                            Store (0x01, BAYE)
                                        }

                                        If (\_SB.PHSR (0x0D, 0x02))
                                        {
                                            \_SB.PHSR (0x0D, 0x00)
                                            Sleep (0x012C)
                                            Store (0x00, BAYR)
                                            Sleep (0x01F4)
                                            Store (0x01, BAYR)
                                            Sleep (0x0BB8)
                                            Store (0x8B, P80H)
                                            If (LEqual (\_SB.PCI0.PATA.PRID.BAY.IDER, 0x00))
                                            {
                                                \_SB.PHSR (0x04, 0x00)
                                                Store (0x01, \_SB.PCI0.PATA.PRID.BAY.IDER)
                                            }

                                            Notify (\_SB.PCI0.PATA.PRID.BAY, 0x00)
                                        }
                                    }
                                }
                                Else
                                {
                                    Store (0x88, P80H)
                                    Store (0x00, BAYE)
                                    If (LEqual (\_SB.PHSR (0x0D, 0x02), 0x00))
                                    {
                                        Store (0x89, P80H)
                                        Notify (\_SB.PCI0.PATA.PRID.BAY, 0x03)
                                        Sleep (0x01F4)
                                    }
                                }
                            }
                        }

                        Method (_GTF, 0, NotSerialized)
                        {
                            Name (PIB1, Buffer (0x0E)
                            {
                                0x03, 0x00, 0x00, 0x00, 0x00, 0xB0, 0xEF, 0x03, 
                                0x00, 0x00, 0x00, 0x00, 0xB0, 0xEF
                            })
                            CreateByteField (PIB1, 0x01, PMD1)
                            CreateByteField (PIB1, 0x08, DMD1)
                            If (And (PRIT, 0x20))
                            {
                                If (LEqual (And (PRIT, 0x90), 0x80))
                                {
                                    Store (0x08, PMD1)
                                }
                                Else
                                {
                                    Add (And (PSIT, 0x03), ShiftRight (And (PSIT, 0x0C), 0x02), Local0)
                                    If (LEqual (0x05, Local0))
                                    {
                                        Store (0x0C, PMD1)
                                    }
                                    Else
                                    {
                                        If (LEqual (0x03, Local0))
                                        {
                                            Store (0x0B, PMD1)
                                        }
                                        Else
                                        {
                                            Store (0x0A, PMD1)
                                        }
                                    }
                                }
                            }
                            Else
                            {
                                Store (0x01, PMD1)
                            }

                            If (And (SYNC, 0x02))
                            {
                                Store (Or (SDT1, 0x40), DMD1)
                                If (And (ICR1, 0x02))
                                {
                                    If (And (ICR0, 0x02))
                                    {
                                        Add (DMD1, 0x02, DMD1)
                                    }

                                    If (And (ICR3, 0x02))
                                    {
                                        Store (0x45, DMD1)
                                    }
                                }
                            }
                            Else
                            {
                                Or (Subtract (And (PMD1, 0x07), 0x02), 0x20, DMD1)
                            }

                            Return (PIB1)
                        }
                    }
                }
            }

            Device (SATA)
            {
                Name (_ADR, 0x001F0002)
                OperationRegion (SACS, PCI_Config, 0x40, 0xC0)
                Field (SACS, DWordAcc, NoLock, Preserve)
                {
                    PRIT,   16, 
                    SECT,   16, 
                    PSIT,   4, 
                    SSIT,   4, 
                    Offset (0x08), 
                    SYNC,   4, 
                    Offset (0x0A), 
                    SDT0,   2, 
                        ,   2, 
                    SDT1,   2, 
                    Offset (0x0B), 
                    SDT2,   2, 
                        ,   2, 
                    SDT3,   2, 
                    Offset (0x14), 
                    ICR0,   4, 
                    ICR1,   4, 
                    ICR2,   4, 
                    ICR3,   4, 
                    ICR4,   4, 
                    ICR5,   4, 
                    Offset (0x50), 
                    MAPV,   2, 
                    Offset (0x52), 
                    PCSR,   8
                }
            }

            Device (SBUS)
            {
                Name (_ADR, 0x001F0003)
                OperationRegion (SMBP, PCI_Config, 0x40, 0xC0)
                Field (SMBP, DWordAcc, NoLock, Preserve)
                {
                        ,   2, 
                    I2CE,   1
                }

                OperationRegion (SMBI, SystemIO, 0x18E0, 0x10)
                Field (SMBI, ByteAcc, NoLock, Preserve)
                {
                    HSTS,   8, 
                    Offset (0x02), 
                    HCON,   8, 
                    HCOM,   8, 
                    TXSA,   8, 
                    DAT0,   8, 
                    DAT1,   8, 
                    HBDR,   8, 
                    PECR,   8, 
                    RXSA,   8, 
                    SDAT,   16
                }

                Method (SSXB, 2, Serialized)
                {
                    If (STRT ())
                    {
                        Return (0x00)
                    }

                    Store (0x00, I2CE)
                    Store (0xBF, HSTS)
                    Store (Arg0, TXSA)
                    Store (Arg1, HCOM)
                    Store (0x48, HCON)
                    If (COMP ())
                    {
                        Or (HSTS, 0xFF, HSTS)
                        Return (0x01)
                    }

                    Return (0x00)
                }

                Method (SRXB, 1, Serialized)
                {
                    If (STRT ())
                    {
                        Return (0xFFFF)
                    }

                    Store (0x00, I2CE)
                    Store (0xBF, HSTS)
                    Store (Or (Arg0, 0x01), TXSA)
                    Store (0x44, HCON)
                    If (COMP ())
                    {
                        Or (HSTS, 0xFF, HSTS)
                        Return (DAT0)
                    }

                    Return (0xFFFF)
                }

                Method (SWRB, 3, Serialized)
                {
                    If (STRT ())
                    {
                        Return (0x00)
                    }

                    Store (0x00, I2CE)
                    Store (0xBF, HSTS)
                    Store (Arg0, TXSA)
                    Store (Arg1, HCOM)
                    Store (Arg2, DAT0)
                    Store (0x48, HCON)
                    If (COMP ())
                    {
                        Or (HSTS, 0xFF, HSTS)
                        Return (0x01)
                    }

                    Return (0x00)
                }

                Method (SRDB, 2, Serialized)
                {
                    If (STRT ())
                    {
                        Return (0xFFFF)
                    }

                    Store (0x00, I2CE)
                    Store (0xBF, HSTS)
                    Store (Or (Arg0, 0x01), TXSA)
                    Store (Arg1, HCOM)
                    Store (0x48, HCON)
                    If (COMP ())
                    {
                        Or (HSTS, 0xFF, HSTS)
                        Return (DAT0)
                    }

                    Return (0xFFFF)
                }

                Method (SBLW, 4, Serialized)
                {
                    If (STRT ())
                    {
                        Return (0x00)
                    }

                    Store (Arg3, I2CE)
                    Store (0xBF, HSTS)
                    Store (Arg0, TXSA)
                    Store (Arg1, HCOM)
                    Store (SizeOf (Arg2), DAT0)
                    Store (0x00, Local1)
                    Store (DerefOf (Index (Arg2, 0x00)), HBDR)
                    Store (0x54, HCON)
                    While (LGreater (SizeOf (Arg2), Local1))
                    {
                        Store (0x0FA0, Local0)
                        While (LAnd (LNot (And (HSTS, 0x80)), Local0))
                        {
                            Decrement (Local0)
                            Stall (0x32)
                        }

                        If (LNot (Local0))
                        {
                            KILL ()
                            Return (0x00)
                        }

                        Store (0x80, HSTS)
                        Increment (Local1)
                        If (LGreater (SizeOf (Arg2), Local1))
                        {
                            Store (DerefOf (Index (Arg2, Local1)), HBDR)
                        }
                    }

                    If (COMP ())
                    {
                        Or (HSTS, 0xFF, HSTS)
                        Return (0x01)
                    }

                    Return (0x00)
                }

                Method (SBLR, 3, Serialized)
                {
                    Name (TBUF, Buffer (0x0100) {})
                    If (STRT ())
                    {
                        Return (0x00)
                    }

                    Store (Arg2, I2CE)
                    Store (0xBF, HSTS)
                    Store (Or (Arg0, 0x01), TXSA)
                    Store (Arg1, HCOM)
                    Store (0x54, HCON)
                    Store (0x0FA0, Local0)
                    While (LAnd (LNot (And (HSTS, 0x80)), Local0))
                    {
                        Decrement (Local0)
                        Stall (0x32)
                    }

                    If (LNot (Local0))
                    {
                        KILL ()
                        Return (0x00)
                    }

                    Store (DAT0, Index (TBUF, 0x00))
                    Store (0x80, HSTS)
                    Store (0x01, Local1)
                    While (LLess (Local1, DerefOf (Index (TBUF, 0x00))))
                    {
                        Store (0x0FA0, Local0)
                        While (LAnd (LNot (And (HSTS, 0x80)), Local0))
                        {
                            Decrement (Local0)
                            Stall (0x32)
                        }

                        If (LNot (Local0))
                        {
                            KILL ()
                            Return (0x00)
                        }

                        Store (HBDR, Index (TBUF, Local1))
                        Store (0x80, HSTS)
                        Increment (Local1)
                    }

                    If (COMP ())
                    {
                        Or (HSTS, 0xFF, HSTS)
                        Return (TBUF)
                    }

                    Return (0x00)
                }

                Method (STRT, 0, Serialized)
                {
                    Store (0xC8, Local0)
                    While (Local0)
                    {
                        If (And (HSTS, 0x40))
                        {
                            Decrement (Local0)
                            Sleep (0x01)
                            If (LEqual (Local0, 0x00))
                            {
                                Return (0x01)
                            }
                        }
                        Else
                        {
                            Store (0x00, Local0)
                        }
                    }

                    Store (0x0FA0, Local0)
                    While (Local0)
                    {
                        If (And (HSTS, 0x01))
                        {
                            Decrement (Local0)
                            Stall (0x32)
                            If (LEqual (Local0, 0x00))
                            {
                                KILL ()
                            }
                        }
                        Else
                        {
                            Return (0x00)
                        }
                    }

                    Return (0x01)
                }

                Method (COMP, 0, Serialized)
                {
                    Store (0x0FA0, Local0)
                    While (Local0)
                    {
                        If (And (HSTS, 0x02))
                        {
                            Return (0x01)
                        }
                        Else
                        {
                            Decrement (Local0)
                            Stall (0x32)
                            If (LEqual (Local0, 0x00))
                            {
                                KILL ()
                            }
                        }
                    }

                    Return (0x00)
                }

                Method (KILL, 0, Serialized)
                {
                    Or (HCON, 0x02, HCON)
                    Or (HSTS, 0xFF, HSTS)
                }
            }
        }

        OperationRegion (SMI0, SystemIO, 0x0000FE00, 0x00000002)
        Field (SMI0, AnyAcc, NoLock, Preserve)
        {
            SMIC,   8
        }

        OperationRegion (SMI1, SystemMemory, 0x3FE9AE2D, 0x00000120)
        Field (SMI1, AnyAcc, NoLock, Preserve)
        {
            BCMD,   8, 
            DID,    32, 
            INF,    8
        }

        Field (SMI1, AnyAcc, NoLock, Preserve)
        {
            Offset (0x110), 
            BTEN,   1, 
            WLAN,   1, 
            DOCK,   1, 
            Z00B,   1, 
            Z00C,   1, 
            COM0,   1
        }

        Mutex (PSMX, 0x00)
        Method (PHSR, 2, NotSerialized)
        {
            Acquire (\_SB.PSMX, 0xFFFF)
            Store (0x90, BCMD)
            Store (Arg0, DID)
            Store (Arg1, INF)
            Store (Zero, SMIC)
            Store (INF, Local0)
            Release (\_SB.PSMX)
            Return (Local0)
        }

        Device (ACAD)
        {
            Name (_HID, "ACPI0003")
            Name (_PCL, Package (0x01)
            {
                \_SB
            })
            Name (ACST, 0x00)
            Method (_PSR, 0, NotSerialized)
            {
                If (\_SB.ECOK)
                {
                    Acquire (\_SB.PCI0.LPCB.EC0.MUT1, 0xFFFF)
                    Store (\_SB.PCI0.LPCB.EC0.ACDF, ACST)
                    Release (\_SB.PCI0.LPCB.EC0.MUT1)
                }
                Else
                {
                    Store (0x01, ACST)
                }

                If (ACST)
                {
                    Store (0x01, Local0)
                    Store (0x00, \_SB.BAT1.BCRI)
                }
                Else
                {
                    Store (0x00, Local0)
                }

                Return (Local0)
            }
        }

        Device (BAT1)
        {
            Name (_HID, EisaId ("PNP0C0A"))
            Name (_UID, 0x01)
            Name (CBTI, 0x00)
            Name (PBTI, 0x00)
            Name (BTIN, 0x00)
            Name (BTCH, 0x00)
            Name (BIFI, 0x00)
            Name (SEL0, 0x00)
            Name (BCRI, 0x00)
            Name (PBIF, Package (0x0D)
            {
                0x01, 
                0x1130, 
                0x1130, 
                0x01, 
                0x2B5C, 
                0x012C, 
                0x84, 
                0x20, 
                0x20, 
                "BAT1      ", 
                "11        ", 
                "11        ", 
                "11        "
            })
            Name (PBST, Package (0x04)
            {
                0x00, 
                Z00D, 
                Z00D, 
                0x2710
            })
            Name (ERRC, 0x00)
            Name (_PCL, Package (0x01)
            {
                \_SB
            })
            Method (_STA, 0, NotSerialized)
            {
                If (BTIN)
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
                If (LEqual (BIFI, 0x00))
                {
                    \_SB.BAT1.UBIF ()
                    Store (0x01, BIFI)
                }

                Return (PBIF)
            }

            Name (LFCC, 0x1130)
            Method (UBIF, 0, NotSerialized)
            {
                If (\_SB.ECOK)
                {
                    Acquire (\_SB.PCI0.LPCB.EC0.MUT1, 0xFFFF)
                    Store (\_SB.PCI0.LPCB.EC0.BTDC, Local0)
                    Store (\_SB.PCI0.LPCB.EC0.LFCC, Local1)
                    Store (\_SB.PCI0.LPCB.EC0.BTDV, Local2)
                    Store (\_SB.PCI0.LPCB.EC0.BTMD, Local3)
                    Store (\_SB.PCI0.LPCB.EC0.BTMN, Local4)
                    Store (\_SB.PCI0.LPCB.EC0.BTSN, Local5)
                    Store (\_SB.PCI0.LPCB.EC0.LION, Local6)
                    Release (\_SB.PCI0.LPCB.EC0.MUT1)
                    Store (Local0, Index (PBIF, 0x01))
                    Store (Local1, Index (PBIF, 0x02))
                    Store (Local2, Index (PBIF, 0x04))
                    Store (Local1, LFCC)
                    Multiply (Local1, 0x04, Local7)
                    Divide (Local7, 0x64, , Local7)
                    Store (Local7, Index (PBIF, 0x06))
                    If (Local6)
                    {
                        Store ("NiMH", Index (PBIF, 0x0B))
                    }
                    Else
                    {
                        Store ("LION", Index (PBIF, 0x0B))
                    }

                    And (Local3, 0x0F, Local3)
                    If (LEqual (Local3, 0x01))
                    {
                        Store ("01ZE", Index (PBIF, 0x09))
                    }
                    Else
                    {
                        If (LEqual (Local3, 0x02))
                        {
                            Store ("02ZE", Index (PBIF, 0x09))
                        }
                        Else
                        {
                            If (LEqual (Local3, 0x03))
                            {
                                Store ("03ZE", Index (PBIF, 0x09))
                            }
                            Else
                            {
                                If (LEqual (Local3, 0x04))
                                {
                                    Store ("04ZE", Index (PBIF, 0x09))
                                }
                                Else
                                {
                                    If (LEqual (Local3, 0x05))
                                    {
                                        Store ("05ZE", Index (PBIF, 0x09))
                                    }
                                    Else
                                    {
                                        If (LEqual (Local3, 0x06))
                                        {
                                            Store ("06ZE", Index (PBIF, 0x09))
                                        }
                                        Else
                                        {
                                            If (LEqual (Local3, 0x08))
                                            {
                                                Store ("ZL08", Index (PBIF, 0x09))
                                            }
                                            Else
                                            {
                                                If (LEqual (Local3, 0x09))
                                                {
                                                    Store ("ZL09", Index (PBIF, 0x09))
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }

                    If (LEqual (Local4, 0x08))
                    {
                        Store ("MOTOROLA", Index (PBIF, 0x0C))
                    }
                    Else
                    {
                        If (LEqual (Local4, 0x06))
                        {
                            Store ("SIMPLO", Index (PBIF, 0x0C))
                        }
                        Else
                        {
                            If (LEqual (Local4, 0x05))
                            {
                                Store ("SANYO", Index (PBIF, 0x0C))
                            }
                            Else
                            {
                                If (LEqual (Local4, 0x04))
                                {
                                    Store ("SONY", Index (PBIF, 0x0C))
                                }
                                Else
                                {
                                    If (LEqual (Local4, 0x09))
                                    {
                                        Store ("PANASONIC", Index (PBIF, 0x0C))
                                    }
                                }
                            }
                        }
                    }

                    Store (ITOS (ToBCD (Local5)), Index (PBIF, 0x0A))
                }
            }

            Name (RCAP, 0x00)
            Method (_BST, 0, NotSerialized)
            {
                If (LEqual (BTIN, 0x00))
                {
                    Store (0x00, Index (PBST, 0x00))
                    Store (0xFFFFFFFF, Index (PBST, 0x01))
                    Store (0xFFFFFFFF, Index (PBST, 0x02))
                    Store (0xFFFFFFFF, Index (PBST, 0x03))
                    Return (PBST)
                }

                If (\_SB.ECOK)
                {
                    Acquire (\_SB.PCI0.LPCB.EC0.MUT1, 0xFFFF)
                    Store (\_SB.PCI0.LPCB.EC0.MBTC, Local0)
                    Store (\_SB.PCI0.LPCB.EC0.MBRM, Local1)
                    Store (\_SB.PCI0.LPCB.EC0.MBVG, Local2)
                    Store (\_SB.PCI0.LPCB.EC0.MCUR, Local3)
                    Store (\_SB.PCI0.LPCB.EC0.BTST, Local4)
                    Store (\_SB.PCI0.LPCB.EC0.MBTF, Local5)
                    Store (\_SB.PCI0.LPCB.EC0.ACDF, Local6)
                    Release (\_SB.PCI0.LPCB.EC0.MUT1)
                    If (Local6)
                    {
                        If (LEqual (Local5, 0x01))
                        {
                            Store (0x00, Local7)
                            Store (LFCC, Local1)
                        }
                        Else
                        {
                            If (LEqual (Local0, 0x01))
                            {
                                Store (0x02, Local7)
                            }
                            Else
                            {
                                Store (0x00, Local7)
                            }
                        }
                    }
                    Else
                    {
                        If (LAnd (Local4, 0x01))
                        {
                            Store (0x01, Local7)
                        }
                        Else
                        {
                            Store (0x00, Local7)
                        }
                    }

                    And (Local4, 0x04, Local4)
                    If (LEqual (Local4, 0x04))
                    {
                        Or (Local7, Local4, Local7)
                    }

                    Store (Local7, Index (PBST, 0x00))
                    If (LNot (And (Local1, 0x8000)))
                    {
                        Store (Local1, Index (PBST, 0x02))
                    }

                    If (LNot (And (Local2, 0x8000)))
                    {
                        Store (Local7, Index (PBST, 0x03))
                    }

                    If (LAnd (Local3, 0x8000))
                    {
                        If (LNot (LEqual (Local3, 0xFFFF)))
                        {
                            Not (Local3, Local3)
                            Increment (Local3)
                            And (Local3, 0xFFFF, Local3)
                        }
                    }

                    Store (Local3, Index (PBST, 0x01))
                }

                Return (PBST)
            }

            Method (Z007, 0, NotSerialized)
            {
                If (\_SB.ECOK)
                {
                    Acquire (\_SB.PCI0.LPCB.EC0.MUT1, 0xFFFF)
                    Store (\_SB.PCI0.LPCB.EC0.MBTS, Local0)
                    Release (\_SB.PCI0.LPCB.EC0.MUT1)
                    If (LEqual (Local0, 0x01))
                    {
                        If (LEqual (\_SB.BAT1.BTIN, 0x00))
                        {
                            Store (0x01, \_SB.BAT1.BTCH)
                            Store (0x00, \_SB.BAT1.BIFI)
                        }

                        Store (0x01, \_SB.BAT1.BTIN)
                    }
                    Else
                    {
                        If (LEqual (\_SB.BAT1.BTIN, 0x01))
                        {
                            Store (0x01, \_SB.BAT1.BTCH)
                            Store (0x00, \_SB.BAT1.BIFI)
                        }

                        Store (0x00, \_SB.BAT1.BTIN)
                    }
                }
            }
        }

        Device (BAT2)
        {
            Name (_HID, EisaId ("PNP0C0A"))
            Name (_UID, 0x02)
            Name (CBTI, 0x00)
            Name (PBTI, 0x00)
            Name (BTIN, 0x00)
            Name (BTCH, 0x00)
            Name (BIFI, 0x00)
            Name (SEL0, 0x00)
            Name (BCRI, 0x00)
            Name (PBIF, Package (0x0D)
            {
                0x01, 
                0x1130, 
                0x1130, 
                0x01, 
                0x2B5C, 
                0x012C, 
                0x84, 
                0x20, 
                0x20, 
                "BAT2      ", 
                "11        ", 
                "11        ", 
                "11        "
            })
            Name (PBST, Package (0x04)
            {
                0x00, 
                Z00D, 
                Z00D, 
                0x2710
            })
            Name (ERRC, 0x00)
            Name (_PCL, Package (0x01)
            {
                \_SB
            })
            Method (_STA, 0, NotSerialized)
            {
                If (BTIN)
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
                If (LEqual (BIFI, 0x00))
                {
                    \_SB.BAT2.UBIF ()
                    Store (0x01, BIFI)
                }

                Return (\_SB.BAT2.PBIF)
            }

            Name (LFCC, 0x1130)
            Method (UBIF, 0, NotSerialized)
            {
                If (\_SB.ECOK)
                {
                    Acquire (\_SB.PCI0.LPCB.EC0.MUT1, 0xFFFF)
                    Store (\_SB.PCI0.LPCB.EC0.ABDC, Local0)
                    Store (\_SB.PCI0.LPCB.EC0.AFCC, Local1)
                    Store (\_SB.PCI0.LPCB.EC0.ABDV, Local2)
                    Store (\_SB.PCI0.LPCB.EC0.ABMD, Local3)
                    Store (\_SB.PCI0.LPCB.EC0.ABMN, Local4)
                    Store (\_SB.PCI0.LPCB.EC0.ABSN, Local5)
                    Store (\_SB.PCI0.LPCB.EC0.ABTP, Local6)
                    Release (\_SB.PCI0.LPCB.EC0.MUT1)
                    Store (Local0, Index (PBIF, 0x01))
                    Store (Local1, Index (PBIF, 0x02))
                    Store (Local2, Index (PBIF, 0x04))
                    Store (Local1, LFCC)
                    Multiply (Local1, 0x04, Local7)
                    Divide (Local7, 0x64, , Local7)
                    Store (Local7, Index (PBIF, 0x06))
                    If (Local6)
                    {
                        Store ("NiMH", Index (PBIF, 0x0B))
                    }
                    Else
                    {
                        Store ("LION", Index (PBIF, 0x0B))
                    }

                    And (Local3, 0x0F, Local3)
                    If (LEqual (Local3, 0x04))
                    {
                        Store ("04ZE", Index (PBIF, 0x09))
                    }
                    Else
                    {
                        If (LEqual (Local3, 0x02))
                        {
                            Store ("ZL02", Index (PBIF, 0x09))
                        }
                        Else
                        {
                            If (LEqual (Local3, 0x03))
                            {
                                Store ("ZL03", Index (PBIF, 0x09))
                            }
                            Else
                            {
                                If (LEqual (Local3, 0x07))
                                {
                                    Store ("ZL07", Index (PBIF, 0x09))
                                }
                            }
                        }
                    }

                    If (LEqual (Local4, 0x08))
                    {
                        Store ("MOTOROLA", Index (PBIF, 0x0C))
                    }
                    Else
                    {
                        If (LEqual (Local4, 0x06))
                        {
                            Store ("SIMPLO", Index (PBIF, 0x0C))
                        }
                        Else
                        {
                            If (LEqual (Local4, 0x05))
                            {
                                Store ("SANYO", Index (PBIF, 0x0C))
                            }
                            Else
                            {
                                If (LEqual (Local4, 0x04))
                                {
                                    Store ("SONY", Index (PBIF, 0x0C))
                                }
                                Else
                                {
                                    If (LEqual (Local4, 0x09))
                                    {
                                        Store ("PANASONIC", Index (PBIF, 0x0C))
                                    }
                                }
                            }
                        }
                    }

                    Store (ITOS (ToBCD (Local5)), Index (PBIF, 0x0A))
                }
            }

            Name (RCAP, 0x00)
            Name (AUXB, 0x00)
            Method (_BST, 0, NotSerialized)
            {
                If (LEqual (BTIN, 0x00))
                {
                    Store (0x00, Index (PBST, 0x00))
                    Store (0xFFFFFFFF, Index (PBST, 0x01))
                    Store (0xFFFFFFFF, Index (PBST, 0x02))
                    Store (0xFFFFFFFF, Index (PBST, 0x03))
                    Return (PBST)
                }

                If (\_SB.ECOK)
                {
                    Acquire (\_SB.PCI0.LPCB.EC0.MUT1, 0xFFFF)
                    Store (\_SB.PCI0.LPCB.EC0.ABCG, Local0)
                    Store (\_SB.PCI0.LPCB.EC0.ABRM, Local1)
                    Store (\_SB.PCI0.LPCB.EC0.ABVG, Local2)
                    Store (\_SB.PCI0.LPCB.EC0.ABCR, Local3)
                    Store (\_SB.PCI0.LPCB.EC0.ABCT, Local4)
                    Store (\_SB.PCI0.LPCB.EC0.ABFC, Local5)
                    Store (\_SB.PCI0.LPCB.EC0.ACDF, Local6)
                    Store (\_SB.PCI0.LPCB.EC0.Z006, AUXB)
                    Release (\_SB.PCI0.LPCB.EC0.MUT1)
                    If (Local6)
                    {
                        If (LEqual (Local5, 0x01))
                        {
                            Store (0x00, Local7)
                            Store (LFCC, Local1)
                        }
                        Else
                        {
                            If (LEqual (Local0, 0x01))
                            {
                                Store (0x02, Local7)
                            }
                            Else
                            {
                                Store (0x00, Local7)
                            }
                        }
                    }
                    Else
                    {
                        If (AUXB)
                        {
                            Store (0x01, Local7)
                        }
                        Else
                        {
                            Store (0x00, Local7)
                        }

                        If (LEqual (Local4, 0x01))
                        {
                            And (0xFE, Local7)
                            Or (Local7, 0x04, Local7)
                        }
                    }

                    Store (Local7, Index (PBST, 0x00))
                    If (LNot (And (Local1, 0x8000)))
                    {
                        Store (Local1, Index (PBST, 0x02))
                    }

                    If (LNot (And (Local2, 0x8000)))
                    {
                        Store (Local7, Index (PBST, 0x03))
                    }

                    If (LAnd (Local3, 0x8000))
                    {
                        If (LNot (LEqual (Local3, 0xFFFF)))
                        {
                            Not (Local3, Local3)
                            Increment (Local3)
                            And (Local3, 0xFFFF, Local3)
                        }
                    }

                    Store (Local3, Index (PBST, 0x01))
                }

                Return (PBST)
            }

            Method (Z007, 0, NotSerialized)
            {
                If (\_SB.ECOK)
                {
                    Acquire (\_SB.PCI0.LPCB.EC0.MUT1, 0xFFFF)
                    Store (\_SB.PCI0.LPCB.EC0.ABTS, Local0)
                    Release (\_SB.PCI0.LPCB.EC0.MUT1)
                    If (LEqual (Local0, 0x01))
                    {
                        If (LEqual (\_SB.BAT2.BTIN, 0x00))
                        {
                            Store (0x01, \_SB.BAT2.BTCH)
                            Store (0x00, \_SB.BAT2.BIFI)
                        }

                        Store (0x01, \_SB.BAT2.BTIN)
                    }
                    Else
                    {
                        If (LEqual (\_SB.BAT2.BTIN, 0x01))
                        {
                            Store (0x01, \_SB.BAT2.BTCH)
                            Store (0x00, \_SB.BAT2.BIFI)
                        }

                        Store (0x00, \_SB.BAT2.BTIN)
                    }
                }
            }
        }

        Device (LID)
        {
            Name (_HID, EisaId ("PNP0C0D"))
            Method (_INI, 0, NotSerialized)
            {
                Store (0x01, LIDS)
            }

            Method (_LID, 0, NotSerialized)
            {
                Store (0x01, LIDS)
                If (LIDS)
                {
                    If (LIDP)
                    {
                        Store (0x00, Local0)
                    }
                    Else
                    {
                        Store (0x01, Local0)
                    }
                }
                Else
                {
                    Store (LIDP, Local0)
                }

                Return (Local0)
            }
        }

        Device (PWRB)
        {
            Name (_HID, EisaId ("PNP0C0C"))
        }

        Device (SLPB)
        {
            Name (_HID, EisaId ("PNP0C0E"))
        }

        Device (AMW0)
        {
            Name (_HID, "*pnp0c14")
            Name (_UID, 0x00)
            Name (_WDG, Buffer (0x3C)
            {
                0xA7, 0x1D, 0x85, 0x2E, 0x53, 0xD0, 0x5F, 0x49, 
                0x9D, 0xFA, 0x1A, 0x4A, 0xD6, 0x2E, 0x6A, 0x86, 
                0x41, 0x43, 0x01, 0x00, 0x3B, 0x6D, 0x43, 0x71, 
                0xDD, 0xFB, 0x72, 0x4C, 0xBC, 0xB8, 0x43, 0x5B, 
                0xFE, 0x0D, 0x64, 0xF9, 0x42, 0x43, 0x01, 0x00, 
                0x21, 0x12, 0x90, 0x05, 0x66, 0xD5, 0xD1, 0x11, 
                0xB2, 0xF0, 0x00, 0xA0, 0xC9, 0x06, 0x29, 0x10, 
                0x42, 0x41, 0x01, 0x00
            })
            Name (STAC, Buffer (0x04)
            {
                0x01, 0x32, 0x05, 0x00
            })
            Method (WQAC, 1, NotSerialized)
            {
                Store ("MXMTCConfigData", Debug)
                Return (STAC)
            }

            Name (STBC, Buffer (0x04)
            {
                0x01, 0x00, 0x00, 0x00
            })
            Method (WQBC, 1, NotSerialized)
            {
                Store ("Get MXMTCControlData: STBC = ", Debug)
                Store (STBC, Debug)
                Return (STBC)
            }

            Method (WSBC, 2, NotSerialized)
            {
                Store (Arg1, STBC)
                Store ("Set MXMTCControlData: STBC = ", Debug)
                Store (STBC, Debug)
                Store (DerefOf (Index (STBC, 0x01)), \_SB.PCI0.LPCB.EC0.VTMP)
            }

            Name (WQBA, Buffer (0x02AE)
            {
                0x46, 0x4F, 0x4D, 0x42, 0x01, 0x00, 0x00, 0x00, 
                0x9E, 0x02, 0x00, 0x00, 0xC0, 0x0B, 0x00, 0x00, 
                0x44, 0x53, 0x00, 0x01, 0x1A, 0x7D, 0xDA, 0x54, 
                0x28, 0xD9, 0x85, 0x00, 0x01, 0x06, 0x18, 0x42, 
                0x10, 0x07, 0x10, 0x0A, 0x4B, 0x61, 0x02, 0xC9, 
                0x21, 0x52, 0x3C, 0x18, 0x94, 0x05, 0x10, 0x43, 
                0x88, 0x57, 0x04, 0x44, 0x04, 0x84, 0xBC, 0x0A, 
                0xB0, 0x29, 0xC0, 0x24, 0x88, 0xFA, 0xF7, 0x87, 
                0x28, 0x09, 0x0E, 0x25, 0x04, 0x42, 0x12, 0x05, 
                0x98, 0x17, 0xA0, 0x5B, 0x80, 0x61, 0x01, 0xB6, 
                0x05, 0x98, 0x16, 0xE0, 0x18, 0x92, 0x4A, 0x03, 
                0xA7, 0x04, 0x96, 0x02, 0x21, 0xA1, 0x02, 0x94, 
                0x0B, 0xF0, 0x2D, 0x40, 0x3B, 0xA2, 0x24, 0x0B, 
                0xB0, 0x0C, 0x23, 0x02, 0x8F, 0x82, 0xA1, 0x71, 
                0x68, 0xEC, 0x30, 0x2C, 0x13, 0x4C, 0x83, 0x38, 
                0x8C, 0xB2, 0x91, 0x45, 0x60, 0xDC, 0x4E, 0x05, 
                0xC8, 0x15, 0x20, 0x4C, 0x80, 0x78, 0x54, 0x61, 
                0x34, 0x07, 0x45, 0xE0, 0x42, 0x63, 0x64, 0x40, 
                0xC8, 0xA3, 0x00, 0xAB, 0xA3, 0xD0, 0xA4, 0x12, 
                0xD8, 0xBD, 0x00, 0x65, 0x02, 0x2C, 0x0A, 0x10, 
                0x27, 0xC0, 0x9A, 0x00, 0x63, 0x48, 0x32, 0x28, 
                0x40, 0x9B, 0x00, 0x5B, 0x20, 0x42, 0x0F, 0xD4, 
                0x19, 0x8A, 0x46, 0x70, 0x02, 0x51, 0x6A, 0x46, 
                0x11, 0x48, 0xAC, 0x1A, 0x01, 0x85, 0x12, 0x34, 
                0x46, 0xB0, 0x10, 0x81, 0xC2, 0x86, 0x37, 0x46, 
                0x98, 0x03, 0x88, 0xD1, 0xFE, 0x20, 0x48, 0x20, 
                0x05, 0xE3, 0x66, 0x91, 0x46, 0x83, 0x1A, 0x6B, 
                0x82, 0x63, 0xF7, 0x68, 0x4E, 0xB8, 0x73, 0x01, 
                0xD2, 0xE7, 0x26, 0x90, 0xA3, 0x3B, 0xB8, 0x3A, 
                0x07, 0x4D, 0x86, 0xC7, 0xB0, 0x1E, 0x06, 0xD8, 
                0x29, 0x00, 0xEF, 0x1A, 0x50, 0xD3, 0x3F, 0x78, 
                0x26, 0x08, 0x0E, 0x35, 0x44, 0x8F, 0x3A, 0xDC, 
                0x09, 0x1C, 0xFB, 0x91, 0x30, 0x88, 0xB3, 0x3B, 
                0x6E, 0xAC, 0xC3, 0xC9, 0x68, 0xD0, 0xA5, 0x0A, 
                0x30, 0x7B, 0x00, 0xD0, 0xD0, 0x12, 0x9C, 0xF6, 
                0x99, 0x84, 0x7E, 0x0F, 0x38, 0x9F, 0x9E, 0x21, 
                0x89, 0xFC, 0x41, 0xA0, 0x46, 0xE6, 0xFF, 0x3F, 
                0xB4, 0xC7, 0x78, 0x5A, 0x31, 0x43, 0x3E, 0x0B, 
                0x1C, 0x16, 0x13, 0x0B, 0xA1, 0x4D, 0x6A, 0x3C, 
                0x40, 0x40, 0xE1, 0xD1, 0x40, 0x08, 0x6F, 0x06, 
                0x9E, 0xAF, 0x09, 0x46, 0x86, 0x90, 0x93, 0xF1, 
                0xA0, 0x06, 0xE0, 0x41, 0xD7, 0x3A, 0x32, 0x8D, 
                0x27, 0xA6, 0x21, 0xCF, 0xE8, 0x00, 0x22, 0xBF, 
                0x32, 0x78, 0x0C, 0x41, 0x02, 0xF9, 0xC4, 0x60, 
                0xB8, 0xC7, 0x81, 0x13, 0x78, 0x02, 0xF0, 0x59, 
                0x40, 0x10, 0x92, 0x00, 0x21, 0x51, 0xE3, 0xA7, 
                0x47, 0x08, 0x7E, 0x7A, 0x78, 0x93, 0x30, 0x28, 
                0x1F, 0xD2, 0x99, 0xF9, 0x90, 0xE1, 0x11, 0xC2, 
                0x07, 0xC4, 0x7B, 0x9F, 0x3B, 0x19, 0xC1, 0x29, 
                0x7B, 0xA4, 0xE0, 0xB0, 0x7E, 0x0E, 0x20, 0xC0, 
                0xAF, 0x0F, 0x8F, 0x0D, 0x09, 0x7C, 0xAE, 0x08, 
                0x8C, 0x1D, 0xAA, 0xFD, 0x0A, 0x40, 0x08, 0x1E, 
                0xED, 0x51, 0xE0, 0x54, 0x23, 0x1C, 0x2D, 0x78, 
                0x08, 0x8A, 0x1C, 0x03, 0x4A, 0xCC, 0x18, 0x50, 
                0x03, 0x38, 0x85, 0xD0, 0xE7, 0x73, 0x04, 0x47, 
                0x14, 0x25, 0xF6, 0x21, 0x19, 0xDA, 0x08, 0xE1, 
                0x1F, 0x39, 0x4E, 0xC1, 0xF7, 0x8B, 0x23, 0x3D, 
                0xAD, 0x23, 0x78, 0x91, 0xF0, 0x08, 0x30, 0xE1, 
                0xCE, 0x28, 0xA8, 0x38, 0x30, 0xF4, 0xFF, 0x7F, 
                0x4C, 0x01, 0xDC, 0x7A, 0x3B, 0xA6, 0x80, 0x3E, 
                0xC0, 0x31, 0x05, 0x50, 0xFC, 0xFF, 0x3F, 0xA6, 
                0x00, 0x87, 0xA8, 0xC7, 0x14, 0xF4, 0x40, 0x0C, 
                0x7C, 0x2E, 0xA1, 0x0D, 0xFF, 0x96, 0xC1, 0x8E, 
                0x03, 0x87, 0x74, 0x6A, 0x8F, 0x28, 0x80, 0x29, 
                0x79, 0x47, 0x14, 0x50, 0x8C, 0x14, 0xD6, 0xF1, 
                0x04, 0x18, 0x05, 0x3C, 0x9B, 0xA0, 0x22, 0x1D, 
                0x4F, 0x80, 0xCE, 0xFF, 0xFF, 0x78, 0x02, 0x58, 
                0xB8, 0x9A, 0xBC, 0x92, 0x84, 0x7D, 0x1E, 0x78, 
                0x1D, 0x89, 0x14, 0xE3, 0x41, 0xE2, 0xB5, 0xE4, 
                0xC1, 0x24, 0x46, 0x98, 0x08, 0x8F, 0x27, 0x1E, 
                0x47, 0xC0, 0xB7, 0x82, 0x28, 0x91, 0x8E, 0x3E, 
                0xC4, 0x83, 0x49, 0x28, 0x63, 0x3E, 0xA3, 0x84, 
                0x89, 0xF9, 0x04, 0x70, 0x22, 0xEF, 0x27, 0x46, 
                0x0A, 0x73, 0x2A, 0x8F, 0x27, 0x2C, 0xC4, 0xF1, 
                0x04, 0xA0, 0x85, 0xE2, 0xE3, 0x09, 0x3A, 0x2C, 
                0x84, 0xFE, 0xFF, 0xC7, 0x13, 0xDC, 0xE1, 0xC1, 
                0xA7, 0x0C, 0xFC, 0x85, 0x0C, 0xC6, 0xF9, 0x04, 
                0x30, 0x24, 0xF0, 0x7C, 0x02, 0xCA, 0xDB, 0x18, 
                0xE6, 0x80, 0x02, 0x8C, 0x14, 0xDA, 0xF4, 0xA9, 
                0xD1, 0xA8, 0x55, 0x83, 0x32, 0x35, 0xCA, 0x34, 
                0xA8, 0xD5, 0xA7, 0x52, 0x63, 0xC6, 0x4C, 0x9C, 
                0x52, 0xBC, 0x6C, 0x8D, 0xDF, 0xF2, 0x9E, 0x09, 
                0x02, 0xB1, 0x20, 0x0A, 0x81, 0x38, 0xCC, 0xF3, 
                0x42, 0x20, 0x96, 0xA2, 0x01, 0x84, 0x85, 0x06, 
                0xA1, 0x42, 0xA9, 0x05, 0xE2, 0x98, 0x20, 0x34, 
                0x92, 0x0A, 0x10, 0xF6, 0xFF, 0x07
            })
        }

        Scope (\_TZ)
        {
            ThermalZone (THRM)
            {
                Method (_TMP, 0, NotSerialized)
                {
                    If (\_SB.ECOK)
                    {
                        Acquire (\_SB.PCI0.LPCB.EC0.MUT1, 0xFFFF)
                        Store (\_SB.PCI0.LPCB.EC0.CTMP, Local0)
                        Release (\_SB.PCI0.LPCB.EC0.MUT1)
                        Return (Add (Multiply (Local0, 0x0A), 0x0AAC))
                    }
                    Else
                    {
                        Return (0x0C3C)
                    }
                }

                Method (_PSV, 0, NotSerialized)
                {
                    Return (Add (Multiply (0x5A, 0x0A), 0x0AAC))
                }

                Name (_PSL, Package (0x01)
                {
                    \_PR.CPU0
                })
                Name (_TSP, 0x28)
                Name (_TC1, 0x02)
                Name (_TC2, 0x03)
                Method (_CRT, 0, NotSerialized)
                {
                    Return (Add (Multiply (0x62, 0x0A), 0x0AAC))
                }
            }
        }
    }

    Name (FWSO, "FWSO")
}

                                                                          dsdt_acer_c204_tabletpc/DSDT_ALVISO.dat                                                             0000755 0061405 0000062 00000074302 10347662426 017674  0                                                                                                    ustar   fkh                             vrgrp                           0000000 0000000                                                                                                                                                                        DSDT¬x  ûINTEL ALVISO    MSFT  [ÄPRT0
Ä
[ÅPRT0P80H [ÄIO_T 
[Å!IO_T    TRP0       [ÄPMIO 
<[Å.PMIO @ HOTS BAYS  LIDSZ000  HOTP[ÄGPIOÄ
<[ÅNGPIOGU00GU01GU02GU03GIO0GIO1GIO2GIO3  GL00GL01BAYO GP21 BAYR GP25  @GB00GB01GB02GB03 @GIV0 LIDPZ001 GIV2GIV3GU04GU05GU06GU07GIO4GIO5GIO6GIO7 GP33 GL05GL06GL07[ÄMNVS ,≠Ë? [ÅHMNVSOSYSSMIFPRM0PRM1SCIFPRM2PRM3   P80D      @ @APICCPULCPUHGV3EHTTEWTHT   @IGDSTLSTCADLPADLCSTENSTESSTENDIDDID1 DID2 DID3 DID4 DID5  @  ( @D400 HGTF08GTF28IDEM[ÄRCRB  Ä  @[ÅCRCRB Ä  Ä  ÄHPAS HPAE H	 PATDSATDSMBDAZADA97D 
RP1DRP2DRP3DRP4D[MUTX _S0_
 
 
 _S3_


 _S4_


 _S5_


  \_PR_[ÉCPU0   [ÉCPU1  \DSEN
 \ECON
 \GPIC
 \CTYP
 \L01C
 \INSX
 \IS34
 \PPMF   Ä
\_PICphGPICI_PTSp
 P80DP8XH
 h†Kìh
p
INS4[#\/_SB_PCI0LPCBEC0_MUT1ˇˇp
\/_SB_PCI0LPCBEC0_FLS4['\/_SB_PCI0LPCBEC0_MUT1†B	\._SB_ECOK[#\/_SB_PCI0LPCBEC0_MUT1ˇˇ†5ì\/_SB_PCI0PCIBLANCLANP
 p
 \/_SB_PCI0LPCBEC0_VAUX°p
\/_SB_PCI0LPCBEC0_VAUX['\/_SB_PCI0LPCBEC0_MUT1\._SB_PHSR

 p
 HOTPO_WAKP8XH
 
 p
 IS34p\/_SB_PCI0PATAPRIDBAY_BAYF`†9ì`
 \._SB_PHSR

p
 BAYRÜ\/_SB_PCI0PATAPRIDBAY_
["Ù†ìh
\._SB_PHSR
 
 p
INSX†ìh
p
 INS4p
INSX\._SB_PHSR

†@ëìh
ìh
p
IS34p\._SB_BTEN\/_SB_PCI0LPCBEC0_BLTHp\._SB_WLAN\/_SB_PCI0LPCBEC0_WLANp
\/_SB_PCI0LPCBEC0_CPLE†/Z001†)ì\/_SB_PCI0DOCKDCKS
 Z001
Z001p
 Z001°+†)ì\/_SB_PCI0DOCKDCKS
Z001
Z001p
Z001§
 
 E>\_GPEJ_L01 rL01C
L01CP8XH
 
P8XH
L01C["
d†H\/_SB_PCI0RP01HPCS†<\/_SB_PCI0RP01PDC1p
\/_SB_PCI0RP01PDC1Ü\/_SB_PCI0RP01
 p
\/_SB_PCI0RP01HPCS†H\/_SB_PCI0RP02HPCS†<\/_SB_PCI0RP02PDC2p
\/_SB_PCI0RP02PDC2Ü\/_SB_PCI0RP02
 p
\/_SB_PCI0RP02HPCS†F\/_SB_PCI0RP03HPCS†*\/_SB_PCI0RP03PDC3p
\/_SB_PCI0RP03PDC3p
\/_SB_PCI0RP03HPCS†H\/_SB_PCI0RP04HPCS†<\/_SB_PCI0RP04PDC4p
\/_SB_PCI0RP04PDC4Ü\/_SB_PCI0RP04
 p
\/_SB_PCI0RP04HPCS_L03 Ü\/_SB_PCI0USB1
_L04 Ü\/_SB_PCI0USB2
 _L05 †AZAD°Ü\/_SB_PCI0AZAL
G_L09 †C\/_SB_PCI0RP01PSP1p
\/_SB_PCI0RP01PSP1p
\/_SB_PCI0RP01PMCSÜ\/_SB_PCI0RP01
†C\/_SB_PCI0RP02PSP2p
\/_SB_PCI0RP02PSP2p
\/_SB_PCI0RP02PMCSÜ\/_SB_PCI0RP02
†C\/_SB_PCI0RP03PSP3p
\/_SB_PCI0RP03PSP3p
\/_SB_PCI0RP03PMCSÜ\/_SB_PCI0RP03
†C\/_SB_PCI0RP04PSP4p
\/_SB_PCI0RP04PSP4p
\/_SB_PCI0RP04PMCSÜ\/_SB_PCI0RP04
_L0B Ü\/_SB_PCI0PCIB
_L0C Ü\/_SB_PCI0USB3
_L0D Ü\/_SB_PCI0USB7
_L0E Ü\/_SB_PCI0USB4
_L1B Ü\._SB_LID_
ÄGETBwh
`wi
a[j`aTBF3§TBF3BHKDS	†Hì
 DSENphSMIFp
 TRP0†AìSMIF
 †EíìCADLPADLpCADLPADL†ìOSYS—Ü\._SB_PCI0
 °Ü\/_SB_PCI0GFX0
 ["ÓÜ\/_SB_PCI0GFX0
Ä†1ì
DSENpuhSMIFp
 TRP0†ìSMIF
 Ü\/_SB_PCI0GFX0
Å2LSDS	†hHKDS
°HKDS
†íìDSEN
["
2¢ìDSEN
["
2@P8XH
†ìh
 p}{P80D ˇˇˇ i P80D†ìh
p}{P80Dˇ ˇˇ yi
  P80D†ìh
p}{P80Dˇˇ ˇ yi
  P80D†ìh
p}{P80Dˇˇˇ  yi
  P80DpP80DP80HAPNOT†9HTTE†ì{PDC0

 

Ü\._PR_CPU0
Ä†ì{PDC1

 

Ü\._PR_CPU1
Ä°Ü\._PR_CPU0
Ä["
dÜ\._PR_CPU0
ÅVTOBp
`y`h`§`BTOVzh
`p
 a¢	`uaz`
`§a'MKWD†
{i
Ä p  ˇˇ`°p `}`h`}`yi
 `§`.POSW†#{h Ä †ìhˇˇ§ˇˇˇˇ°Äh`u`{`ˇˇ`§`°§hGBFEåhiTIDXpTIDXjPBFEåhiTIDXpjTIDXFITOSp
	0        `p
0123456789ABCDEF gp
ap
 bp
 c¢*ava{zhya
  
d†dpˇc†cGBFEgdqePBFE`beub§`FGETP	†ì{h
	 
 §ˇˇˇˇ†
ì{h
	 
§Ñz{h  
`z{h 0 
a§w
t
	r`a   0GDMA
†#h†êil§
†êjl§wt
k 
 §wt
k 
 §ˇˇˇˇGETT	§w
t
	r{zh
 
 {h
    FGETFTMPF
 †
h}TMPF
TMPF†{j
 }TMPF
TMPF†
i}TMPF
TMPF†{j
  }TMPF
TMPF†{j @ }TMPF
TMPF§TMPF>SETP†îh
§
°.†({i
 †êíîh
x{j
 §#†êíîh
¥{j
 §!§;SDMA	†	íîh
§
†	íîh
§
†	íîh
-§
†	íîh
<§
†	íîh
Z§
§
 0SETT†&{i
 †êíîh
x{j
 §
†êíîh
¥{j
 §
	§
[ÄNV1_
r
[ÅNV1_INDXDATA[ÜINDXDATA @7INS4 DLSTDSNBÇû\_SB_ECOK
 [ÇâdPCI0F_INI †[_OSI`p—OSYS†HTTE°:†ëìá_OS_
ìá_OS_
p–OSYS°†ìá_OS_
'pœOSYS°	pŒOSYS†íîOSYSœp
ECON\/_SB_PCI0PATAPRIDBAY_BAYF	_S3D §
	_S4D §
_HIDA–
_CIDA–
_ADR
 _BBN
 [ÄHBUS
@
¿[ÅAHBUS @
 PEGA N PM0H PM1L PM1H PM2L PM2H PM3L PM3H PM4L PM4H PM5L PM5H PM6L PM6H  HENA   TOUDBUF0KÊà      ˇ     á         ˜      ¯   G¯¯á      
  ˇø       ≥   á        
 ˇˇ         á         ˇ?      @   á       @ ˇ      @   á       Ä ˇø      @   á       ¿ ˇˇ      @   á        
 ˇ?
      @   á       @
 ˇ
      @   á       Ä
 ˇø
      @   á       ¿
 ˇˇ
      @   á         ˇ?      @   á       @ ˇ      @   á       Ä ˇø      @   á       ¿ ˇˇ      @   á         ˇˇ         á          ˇˇø˛         y N-_CRS†PM1LäBUF0
ÄC0LNp C0LN†ìPM1L
çBUF0xC0RWp C0RW†PM1HäBUF0
õC4LNp C4LN†ìPM1H
çBUF0PC4RWp C4RW†PM2LäBUF0
∂C8LNp C8LN†ìPM2L
çBUF0(C8RWp C8RW†PM2HäBUF0
—CCLNp CCLN†ìPM2H
çBUF0 CCRWp CCRW†PM3LäBUF0
ÏD0LNp D0LN†ìPM3L
çBUF0ÿD0RWp D0RW†PM3HäBUF0D4LNp D4LN†ìPM3H
çBUF0∞D4RWp D4RW†PM4LäBUF0"D8LNp D8LN†ìPM4L
çBUF0àD8RWp D8RW†PM4HäBUF0=DCLNp DCLN†ìPM4H
çBUF0`	DCRWp DCRW†PM5LäBUF0XE0LNp E0LN†ìPM5L
çBUF08
E0RWp E0RW†PM5HäBUF0sE4LNp E4LN†ìPM5H
çBUF0E4RWp E4RW†PM6LäBUF0éE8LNp E8LN†ìPM6L
çBUF0ËE8RWp E8RW†PM6HäBUF0©ECLNp ECLN†ìPM6H
çBUF0¿ECRWp ECRW†PM0HäBUF0ƒF0LNp F0LN†ìPM0H
çBUF0ò
F0RWp F0RWäBUF0”M1MNäBUF0◊M1MXäBUF0ﬂM1LNyTOUD
M1MNrtM1MXM1MN 
M1LN§BUF0[ÇKPDRC_HIDA–_UID
_CRSN
JÜ	    ‡   Ü	     @  Ü	  @    Ü	  P    Ü	  Ä  @  Ü	   “˛   y H1_PRT †IGPIC§A
ˇˇ 
 
 

ˇˇ 
 
 

ˇˇ 
 
 

ˇˇ 
 
 

ˇˇ 
 
 

ˇˇ 

 

ˇˇ 

 

ˇˇ 

 

ˇˇ 
 
 

ˇˇ 

 

ˇˇ 

 

ˇˇ 

 

ˇˇ 
 
 

ˇˇ 

 

ˇˇ 
 
 

ˇˇ 

 

ˇˇ 

 
°F!§B!ˇˇ 
 \/_SB_PCI0LPCBLNKA
 ˇˇ 
 \/_SB_PCI0LPCBLNKA
 ˇˇ 
 \/_SB_PCI0LPCBLNKA
 ˇˇ 
 \/_SB_PCI0LPCBLNKA
 ˇˇ 
 \/_SB_PCI0LPCBLNKB
 ˇˇ 
\/_SB_PCI0LPCBLNKA
 ˇˇ 
\/_SB_PCI0LPCBLNKC
 ˇˇ 
\/_SB_PCI0LPCBLNKD
 ˇˇ 
 \/_SB_PCI0LPCBLNKH
 ˇˇ 
\/_SB_PCI0LPCBLNKD
 ˇˇ 
\/_SB_PCI0LPCBLNKC
 ˇˇ 
\/_SB_PCI0LPCBLNKA
 ˇˇ 
 \/_SB_PCI0LPCBLNKB
 ˇˇ 
\/_SB_PCI0LPCBLNKE
 ˇˇ 
 \/_SB_PCI0LPCBLNKC
 ˇˇ 
\/_SB_PCI0LPCBLNKD
 ˇˇ 
\/_SB_PCI0LPCBLNKA
 [ÇKEPEGP_ADR   _STA †PEGA§
°§
 M_PRT †9GPIC§2ˇˇ
 
 
ˇˇ

 
ˇˇ

 
ˇˇ

 
°K§Gˇˇ
 \/_SB_PCI0LPCBLNKA
 ˇˇ
\/_SB_PCI0LPCBLNKB
 ˇˇ
\/_SB_PCI0LPCBLNKC
 ˇˇ
\/_SB_PCI0LPCBLNKD
 [ÇF7VGA__ADR
 SWIT
CRTA
 LCDA
TV0A
 DVIA
 TOGF
 LSTF
 DISD
WDAS
	_STA §
_PSC
 
_PS0 p
 _PSC
_PS3 p
_PSC_DOSp{h
 SWIT_DOD §      [ÇNCRT__ADR _DCS †CRTA§
°§
_DGS †CRTA§
°§
 _DSSp
CRT --_DSS [1[ÇNDVI__ADR_DCS †DVIA§
°§
_DGS †DVIA§
°§
 _DSSp
DVI --_DSS [1[ÇMTV0__ADR _DCS †TV0A§
°§
_DGS †TV0A§
°§
 _DSSp
TV --_DSS [1[ÇDLCD__ADR_DCS †LCDA§
°§
_DGS pLCDA`†LCDA§
°§
 _DSSp
LCD --_DSS [1KSWIH p\._SB_PHSR

 bp{b
 WDASp{zb
 
 DISDGETD†OìWDAS
uTOGF†îTOGF
p
TOGFpTOGFa†!ìa
p
LCDAp
 CRTAp
 TV0Ap
 DVIA°H†!ìa
p
LCDAp
CRTAp
 TV0Ap
 DVIA°#†!ìa
p
 LCDAp
CRTAp
 TV0Ap
 DVIA°M†$ìWDAS
p
LCDAp
 CRTAp
 TV0Ap
 DVIA°E†$ìWDAS
p
 LCDAp
CRTAp
 TV0Ap
 DVIA°p
LCDAp
CRTAp
TV0Ap
DVIAÜVGA_
Ä§
 KGETD pDISD`†=íîWDAS
†ì`
p
TOGF†ì`
p
TOGF†ì`
p
TOGF†ì`
 p
 TOGF[ÇKNGFX0_ADR   _STA †PEGA§
 °§
[ÄVNVS ,ÆË?   [ÅVNVSVBF1Ä @VBF2Ä @_DOSp{h
 DSENF_DOD †.ìNDID
TMP1ˇˇˇˇp}   DID1 àTMP1
  §TMP1†HìNDID
TMP2ˇˇˇˇˇˇˇˇp}   DID1 àTMP2
  p}   DID2 àTMP2
 §TMP2†AìNDID
TMP3ˇˇˇˇˇˇˇˇˇˇˇˇp}   DID1 àTMP3
  p}   DID2 àTMP3
 p}   DID3 àTMP3
 §TMP3†JìNDID
TMP4ˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇp}   DID1 àTMP4
  p}   DID2 àTMP4
 p}   DID3 àTMP4
 p}   DID4 àTMP4
 §TMP4TMP5ˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇp}   DID1 àTMP5
  p}   DID2 àTMP5
 p}   DID3 àTMP5
 p}   DID4 àTMP5
 p}   DID5 àTMP5
 §TMP5M_ROM†íïh Ä§GETBth Ä iVBF2†2îrhi  Ät Äh`ti`apGETBh`VBF1cpGETB
 aVBF2dscde§e§GETBhiVBF1[ÇCDD01_ADR§{ˇˇDID1 $_DCS p
SMIFp
 TRP0†{CSTE
 §
§
_DGS †{NSTE
 §
§
 _DSS†ì{h   ¿    ¿pNSTECSTE[ÇCDD02_ADR§{ˇˇDID2 $_DCS p
SMIFp
 TRP0†{CSTE
 §
§
_DGS †{NSTE
 §
§
 _DSS†ì{h   ¿    ¿pNSTECSTE[ÇCDD03_ADR§{ˇˇDID3 $_DCS p
SMIFp
 TRP0†{CSTE
 §
§
_DGS †{NSTE
 §
§
 _DSS†ì{h   ¿    ¿pNSTECSTE[ÇCDD04_ADR§{ˇˇDID4 $_DCS p
SMIFp
 TRP0†{CSTE
 §
§
_DGS †{NSTE
 §
§
 _DSS†ì{h   ¿    ¿pNSTECSTE[ÇCDD05_ADR§{ˇˇDID5 $_DCS p
SMIFp
 TRP0†{CSTE
 §
§
_DGS †{NSTE
 §
§
 _DSS†ì{h   ¿    ¿pNSTECSTE[ÇAZAL_ADR   _PRW

[ÇERP01_ADR   [ÄP1CS
@ [Å4P1CS@ @
ABP1 PDC1 PDS1 ) PSP1 O< HPCSPMCS[ÇPXS1_ADR
 	_RMV §
_PRW
	
N_PRT †:\GPIC§2ˇˇ
 
 
ˇˇ

 
ˇˇ

 
ˇˇ

 
°K§Gˇˇ
 \/_SB_PCI0LPCBLNKA
 ˇˇ
\/_SB_PCI0LPCBLNKB
 ˇˇ
\/_SB_PCI0LPCBLNKC
 ˇˇ
\/_SB_PCI0LPCBLNKD
 [ÇERP02_ADR  [ÄP2CS
@ [Å4P2CS@ @
ABP2 PDC2 PDS2 ) PSP2 O< HPCSPMCS[ÇPXS2_ADR
 	_RMV §
_PRW
	
N_PRT †:\GPIC§2ˇˇ
 
 
ˇˇ

 
ˇˇ

 
ˇˇ

 
°K§Gˇˇ
 \/_SB_PCI0LPCBLNKB
 ˇˇ
\/_SB_PCI0LPCBLNKC
 ˇˇ
\/_SB_PCI0LPCBLNKD
 ˇˇ
\/_SB_PCI0LPCBLNKA
 [ÇAMRP03_ADR  [ÄP3CS
@ [ÅKP3CS@ @ LDP3 KABP3 PDC3 PDS3 ) PSP3 G< Z002Z003 HPCSPMCSE\._SB_PCI0[ÇG
DOCK_HIDA–_UID
_BDN
EZ4  DCKS
 '_DCK†ìh
§
°p
\/_SB_PCI0RP03LDP3#_EJ0p
\/_SB_PCI0RP03LDP3p
HOTS1_STA †ì\/_SB_PCI0RP03LDP3
§
 °†DCKS§
°§
 [ÇE+PXHA_ADR
 _EJD
_SB.PCI0.DOCK M_INI †-ì\/_SB_PCI0RP03PDS3
p
\/_SB_PCI0DOCKDCKS°-p
 \/_SB_PCI0DOCKDCKSp
\/_SB_PCI0RP03LDP3†IíïOSYS—pCFGD\PPMF†%ì\/_SB_PCI0DOCKDCKS
{CFGD?ˇˇˇCFGD°p\PPMFCFGDÜ\._PR_CPU0
Å[",_PSC
 
_PS0 p
 _PSC
_PS3 p
_PSCH	_PRT §O

ˇˇ 
 
 

ˇˇ 

 

ˇˇ 

 

ˇˇ 
 
 

ˇˇ 

 

ˇˇ 

 

ˇˇ 
 
 

ˇˇ 
 
 

ˇˇ 
 
 

ˇˇ 

 
[ÇLPXHI_ADR   _PSC
 6_PS0 †(êì\INSX
ìOSYS–\._SB_PHSR
	
 p
 \INSXp
 _PSC
_PS3 p
_PSC[ÇLPXHC_ADR   _PSC
 6_PS0 †(êì\INSX
ìOSYS–\._SB_PHSR
	
 p
 \INSXp
 _PSC
_PS3 p
_PSC[ÇLPXHM_ADR   _PSC
 6_PS0 †(êì\INSX
ìOSYS–\._SB_PHSR
	
 p
 \INSXp
 _PSC
_PS3 p
_PSCJ\_GPEB_L1C [",p
Z000pZ000a†H
ìa
pZ001`†G`p\PPMFCFGDÜ\._PR_CPU0
Å[",p
 \/_SB_PCI0DOCKDCKSÜ\/_SB_PCI0DOCK
°H{CFGD?ˇˇˇCFGDÜ\._PR_CPU0
Å[",p
 \/_SB_PCI0RP03LDP3p
\/_SB_PCI0DOCKDCKS["Ù\._SB_PHSR

 ["ÙÜ\/_SB_PCI0DOCK
 Z001
Z001[ÇMRP04_ADR  [ÄP4CS
@ [Å4P4CS@ @
ABP4 PDC4 PDS4 ) PSP4 O< HPCSPMCS_PRW
	
N_PRT †:\GPIC§2ˇˇ
 
 
ˇˇ

 
ˇˇ

 
ˇˇ

 
°K§Gˇˇ
 \/_SB_PCI0LPCBLNKD
 ˇˇ
\/_SB_PCI0LPCBLNKA
 ˇˇ
\/_SB_PCI0LPCBLNKB
 ˇˇ
\/_SB_PCI0LPCBLNKC
 [ÇBUSB1_ADR   [ÄU1CS
ƒ
[ÅU1CSU1EN_PRW

_PSW†	hp
U1EN°p
 U1EN	_S3D §
	_S4D §
[ÇBUSB2_ADR  [ÄU2CS
ƒ
[ÅU2CSU2EN_PRW

_PSW†	hp
U2EN°p
 U2EN	_S3D §
	_S4D §
[ÇBUSB3_ADR  [ÄU2CS
ƒ
[ÅU2CSU3EN_PRW

_PSW†	hp
U3EN°p
 U3EN	_S3D §
	_S4D §
[Ç;USB4_ADR  [ÄU4CS
ƒ
[ÅU4CSU4EN	_S3D §
	_S4D §
[ÇUSB7_ADR  _PRW

[ÇD4PCIB_ADR   B/_PRT †OGPIC§G
ˇˇ	 
 
 

ˇˇ	 

 

ˇˇ	 

 

ˇˇ 
 
 

ˇˇ 
 
 

ˇˇ 

 
°J(§F(ˇˇ
 \/_SB_PCI0LPCBLNKF
 ˇˇ
\/_SB_PCI0LPCBLNKG
 ˇˇ
\/_SB_PCI0LPCBLNKH
 ˇˇ
\/_SB_PCI0LPCBLNKE
 ˇˇ 
 \/_SB_PCI0LPCBLNKG
 ˇˇ 
\/_SB_PCI0LPCBLNKF
 ˇˇ 
\/_SB_PCI0LPCBLNKE
 ˇˇ 
\/_SB_PCI0LPCBLNKH
 ˇˇ 
 \/_SB_PCI0LPCBLNKC
 ˇˇ 
\/_SB_PCI0LPCBLNKD
 ˇˇ 
\/_SB_PCI0LPCBLNKB
 ˇˇ 
\/_SB_PCI0LPCBLNKA
 ˇˇ 
 \/_SB_PCI0LPCBLNKD
 ˇˇ 
\/_SB_PCI0LPCBLNKC
 ˇˇ 
\/_SB_PCI0LPCBLNKF
 ˇˇ 
\/_SB_PCI0LPCBLNKG
 ˇˇ 
 \/_SB_PCI0LPCBLNKB
 ˇˇ 
\/_SB_PCI0LPCBLNKE
 ˇˇ 
\/_SB_PCI0LPCBLNKG
 ˇˇ 
\/_SB_PCI0LPCBLNKF
 ˇˇ 
 \/_SB_PCI0LPCBLNKE
 [Ç?LANC_ADR   _PRW

LANP
 _PSW†ìh
 p
 LANP°p
LANP[ÇÜîLPCB_ADR   [ÄLPC0
@
¿[ÅJLPC0  @PARCPBRCPCRCPDRC  PERCPFRCPGRCPHRC @
IOD0IOD1Z004Z005LPTE M C4C3[ÇE
LNKA_HIDA–_UID

_DISp
ÄPARC_PRS	
#˙‘y :_CRSRTLA	
#  y ãRTLA
IRQ0p IRQ0y
{PARC
 IRQ0§RTLA_SRS	ãh
IRQ0ÇIRQ0`v`p`PARC_STA†{PARC
Ä §
	°§
[ÇE
LNKB_HIDA–_UID

_DISp
ÄPBRC_PRS	
#˙ÿy :_CRSRTLB	
#  y ãRTLB
IRQ0p IRQ0y
{PBRC
 IRQ0§RTLB_SRS	ãh
IRQ0ÇIRQ0`v`p`PBRC_STA†{PBRC
Ä §
	°§
[ÇE
LNKC_HIDA–_UID

_DISp
ÄPCRC_PRS	
#˙‘y :_CRSRTLC	
#  y ãRTLC
IRQ0p IRQ0y
{PCRC
 IRQ0§RTLC_SRS	ãh
IRQ0ÇIRQ0`v`p`PCRC_STA†{PCRC
Ä §
	°§
[ÇE
LNKD_HIDA–_UID

_DISp
ÄPDRC_PRS	
#˙ÿy :_CRSRTLD	
#  y ãRTLD
IRQ0p IRQ0y
{PDRC
 IRQ0§RTLD_SRS	ãh
IRQ0ÇIRQ0`v`p`PDRC_STA†{PDRC
Ä §
	°§
[ÇE
LNKE_HIDA–_UID

_DISp
ÄPERC_PRS	
#˙‘y :_CRSRTLE	
#  y ãRTLE
IRQ0p IRQ0y
{PERC
 IRQ0§RTLE_SRS	ãh
IRQ0ÇIRQ0`v`p`PERC_STA†{PERC
Ä §
	°§
[ÇE
LNKF_HIDA–_UID

_DISp
ÄPFRC_PRS	
#˙ÿy :_CRSRTLF	
#  y ãRTLF
IRQ0p IRQ0y
{PFRC
 IRQ0§RTLF_SRS	ãh
IRQ0ÇIRQ0`v`p`PFRC_STA†{PFRC
Ä §
	°§
[ÇE
LNKG_HIDA–_UID

_DISp
ÄPGRC_PRS	
#˙‘y :_CRSRTLG	
#  y ãRTLG
IRQ0p IRQ0y
{PGRC
 IRQ0§RTLG_SRS	ãh
IRQ0ÇIRQ0`v`p`PGRC_STA†{PGRC
Ä §
	°§
[ÇE
LNKH_HIDA–_UID

_DISp
ÄPHRC_PRS	
#˙ÿy :_CRSRTLH	
#  y ãRTLH
IRQ0p IRQ0y
{PHRC
 IRQ0§RTLH_SRS	ãh
IRQ0ÇIRQ0`v`p`PHRC_STA†{PHRC
Ä §
	°§
[ÇCóEC0__HIDA–	_CRS
Gb b Gf f y _GPE
SEL0
BFLG
 F_REG†ìh
pi`†	`p
ECOK°p
 ECOK†B
\._SB_ECOKp
 DSNB[#\/_SB_PCI0LPCBEC0_MUT1ˇˇp
\/_SB_PCI0LPCBEC0_RG59p\._SB_BTEN\/_SB_PCI0LPCBEC0_BLTHp\._SB_WLAN\/_SB_PCI0LPCBEC0_WLANp
\/_SB_PCI0LPCBEC0_CPLEp\._SB_PHSR

 DOFF['\/_SB_PCI0LPCBEC0_MUT1[ÄERAM
 
ˇ[ÅA,ERAM  CMCMCMD1CMD2CMD3 @SMPRSMSTSMADSMCMSMD0@BCNTSMAABATDACDF  FPR1FLS4S5LWPFLG TMSS BANK VFAN RL01RD01RF01RP01RB01RC01 R701R801RM01RI01   RA01RR01RL10RD10RF10RP10RB10RC10 R710R810RM10RI10   RA10RR10LIDEBAYEPRDEWP01WB01WC01 W701W801WM01WI01   WA01WR01LIDSBAYIPRCTWP10WB10WC10 W710W810WM10WI10   WA10WR10 (DOFF RG57CTMPRG59RG5ARG5BFSPDVTMPWLANBLTHCPLE 
BRLV  VGAF HMBTSMBTF MBTC LION $BA1C HABTSABFC ABBLZ006ABCTABCG ABTP $BA2C ACUR @BYPS GMCURMBRMMBVGBTSTABCRABRMABVG EBPL PWRE  VAUX DBPL LFCCBTSNBTDCBTDVBTMNBTMDAFCCABSNABDCABDVABMNABMDTRDV[ÅERAM @SMW0[ÅERAM @SMB0[ÅERAM @FLD0@[ÅERAM @FLD1@[ÅERAM @FLD2@[ÅERAM @FLD3@[MUT1 [MUT0 ASMRD†ì\._SB_ECOK
 §
ˇ†íìh
†íìh
	†	íìh
§
[#MUT0ˇˇp
`¢Mî`
{SMST
@SMSTpjSMCMpiSMADphSMPRp
 c¢7í{SMST
øa["
uc†&ìc
2{SMST
@SMSTpjSMCMpiSMADphSMPRp
 c†	ìa
Äp
 `°v`†	`p{a
 `°C	†ìh
pSMB0k†ìh
	pSMW0k†Hìh
pBCNTcz 
b†îcbpbc†ïc
	pFLD0b°#†ïc
pFLD1b°†ïc
pFLD2b°pFLD3bucpcdvcp e¢îceGBFEbeqfPBFEdefuePBFEde
 pdk['MUT0§`ASMWR†ì\._SB_ECOK
 §
ˇ†íìh
†íìh
†	íìh

§
[#MUT0ˇˇp
`¢A	î`
†ìh
pkSMB0†ìh
pkSMW0†ìh

pkSMD0{SMST
@SMSTpjSMCMpiSMADphSMPRp
 c¢7í{SMST
øa["
uc†&ìc
2{SMST
@SMSTpjSMCMpiSMADphSMPRp
 c†	ìa
Äp
 `°v`†	`p{a
 `['MUT0§`APOLphDBPLp
EBPLPSTA
 +CPOL†$ìPSTA
 †íì\._SB_ECOK
 APOLhp
PSTAB_Q20 †J\._SB_ECOK[#\/_SB_PCI0LPCBEC0_MUT1ˇˇ†I{SMST
@ pSMAA`†-ì`
{SMST
øSMSTpPWREa†ap
 PWREp
BFLGCPOL
†Dì`
{SMST
øSMSTp
\/_SB_BAT1BCRIÜ\._SB_BAT1
Ä["Ùp
\/_SB_BAT2BCRIÜ\._SB_BAT2
Ä°%p
 \/_SB_BAT1BCRIp
 \/_SB_BAT2BCRI['\/_SB_PCI0LPCBEC0_MUT1K_Q09 †C\._SB_ECOKp
 \/_SB_PCI0LPCBEC0_PSTA\/_SB_BAT1Z007\/_SB_BAT2Z007Ü\._SB_ACAD
Ä["ÙÜ\._SB_BAT1
Ä["ÙÜ\._SB_BAT2
Ä†>\/_SB_BAT1BTCH\/_SB_BAT1UBIFÜ\._SB_BAT1
Åp
 \/_SB_BAT1BTCH†>\/_SB_BAT2BTCH\/_SB_BAT2UBIFÜ\._SB_BAT2
Åp
 \/_SB_BAT2BTCH(_Q8A p
äP80H\/_SB_PCI0PATAPRIDBAY_Z008_Q0D Ü\._SB_SLPB
Ä=_Q0E †'\/_SB_PCI0PEGA\/_SB_PCI0PEGPVGA_SWIH°p
TLSTHKDS

_Q0F [Ç=DMAC_HIDA– _CRS(
%G     GÅ Å Gì ì 
G¿ ¿  *y [ÇN
HPET_HIDA–BUF0
" " Ü	    –˛   y (_STA †íïOSYS—†HPAE§
°
†HPAE§
§
 G_CRS†JHPAEäBUF0

HPT0†ìHPAS
p –˛HPT0†ìHPAS
p  –˛HPT0†ìHPAS
p 0–˛HPT0§BUF0[ÇE
IPIC_HIDA–_CRSA	
çG    G$ $ G( ( G, , G0 0 G4 4 G8 8 G< < G† † G§ § G® ® G¨ ¨ G∞ ∞ G¥ ¥ G∏ ∏ Gº º G––" y [Ç%MATH_HIDA–_CRS

G  "  y [ÇO
LDRC_HIDA–_UID
BUF1F
ÇG. . GN N Ga a Gc c Ge e Gg g Gh o Gp p GÄ Ä Gí í G≤ ≤ GÄÄÄG  G  ÄGÄÄ@G  Äy _CRS§BUF1[Ç@RTC__HIDA– BUF0

Gp p y BUF1

Gp p " y _CRS†
HPAE§BUF0§BUF1[Ç@TIMR_HIDA– BUF0
G@ @ GP P y BUF1
G@ @ GP P " y _CRS†
HPAE§BUF0§BUF1[ÇÜiSIO__HIDA–
[ÄSIIO
N
[ÅSIIOINDXDATA[N393 [ÜBINDXDATA 8LDN_ @ LPTEZ009Z00A LACTR OIOAHIOAL @INTR DMCH H=OPT1ENFG[#N393ˇˇp
INDXphDATAEXFG ['N393[ÇN3FIR__HID:c`D_STA †4\._SB_COM0ENFG
†ìZ009
 †	ACTRp
`°p

`°p
 `EXFG°p
 `§`@_DIS ENFG
†(ACTRp
 ACTRp
 INTRp
 IOAHp
 IOALp
 DMCHEXFGp
 \/_SB_PCI0LPCBZ005_PRSK
∑0G¯¯" * 0G¯¯" * 0G¯¯" * 0G¯¯" * 0G¯¯" * 0G¯¯" * 0G¯¯" * 0G¯¯" * 0G¯¯" * 0G¯¯" * 0G¯¯" * 0G¯¯" * 8y G_CRS DCRS
G    " * y ENFG
†LACTRpIOAHapIOAL`p`àDCRS
 p`àDCRS
 paàDCRS
 paàDCRS
 y
INTR`p`àDCRS
	 z`
apaàDCRS

 y
DMCH`p`àDCRS
 z`
apaàDCRS

 °Jp
 àDCRS
 p
 àDCRS
 p
 àDCRS
 p
 àDCRS
 p
 àDCRS
	 p
 àDCRS

 p
 àDCRS
 p
 àDCRS

 EXFG§DCRSN_SRSåh
ADRLåh
ADRMãh
	IRQMãh
DMAMÇIRQM`v`ÇDMAMava{IOD0
b†!ìADRM
†ìADRL
¯pbIOD0°	}b
pIOD0°†ìADRL
¯}b
IOD0°	}b
PIOD0p
\/_SB_PCI0LPCBZ005ENFG
p`INTRpaDMCHpADRMIOAHpADRLIOALp
ACTR}
ÄOPT1OPT1EXFG[ÇB)COMA_HID\#N_STA ENFG
†ìZ00A
 †	ACTRp
`°p

`°p
 `EXFG†ì`
 p
 \/_SB_PCI0LPCBZ004§`I_DIS ENFG
†!ACTRp
 ACTRp
 INTRp
 IOAHp
 IOALEXFGp
 \/_SB_PCI0LPCBZ004_PRSG
c0G¯¯" 0G¯¯" 0GËË" 0GËË" 0G¯¯" 0G¯¯" 0GËË" 0GËË" 8y M_CRS DCRS

G¯¯" y ENFG
†KACTRpIOAHapIOAL`p`àDCRS
 p`àDCRS
 paàDCRS
 paàDCRS
 y
INTR`p`àDCRS
	 z`
apaàDCRS

 °Dp
 àDCRS
 p
 àDCRS
 p
 àDCRS
 p
 àDCRS
 p
 àDCRS
	 p
 àDCRS

 EXFG§DCRSM
_SRSåh
ADRLåh
ADRMãh
	IRQMÇIRQM`v`{IOD0
a†!ìADRM
†ìADRL
¯paIOD0°	}a
IOD0°†ìADRL
¯}a
IOD0°	}a
IOD0p
\/_SB_PCI0LPCBZ004ENFG
p`INTRpADRMIOAHpADRLIOALp
ACTREXFG[ÇG%COMB_HIDA–D_STA †\._SB_COM0p
 `°*ENFG
†ìZ009
 †	ACTRp
`°p

`°p
 `EXFG§`I_DIS ENFG
†!ACTRp
 ACTRp
 INTRp
 IOAHp
 IOALEXFGp
 \/_SB_PCI0LPCBZ005_PRS6
30G¯¯" 0G¯¯" 0G¯¯" 0G¯¯" 8y M_CRS DCRS

G¯¯" y ENFG
†KACTRpIOAHapIOAL`p`àDCRS
 p`àDCRS
 paàDCRS
 paàDCRS
 y
INTR`p`àDCRS
	 z`
apaàDCRS

 °Dp
 àDCRS
 p
 àDCRS
 p
 àDCRS
 p
 àDCRS
 p
 àDCRS
	 p
 àDCRS

 EXFG§DCRSM
_SRSåh
ADRLåh
ADRMãh
	IRQMÇIRQM`v`{IOD0
a†!ìADRM
†ìADRL
¯paIOD0°	}a
pIOD0°†ìADRL
¯}a
IOD0°	}a
PIOD0p
\/_SB_PCI0LPCBZ005ENFG
p`INTRpADRMIOAHpADRLIOALp
ACTREXFG[ÇF<ECP__HIDA–_UID
L_STA ENFG
pOPT1`pLPTEbpACTRcEXFGz`
`†+êìb
 ëì`
ì`
†\._SB_DOCKyc
ar

aa°p
 a°p
 a§aO_DIS ENFG
pOPT1`z`
`†BêìLPTE
 ëì`
ì`
†(ACTRp
 ACTRp
 INTRp
 IOAHp
 IOALp
 DMCHp
 \/_SB_PCI0LPCBLPTEEXFG_PRSO
ª0GxxGxx"Ä * 0GxxGxx"  * 0GxxGxx"  * 0GxxGxx"Ä * 0GxxGxx"Ä * 0GxxGxx"  * 0GxxGxx"  * 0GxxGxx"Ä * 8y H_CRS DCRS
G    G    "Ä * y ENFG
†I
ACTRpIOAHapIOAL`p`àDCRS
 p`àDCRS

 p`àDCRS
 p`àDCRS
 paàDCRS
 paàDCRS
 ra
apaàDCRS
 paàDCRS

 y
INTR`p`àDCRS
 z`
apaàDCRS
 y
DMCH`p`àDCRS
 z`
apaàDCRS
 °Fp
 àDCRS
 p
 àDCRS

 p
 àDCRS
 p
 àDCRS
 p
 àDCRS
 p
 àDCRS
 p
 àDCRS
 p
 àDCRS

 p
 àDCRS
 p
 àDCRS
 p
 àDCRS
 p
 àDCRS
 EXFG§DCRSC_SRSåh
ADRLåh
ADRMãh
IRQMãh
DMAMÇIRQM`v`ÇDMAMavap
 \/_SB_PCI0LPCBLPTE{IOD1
b†ìADRM
pbIOD1°	}b
IOD1p
\/_SB_PCI0LPCBLPTEENFG
p`INTRpaDMCHpADRMIOAHpADRLIOALp
ACTREXFG[ÇG0EPP__HIDA– _UID
L_STA ENFG
pOPT1`pLPTEbpACTRcEXFGz`
`†+êìb
 ëì`
ì`
†\._SB_DOCKyc
ar

aa°p
 a°p
 a§aH_DIS ENFG
pOPT1`z`
`†KêìLPTE
 ëì`
ì`
†!ACTRp
 ACTRp
 INTRp
 IOAHp
 IOALp
 \/_SB_PCI0LPCBLPTEEXFG_PRSG
S0GxxGxx"Ä 0GxxGxx"  0GxxGxx"  0GxxGxx"Ä 8y N_CRS DCRS
G    G    "Ä y ENFG
†HACTRpIOAHapIOAL`p`àDCRS
 p`àDCRS

 p`àDCRS
 p`àDCRS
 paàDCRS
 paàDCRS
 ra
apaàDCRS
 paàDCRS

 y
INTR`p`àDCRS
 z`
apaàDCRS
 °@p
 àDCRS
 p
 àDCRS

 p
 àDCRS
 p
 àDCRS
 p
 àDCRS
 p
 àDCRS
 p
 àDCRS
 p
 àDCRS

 p
 àDCRS
 p
 àDCRS
 EXFG§DCRSM	_SRSåh
ADRLåh
ADRMãh
IRQMÇIRQM`v`p
 \/_SB_PCI0LPCBLPTE{IOD1
b†ìADRM
pbIOD1°	}b
IOD1p
\/_SB_PCI0LPCBLPTEENFG
p`INTRpADRMIOAHpADRLIOALp
ACTREXFG[ÇA7LPTB_HIDA– _UID
G_STA ENFG
pOPT1`pLPTEbpACTRcEXFGz`
`†&êìb
 ì`
†\._SB_DOCKyc
ar

aa°p
 a°p
 a§aC_DIS ENFG
pOPT1`z`
`†FêìLPTE
 ì`
†!ACTRp
 ACTRp
 INTRp
 IOAHp
 IOALp
 \/_SB_PCI0LPCBLPTEEXFG_PRSO
{0GxxGxx"Ä 0GxxGxx"  0GxxGxx"  0GxxGxx"Ä 0GººGºº"Ä 0GººGºº"  8y G_CRS DCRS
G    G    "Ä y ENFG
†AACTRpIOAHapIOAL`p`àDCRS
 p`àDCRS

 p`àDCRS
 p`àDCRS
 paàDCRS
 paàDCRS
 ra
apaàDCRS
 paàDCRS

 †
{`
 p
`°p
`p`àDCRS
 p`àDCRS
 p`àDCRS
 p`àDCRS
 y
INTR`p`àDCRS
 z`
apaàDCRS
 °@p
 àDCRS
 p
 àDCRS

 p
 àDCRS
 p
 àDCRS
 p
 àDCRS
 p
 àDCRS
 p
 àDCRS
 p
 àDCRS

 p
 àDCRS
 p
 àDCRS
 EXFG§DCRS@_SRSåh
ADRLåh
ADRMãh
IRQMÇIRQM`v`p
 \/_SB_PCI0LPCBLPTE{IOD1
b†!ìADRM
†ìADRL
º}b
IOD1°pbIOD1°	}b
IOD1p
\/_SB_PCI0LPCBLPTEENFG
p`INTRpADRMIOAHpADRLIOALp
ACTREXFG[ÇA7LPT__HIDA– _UID
 G_STA ENFG
pOPT1`pLPTEbpACTRcEXFGz`
`†&êìb
 ì`
 †\._SB_DOCKyc
ar

aa°p
 a°p
 a§aC_DIS ENFG
pOPT1`z`
`†FêìLPTE
 ì`
 †!ACTRp
 ACTRp
 INTRp
 IOAHp
 IOALp
 \/_SB_PCI0LPCBLPTEEXFG_PRSO
{0GxxGxx"Ä 0GxxGxx"  0GxxGxx"  0GxxGxx"Ä 0GººGºº"Ä 0GººGºº"  8y G_CRS DCRS
G    G    "Ä y ENFG
†AACTRpIOAHapIOAL`p`àDCRS
 p`àDCRS

 p`àDCRS
 p`àDCRS
 paàDCRS
 paàDCRS
 ra
apaàDCRS
 paàDCRS

 †
{`
 p
`°p
`p`àDCRS
 p`àDCRS
 p`àDCRS
 p`àDCRS
 y
INTR`p`àDCRS
 z`
apaàDCRS
 °@p
 àDCRS
 p
 àDCRS

 p
 àDCRS
 p
 àDCRS
 p
 àDCRS
 p
 àDCRS
 p
 àDCRS
 p
 àDCRS

 p
 àDCRS
 p
 àDCRS
 EXFG§DCRS@_SRSåh
ADRLåh
ADRMãh
IRQMÇIRQM`v`p
 \/_SB_PCI0LPCBLPTE{IOD1
b†!ìADRM
†ìADRL
º}b
IOD1°pbIOD1°	}b
IOD1p
\/_SB_PCI0LPCBLPTEENFG
p`INTRpADRMIOAHpADRLIOALp
ACTREXFG[Ç.PS2K_HIDA–_CRS
G` ` Gd d # y [Ç5PS2M_HIDO._CIDO. O. A–_CRS	
# y [ÇOÜPATA_ADR  [ÄPACS
@
¿[ÅIPACSPRIT PSIT SYNC SDT0 SDT1 JICR0ICR1ICR2ICR3ICR4ICR5[ÇGÄPRID_ADR
 _GTM §
x      x         J+_STMäh
 PIO0äh
DMA0äh
PIO1äh
DMA1äh
FLAG†Gìái {PRIT@PRIT{SYNC
SYNCp
 SDT0{ICR0
ICR0{ICR1
ICR1{ICR3
ICR3{ICR5
ICR5ãi
bW490ãi
jW530ãi
~W630ãi
ÄW640ãi
∞W880ãi
∫W930}PRITÄPRIT†ê{FLAG
 {W490  }PRIT
PRIT}PRITSETPPIO0W530W640PRIT†@{FLAG
 }SYNC
SYNCpSDMADMA0SDT0†ïDMA0
}ICR3
ICR3†ïDMA0
<}ICR0
ICR0†{W930   }ICR1
ICR1†Bìáj {PRIT?PRITp
 PSIT{SYNC
SYNCp
 SDT1{ICR0
ICR0{ICR1
ICR1{ICR3
ICR3{ICR5
ICR5ãj
bW491ãj
jW531ãj
~W631ãj
ÄW641ãj
∞W881ãj
∫W931}PRIT@ÄPRIT†ê{FLAG
 {W491  }PRIT
 PRIT†L{FLAG
 }PRIT @PRIT†îPIO1
}PRIT
ÄPRIT°!}PRIT
PRITpSETTPIO1W531W641PSIT†@{FLAG
 }SYNC
SYNCpSDMADMA1SDT1†ïDMA1
}ICR3
ICR3†ïDMA1
<}ICR0
ICR0†{W931   }ICR1
ICR1[ÇNP_D0_ADR
 @_GTF PIB0
    †Ô    †ÔåPIB0
PMD0åPIB0
DMD0†@{PRIT
 †ì{PRIT
	 
p
PMD0°Ap

PMD0z{PRIT  
`z{PRIT 0 
ar`ab†ì
bp
PMD0†ì
bp
PMD0°p
PMD0†G{SYNC
 p}SDT0
@ DMD0†/{ICR1
 †{ICR0
 rDMD0
DMD0†{ICR3
 p
EDMD0°}t{PMD0
 
 
 DMD0§PIB0[ÇM@BAY__ADR
IDER
 BAYE
 6_INI p\/_SB_PCI0PATAPRIDBAY__STA`†	`p
BAYE°p
 BAYE+_STA {
BAYSBAYSpBAYS`†}ì`
ì`
  §
 °§
4XEJ0†-h\._SB_PHSR

[",p
 BAYR["Ùp
BAYR["ÙNBAYF p\/_SB_PCI0PATAPRIDBAY__STA`†'`p
\/_SB_PCI0PATAPRIDBAY_IDERp
™P80H°p
 \/_SB_PCI0PATAPRIDBAY_IDER§`NZ008 †L\._SB_ECOK[#\/_SB_PCI0LPCBEC0_MUT1ˇˇp\/_SB_PCI0LPCBEC0_BAYEap\/_SB_PCI0LPCBEC0_BAYIbp
\/_SB_PCI0LPCBEC0_BAYE['\/_SB_PCI0LPCBEC0_MUT1†Ia†Kbp\/_SB_PCI0PATAPRIDBAY__STA`†J`†<ìBAYE
 †,ì\._SB_PHSR


 \._SB_PHSR

p
 BAYR[",p
BAYE†I
\._SB_PHSR

\._SB_PHSR

 [",p
 BAYR["Ùp
BAYR["∏p
ãP80H†Lì\/_SB_PCI0PATAPRIDBAY_IDER
 \._SB_PHSR

 p
\/_SB_PCI0PATAPRIDBAY_IDERÜ\/_SB_PCI0PATAPRIDBAY_
 °Ip
àP80Hp
 BAYE†8ì\._SB_PHSR


 p
âP80HÜ\/_SB_PCI0PATAPRIDBAY_
["ÙK_GTF PIB1
    ∞Ô    ∞ÔåPIB1
PMD1åPIB1
DMD1†K{PRIT
  †ì{PRIT
ê 
Äp
PMD1°<r{PSIT
 z{PSIT
 
 `†ì
`p
PMD1°†ì
`p
PMD1°p

PMD1°p
PMD1†G{SYNC
 p}SDT1
@ DMD1†/{ICR1
 †{ICR0
 rDMD1
DMD1†{ICR3
 p
EDMD1°}t{PMD1
 
 
 DMD1§PIB1[ÇKSATA_ADR  [ÄSACS
@
¿[ÅNSACSPRITSECTPSITSSIT SYNC SDT0 SDT1 SDT2 SDT3 BICR0ICR1ICR2ICR3ICR4ICR5 HMAPV PCSR[ÇF<SBUS_ADR  [ÄSMBP
@
¿[Å
SMBP I2CE[ÄSMBI‡
[Å:SMBIHSTS HCONHCOMTXSADAT0DAT1HBDRPECRRXSASDATHSSXB
†STRT§
 p
 I2CEp
øHSTSphTXSApiHCOMp
HHCON†COMP}HSTS
ˇHSTS§
§
 JSRXB	†	STRT§ˇˇp
 I2CEp
øHSTSp}h
 TXSAp
DHCON†COMP}HSTS
ˇHSTS§DAT0§ˇˇNSWRB†STRT§
 p
 I2CEp
øHSTSphTXSApiHCOMpjDAT0p
HHCON†COMP}HSTS
ˇHSTS§
§
 @SRDB
†	STRT§ˇˇp
 I2CEp
øHSTSp}h
 TXSApiHCOMp
HHCON†COMP}HSTS
ˇHSTS§DAT0§ˇˇ@
SBLW†STRT§
 pkI2CEp
øHSTSphTXSApiHCOMpájDAT0p
 apÉàj
  HBDRp
THCON¢Bîájap†`¢êí{HSTS
Ä `v`[!
2†
í`KILL§
 p
ÄHSTSua†îájapÉàja HBDR†COMP}HSTS
ˇHSTS§
§
 H
SBLRTBUF †STRT§
 pjI2CEp
øHSTSp}h
 TXSApiHCOMp
THCONp†`¢êí{HSTS
Ä `v`[!
2†
í`KILL§
 pDAT0àTBUF
  p
ÄHSTSp
a¢EïaÉàTBUF
  p†`¢êí{HSTS
Ä `v`[!
2†
í`KILL§
 pHBDRàTBUFa p
ÄHSTSua†COMP}HSTS
ˇHSTS§TBUF§
 GSTRTp
»`¢!`†{HSTS
@ v`["
†ì`
 §
°p
 `p†`¢!`†{HSTS
 v`[!
2†	ì`
 KILL°§
 §
0COMPp†`¢!`†{HSTS
 §
°v`[!
2†	ì`
 KILL§
 KILL}HCON
HCON}HSTS
ˇHSTS[ÄSMI0 ˛     [ÅSMI0 SMIC[ÄSMI1 -ÆÈ?   [ÅSMI1 BCMDDID_ INF_[Å'SMI1  @àBTENWLANDOCKZ00BZ00CCOM0[PSMX BPHSR[#\._SB_PSMXˇˇp
êBCMDphDID_piINF_p SMICpINF_`['\._SB_PSMX§`[ÇKACAD_HID
ACPI0003 _PCL\_SB_ACST
 A	_PSR †L\._SB_ECOK[#\/_SB_PCI0LPCBEC0_MUT1ˇˇp\/_SB_PCI0LPCBEC0_ACDFACST['\/_SB_PCI0LPCBEC0_MUT1°p
ACST†ACSTp
`p
 \/_SB_BAT1BCRI°p
 `§`[ÇNhBAT1_HIDA–
_UID
CBTI
 PBTI
 BTIN
 BTCH
 BIFI
 SEL0
 BCRI
 PBIFI
00
\+,
Ñ
 
 
BAT1       
11         
11         
11         PBST
 Z00DZ00D'ERRC
 _PCL\_SB__STA †BTIN§
°§
*_BIF †ìBIFI
 \/_SB_BAT1UBIFp
BIFI§PBIFLFCC0C*UBIF †K)\._SB_ECOK[#\/_SB_PCI0LPCBEC0_MUT1ˇˇp\/_SB_PCI0LPCBEC0_BTDC`p\/_SB_PCI0LPCBEC0_LFCCap\/_SB_PCI0LPCBEC0_BTDVbp\/_SB_PCI0LPCBEC0_BTMDcp\/_SB_PCI0LPCBEC0_BTMNdp\/_SB_PCI0LPCBEC0_BTSNep\/_SB_PCI0LPCBEC0_LIONf['\/_SB_PCI0LPCBEC0_MUT1p`àPBIF
 paàPBIF
 pbàPBIF
 paLFCCwa
gxg
d gpgàPBIF
 †fp
NiMH àPBIF
 °p
LION àPBIF
 {c
c†ìc
p
01ZE àPBIF
	 °E
†ìc
p
02ZE àPBIF
	 °M†ìc
p
03ZE àPBIF
	 °E†ìc
p
04ZE àPBIF
	 °M†ìc
p
05ZE àPBIF
	 °E†ìc
p
06ZE àPBIF
	 °-†ìc
p
ZL08 àPBIF
	 °†ìc
	p
ZL09 àPBIF
	 †ìd
p
MOTOROLA àPBIF
 °E†ìd
p
SIMPLO àPBIF
 °K†ìd
p
SANYO àPBIF
 °2†ìd
p
SONY àPBIF
 °†ìd
	p
PANASONIC àPBIF
 pITOS[)e àPBIF

 RCAP
 J_BST †CìBTIN
 p
 àPBST
  pˇˇˇˇàPBST
 pˇˇˇˇàPBST
 pˇˇˇˇàPBST
 §PBST†I\._SB_ECOK[#\/_SB_PCI0LPCBEC0_MUT1ˇˇp\/_SB_PCI0LPCBEC0_MBTC`p\/_SB_PCI0LPCBEC0_MBRMap\/_SB_PCI0LPCBEC0_MBVGbp\/_SB_PCI0LPCBEC0_MCURcp\/_SB_PCI0LPCBEC0_BTSTdp\/_SB_PCI0LPCBEC0_MBTFep\/_SB_PCI0LPCBEC0_ACDFf['\/_SB_PCI0LPCBEC0_MUT1†$f†ìe
p
 gpLFCCa°†	ì`
p
g°p
 g°†	êd
p
g°p
 g{d
d†	ìd
}gdgpgàPBST
  †í{a Ä paàPBST
 †í{b Ä pgàPBST
 †êc Ä†íìcˇˇÄccuc{cˇˇcpcàPBST
 §PBSTOZ007 †G\._SB_ECOK[#\/_SB_PCI0LPCBEC0_MUT1ˇˇp\/_SB_PCI0LPCBEC0_MBTS`['\/_SB_PCI0LPCBEC0_MUT1†@ì`
†7ì\/_SB_BAT1BTIN
 p
\/_SB_BAT1BTCHp
 \/_SB_BAT1BIFIp
\/_SB_BAT1BTIN°L†7ì\/_SB_BAT1BTIN
p
\/_SB_BAT1BTCHp
 \/_SB_BAT1BIFIp
 \/_SB_BAT1BTIN[ÇMeBAT2_HIDA–
_UID
CBTI
 PBTI
 BTIN
 BTCH
 BIFI
 SEL0
 BCRI
 PBIFI
00
\+,
Ñ
 
 
BAT2       
11         
11         
11         PBST
 Z00DZ00D'ERRC
 _PCL\_SB__STA †BTIN§
°§
5_BIF †ìBIFI
 \/_SB_BAT2UBIFp
BIFI§\/_SB_BAT2PBIFLFCC0C$UBIF †K#\._SB_ECOK[#\/_SB_PCI0LPCBEC0_MUT1ˇˇp\/_SB_PCI0LPCBEC0_ABDC`p\/_SB_PCI0LPCBEC0_AFCCap\/_SB_PCI0LPCBEC0_ABDVbp\/_SB_PCI0LPCBEC0_ABMDcp\/_SB_PCI0LPCBEC0_ABMNdp\/_SB_PCI0LPCBEC0_ABSNep\/_SB_PCI0LPCBEC0_ABTPf['\/_SB_PCI0LPCBEC0_MUT1p`àPBIF
 paàPBIF
 pbàPBIF
 paLFCCwa
gxg
d gpgàPBIF
 †fp
NiMH àPBIF
 °p
LION àPBIF
 {c
c†ìc
p
04ZE àPBIF
	 °E†ìc
p
ZL02 àPBIF
	 °-†ìc
p
ZL03 àPBIF
	 °†ìc
p
ZL07 àPBIF
	 †ìd
p
MOTOROLA àPBIF
 °E†ìd
p
SIMPLO àPBIF
 °K†ìd
p
SANYO àPBIF
 °2†ìd
p
SONY àPBIF
 °†ìd
	p
PANASONIC àPBIF
 pITOS[)e àPBIF

 RCAP
 AUXB
 G_BST †CìBTIN
 p
 àPBST
  pˇˇˇˇàPBST
 pˇˇˇˇàPBST
 pˇˇˇˇàPBST
 §PBST†F\._SB_ECOK[#\/_SB_PCI0LPCBEC0_MUT1ˇˇp\/_SB_PCI0LPCBEC0_ABCG`p\/_SB_PCI0LPCBEC0_ABRMap\/_SB_PCI0LPCBEC0_ABVGbp\/_SB_PCI0LPCBEC0_ABCRcp\/_SB_PCI0LPCBEC0_ABCTdp\/_SB_PCI0LPCBEC0_ABFCep\/_SB_PCI0LPCBEC0_ACDFfp\/_SB_PCI0LPCBEC0_Z006AUXB['\/_SB_PCI0LPCBEC0_MUT1†$f†ìe
p
 gpLFCCa°†	ì`
p
g°p
 g°!†	AUXBp
g°p
 g†ìd
{
˛g }g
gpgàPBST
  †í{a Ä paàPBST
 †í{b Ä pgàPBST
 †êc Ä†íìcˇˇÄccuc{cˇˇcpcàPBST
 §PBSTOZ007 †G\._SB_ECOK[#\/_SB_PCI0LPCBEC0_MUT1ˇˇp\/_SB_PCI0LPCBEC0_ABTS`['\/_SB_PCI0LPCBEC0_MUT1†@ì`
†7ì\/_SB_BAT2BTIN
 p
\/_SB_BAT2BTCHp
 \/_SB_BAT2BIFIp
\/_SB_BAT2BTIN°L†7ì\/_SB_BAT2BTIN
p
\/_SB_BAT2BTCHp
 \/_SB_BAT2BIFIp
 \/_SB_BAT2BTIN[ÇLLID__HIDA–

_INI p
LIDS-_LID p
LIDS†LIDS†	LIDPp
 `°p
`°pLIDP`§`[ÇPWRB_HIDA–[ÇSLPB_HIDA–[ÇA>AMW0_HID
*pnp0c14 _UID
 _WDG?
<ßÖ.S–_Iù˙J÷.jÜAC ;mCq›˚rLº∏C[˛
d˘BC !êf’—≤ †…)BA STAC
2 WQACp
MXMTCConfigData [1§STACSTBC
   4WQBCp
Get MXMTCControlData: STBC =  [1pSTBC[1§STBCGWSBCpiSTBCp
Set MXMTCControlData: STBC =  [1pSTBC[1pÉàSTBC
 \/_SB_PCI0LPCBEC0_VTMPWQBAC+ÆFOMB   û  ¿  DS }⁄T(ŸÖ B
Ka…!R<îCàWDÑº
∞)¿$à˙˜á(	%Bò†[Äa∂ò‡íJßñ!°î-@;¢$∞#èÇ°qhÏ0,LÉ8å≤ëE`‹N» LÄxTa4E‡Bcd@»£ ´£–§ÿΩ e,
'¿ö cH2(@õ [ B‘äFpQjFH¨Ö4F∞Å¬Ü7Fòà—˛ H „fëFÉkÇc˜hN∏s“Á&ê£;∏:MÜ«∞ÿ) ÔP”?x&5Dè:‹	˚ë0à≥;n¨√…h–•
0{ ––úˆôÑ~8üû!â¸A†FÊˇ?¥«xZ1C>°Mj<@@·—@oûØ	FÜêìÒ†‡A◊:2ç'¶!œË "ø2xA˘ƒ`∏«ÅxY@í !Q„ßG~zxì0(“ô˘ê·¬ƒ{ü;¡){§‡∞~ ¿Øè
	|Æå™˝
@ÌQ‡T#-xäJÃP8Ö–ÁsG%ˆ!⁄·9N¡˜ã#=≠#xë0·Œ(®80ÙˇL‹z;¶Ä>¿1P¸ˇ?¶ á®«Ù@|.°
ˇñ¡éátjè(Ä)yGPå÷Ò<õ†"OÄŒˇˇxX∏öºíÑ}xâ„A‚µ‰¡$Fòè'G¿∑Ç(ëé>ƒÉI(c>£Ñâ˘p"Ô'F
s*è',ƒÒ†Ö‚„	:,Ñ˛ˇ«‹·¡ß¸Ö∆˘0$| €ÊÄå⁄Ù©—®UÉ25 4®’ßRc∆LúRºlçﬂÚû	± 
Å8ÃÛB ñ¢ÑÖ°B©‚ò 4í
ˆˇO\_TZ_[ÖFTHRMB_TMP †D\._SB_ECOK[#\/_SB_PCI0LPCBEC0_MUT1ˇˇp\/_SB_PCI0LPCBEC0_CTMP`['\/_SB_PCI0LPCBEC0_MUT1§rw`

 ¨
 °§<_PSV §rw
Z

 ¨
 _PSL\._PR_CPU0_TSP
(_TC1
_TC2
_CRT §rw
b

 ¨
 FWSO
FWSO                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
