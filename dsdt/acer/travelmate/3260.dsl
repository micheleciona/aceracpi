/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20061109
 *
 * Disassembly of 3260, Fri Aug 17 19:26:57 2007
 *
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x00008B99 (35737)
 *     Revision         0x01
 *     OEM ID           "INTEL "
 *     OEM Table ID     "CALISTGA"
 *     OEM Revision     0x06040000 (100925440)
 *     Creator ID       "MSFT"
 *     Creator Revision 0x03000000 (50331648)
 */
DefinitionBlock ("3260.aml", "DSDT", 1, "INTEL ", "CALISTGA", 0x06040000)
{
    External (PDC1)
    External (PDC0)
    External (CFGD, IntObj)
    External (\_PR_.CPU0._PPC)

    OperationRegion (PRT0, SystemIO, 0x80, 0x01)
    Field (PRT0, ByteAcc, Lock, Preserve)
    {
        P80H,   8
    }

    OperationRegion (PRT1, SystemIO, 0x0378, 0x04)
    Field (PRT1, DWordAcc, Lock, Preserve)
    {
        P378,   8
    }

    OperationRegion (IO_T, SystemIO, 0x0800, 0x10)
    Field (IO_T, ByteAcc, NoLock, Preserve)
    {
                Offset (0x08), 
        TRP0,   8
    }

    OperationRegion (PMIO, SystemIO, 0x1000, 0x80)
    Field (PMIO, ByteAcc, NoLock, Preserve)
    {
                Offset (0x28), 
            ,   1, 
        HOTS,   1, 
                Offset (0x2A), 
            ,   6, 
        VGAP,   1, 
                Offset (0x2B), 
            ,   6, 
        LIDS,   1, 
        Z000,   1
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
        GL00,   6, 
        CRTS,   1, 
                Offset (0x0D), 
            ,   4, 
        GP12,   1, 
                Offset (0x0E), 
        GL02,   8, 
        GL03,   8, 
                Offset (0x18), 
        GB00,   8, 
        GB01,   8, 
        GB02,   8, 
        GB03,   8, 
                Offset (0x2C), 
        GIV0,   6, 
        CRTI,   1, 
                Offset (0x2D), 
            ,   6, 
        LIDP,   1, 
        Z001,   1, 
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
            ,   2, 
        BAYR,   1, 
        BID1,   1, 
            ,   1, 
        BAYO,   1, 
        BID0,   1, 
                Offset (0x39), 
        GL05,   8, 
        GL06,   8, 
        GL07,   8
    }

    OperationRegion (GNVS, SystemMemory, 0x1F69CD2C, 0x0100)
    Field (GNVS, AnyAcc, Lock, Preserve)
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
                Offset (0x1A), 
        DTSE,   8, 
        DTS1,   8, 
        DTS2,   8, 
                Offset (0x1E), 
                Offset (0x28), 
        APIC,   8, 
        MPEN,   8, 
                Offset (0x2B), 
        PPCM,   8, 
        PCP0,   8, 
        PCP1,   8, 
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
                Offset (0x74), 
        MEFE,   8, 
                Offset (0x78), 
        TPMP,   8, 
        TPME,   8, 
                Offset (0x82), 
        GTF0,   56, 
        GTF2,   56, 
        IDEM,   8
    }

    OperationRegion (RCRB, SystemMemory, 0xFED1C000, 0x4000)
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
        HDAD,   1, 
        A97D,   1, 
                Offset (0x341A), 
        RP1D,   1, 
        RP2D,   1, 
        RP3D,   1, 
        RP4D,   1, 
        RP5D,   1, 
        RP6D,   1
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

    Name (\DSEN, 0x01)
    Name (\ECON, 0x00)
    Name (\GPIC, 0x00)
    Name (\CTYP, 0x00)
    Name (\L01C, 0x00)
    Name (\VFN0, 0x00)
    Name (\VFN1, 0x00)
    Name (\INSX, 0x00)
    Name (\PPMF, 0x80000000)
    Method (\_PIC, 1, NotSerialized)
    {
        Store (Arg0, GPIC)
    }

    Method (_PTS, 1, NotSerialized)
    {
        Store (0xBB, P80H)
        \_SB.PHSR (0x08, 0x00)
        If (LEqual (Arg0, 0x04))
        {
            Store (0x01, INS4)
        }

        If (\_SB.ECOK)
        {
            Acquire (\_SB.PCI0.LPCB.EC0.MUT1, 0xFFFF)
            If (LEqual (\_SB.PCI0.RP01.LANE.LANP, 0x00))
            {
                Store (0x00, \_SB.PCI0.LPCB.EC0.VAUX)
            }
            Else
            {
                Store (0x01, \_SB.PCI0.LPCB.EC0.VAUX)
            }

            If (LEqual (Arg0, 0x04))
            {
                Store (0x01, \_SB.PCI0.LPCB.EC0.FLS4)
            }

            Release (\_SB.PCI0.LPCB.EC0.MUT1)
        }

        Store (0x66, P80H)
    }

    Method (_WAK, 1, NotSerialized)
    {
        Store (0xAA, P80H)
        If (LOr (LEqual (Arg0, 0x03), LEqual (Arg0, 0x04)))
        {
            If (And (CFGD, 0x01000000))
            {
                If (LAnd (And (CFGD, 0xF0), LAnd (LEqual (OSYS, 0x07D1), 
                    LNot (And (PDC0, 0x10)))))
                {
                    Store (0x3D, SMIF)
                    Store (0x00, TRP0)
                }
            }
        }

        If (LEqual (Arg0, 0x03)) {}
        If (LEqual (OSYS, 0x07D2))
        {
            If (And (CFGD, 0x01))
            {
                If (LGreater (\_PR.CPU0._PPC, 0x00))
                {
                    Subtract (\_PR.CPU0._PPC, 0x01, \_PR.CPU0._PPC)
                    PNOT ()
                    Add (\_PR.CPU0._PPC, 0x01, \_PR.CPU0._PPC)
                    PNOT ()
                }
                Else
                {
                    Add (\_PR.CPU0._PPC, 0x01, \_PR.CPU0._PPC)
                    PNOT ()
                    Subtract (\_PR.CPU0._PPC, 0x01, \_PR.CPU0._PPC)
                    PNOT ()
                }
            }
        }

        If (LEqual (Arg0, 0x04))
        {
            Store (0x00, INS4)
            \_SB.PHSR (0x0C, 0x00)
        }

        If (LOr (LEqual (Arg0, 0x04), LEqual (Arg0, 0x03)))
        {
            Store (\_SB.BTEN, \_SB.PCI0.LPCB.EC0.BLTH)
            Store (\_SB.WLAN, \_SB.PCI0.LPCB.EC0.WLAN)
            Store (0x01, \_SB.PCI0.LPCB.EC0.CPLE)
        }

        If (Z001)
        {
            Store (0x01, RP4D)
            If (LEqual (\_SB.PCI0.DOCK.DCKS, 0x01))
            {
                XOr (Z001, 0x01, Z001)
                Store (0x00, Z001)
            }
        }
        Else
        {
            Store (0x00, RP4D)
            If (LEqual (\_SB.PCI0.DOCK.DCKS, 0x00))
            {
                XOr (Z001, 0x01, Z001)
                Store (0x01, Z001)
            }
        }

        Store (0xBB, P80H)
        Return (0x00)
    }

    Scope (\_GPE)
    {
        Method (_L01, 0, NotSerialized)
        {
            Add (L01C, 0x01, L01C)
            P8XH (0x00, 0x01)
            P8XH (0x01, L01C)
            Sleep (0x64)
            If (LAnd (LEqual (RP1D, 0x00), \_SB.PCI0.RP01.HPCS))
            {
                If (\_SB.PCI0.RP01.PDC1)
                {
                    Store (0x01, \_SB.PCI0.RP01.PDC1)
                    Store (0x01, \_SB.PCI0.RP01.HPCS)
                    Notify (\_SB.PCI0.RP01, 0x00)
                }
                Else
                {
                    Store (0x01, \_SB.PCI0.RP01.HPCS)
                }
            }

            If (LAnd (LEqual (RP2D, 0x00), \_SB.PCI0.RP02.HPCS))
            {
                If (\_SB.PCI0.RP02.PDC2)
                {
                    Store (0x01, \_SB.PCI0.RP02.PDC2)
                    Store (0x01, \_SB.PCI0.RP02.HPCS)
                    Notify (\_SB.PCI0.RP02, 0x00)
                }
                Else
                {
                    Store (0x01, \_SB.PCI0.RP02.HPCS)
                }
            }

            If (LAnd (LEqual (RP3D, 0x00), \_SB.PCI0.RP03.HPCS))
            {
                If (\_SB.PCI0.RP03.PDC3)
                {
                    Store (0x01, \_SB.PCI0.RP03.PDC3)
                    Store (0x01, \_SB.PCI0.RP03.HPCS)
                    Notify (\_SB.PCI0.RP03, 0x00)
                }
                Else
                {
                    Store (0x01, \_SB.PCI0.RP03.HPCS)
                }
            }

            If (LAnd (LEqual (RP4D, 0x00), \_SB.PCI0.RP04.HPCS))
            {
                If (\_SB.PCI0.RP04.PDC4)
                {
                    Store (0x01, \_SB.PCI0.RP04.PDC4)
                    Store (0x01, \_SB.PCI0.RP04.HPCS)
                }
                Else
                {
                    Store (0x01, \_SB.PCI0.RP04.HPCS)
                }
            }

            If (LAnd (LEqual (RP5D, 0x00), \_SB.PCI0.RP05.HPCS))
            {
                If (\_SB.PCI0.RP05.PDC5)
                {
                    Store (0x01, \_SB.PCI0.RP05.PDC5)
                    Store (0x01, \_SB.PCI0.RP05.HPCS)
                    Notify (\_SB.PCI0.RP05, 0x00)
                }
                Else
                {
                    Store (0x01, \_SB.PCI0.RP05.HPCS)
                }
            }

            If (LAnd (LEqual (RP6D, 0x00), \_SB.PCI0.RP06.HPCS))
            {
                If (\_SB.PCI0.RP06.PDC6)
                {
                    Store (0x01, \_SB.PCI0.RP06.PDC6)
                    Store (0x01, \_SB.PCI0.RP06.HPCS)
                }
                Else
                {
                    Store (0x01, \_SB.PCI0.RP06.HPCS)
                }
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
            If (HDAD) {}
            Else
            {
                Notify (\_SB.PCI0.HDEF, 0x02)
            }
        }

        Method (_L07, 0, NotSerialized)
        {
            Store (0x20, \_SB.PCI0.SBUS.HSTS)
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

            If (\_SB.PCI0.RP05.PSP5)
            {
                Store (0x01, \_SB.PCI0.RP05.PSP5)
                Store (0x01, \_SB.PCI0.RP05.PMCS)
                Notify (\_SB.PCI0.RP05, 0x02)
            }

            If (\_SB.PCI0.RP06.PSP6)
            {
                Store (0x01, \_SB.PCI0.RP06.PSP6)
                Store (0x01, \_SB.PCI0.RP06.PMCS)
                Notify (\_SB.PCI0.RP06, 0x02)
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

        Method (_L16, 0, NotSerialized)
        {
            Sleep (0x012C)
            Store (0x01, VGAP)
            Store (VGAP, Local1)
            If (Local1)
            {
                If (CRTS)
                {
                    Store (0x08, \_SB.WMID.WMIQ)
                }
                Else
                {
                    Store (0x09, \_SB.WMID.WMIQ)
                }

                Notify (\_SB.WMID, 0x82)
                Store (CRTS, CRTI)
            }
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
            If (LEqual (TRAP (Arg0), 0x00))
            {
                If (LNotEqual (CADL, PADL))
                {
                    Store (CADL, PADL)
                    If (LOr (LGreater (OSYS, 0x07D0), LLess (OSYS, 0x07D6)))
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
            If (LEqual (TRAP (Increment (Arg0)), 0x00))
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

        If (LNotEqual (DSEN, 0x01))
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
            Store (Or (And (P80D, 0xFFFF00FF), ShiftLeft (Arg1, 0x08)
                ), P80D)
        }

        If (LEqual (Arg0, 0x02))
        {
            Store (Or (And (P80D, 0xFF00FFFF), ShiftLeft (Arg1, 0x10)
                ), P80D)
        }

        If (LEqual (Arg0, 0x03))
        {
            Store (Or (And (P80D, 0x00FFFFFF), ShiftLeft (Arg1, 0x18)
                ), P80D)
        }

        Store (P80D, P80H)
    }

    Method (PNOT, 0, Serialized)
    {
        If (MPEN)
        {
            If (And (PDC0, 0x08))
            {
                Notify (\_PR.CPU0, 0x80)
                If (And (PDC0, 0x10))
                {
                    Sleep (0x64)
                    Notify (\_PR.CPU0, 0x81)
                }
            }

            If (And (PDC1, 0x08))
            {
                Notify (\_PR.CPU1, 0x80)
                If (And (PDC1, 0x10))
                {
                    Sleep (0x64)
                    Notify (\_PR.CPU1, 0x81)
                }
            }
        }
        Else
        {
            Notify (\_PR.CPU0, 0x80)
            Sleep (0x64)
            Notify (\_PR.CPU0, 0x81)
        }
    }

    Method (TRAP, 1, Serialized)
    {
        Store (Arg0, SMIF)
        Store (0x00, TRP0)
        Return (SMIF)
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
                /* 0000 */    0x30, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0008 */    0x00
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
        Return (Multiply (0x1E, Subtract (0x09, Add (Local0, Local1))
            ))
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
        Return (Multiply (0x1E, Subtract (0x09, Add (And (ShiftRight (Arg0, 0x02
            ), 0x03), And (Arg0, 0x03)))))
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
                If (LAnd (LLessEqual (Arg0, 0x78), And (Arg2, 0x02)))
                {
                    Return (0x2301)
                }

                If (LAnd (LLessEqual (Arg0, 0xB4), And (Arg2, 0x01)))
                {
                    Return (0x2101)
                }
            }

            Return (0x1001)
        }
    }

    Method (SDMA, 1, Serialized)
    {
        If (LLessEqual (Arg0, 0x14))
        {
            Return (0x01)
        }

        If (LLessEqual (Arg0, 0x1E))
        {
            Return (0x02)
        }

        If (LLessEqual (Arg0, 0x2D))
        {
            Return (0x01)
        }

        If (LLessEqual (Arg0, 0x3C))
        {
            Return (0x02)
        }

        If (LLessEqual (Arg0, 0x5A))
        {
            Return (0x01)
        }

        Return (0x00)
    }

    Method (SETT, 3, Serialized)
    {
        If (And (Arg1, 0x02))
        {
            If (LAnd (LLessEqual (Arg0, 0x78), And (Arg2, 0x02)))
            {
                Return (0x0B)
            }

            If (LAnd (LLessEqual (Arg0, 0xB4), And (Arg2, 0x01)))
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
        DLST,   8
    }

    Scope (\_SB)
    {
        Method (_INI, 0, NotSerialized)
        {
            Store (0x07D0, OSYS)
            If (CondRefOf (_OSI, Local0))
            {
                If (_OSI ("Linux"))
                {
                    Store (0x03E8, OSYS)
                }
                Else
                {
                    Store (0x07D1, OSYS)
                    If (_OSI ("Windows 2001 SP2"))
                    {
                        Store (0x07D2, OSYS)
                    }

                    If (_OSI ("Windows 2006"))
                    {
                        Store (0x07D6, OSYS)
                    }

                    If (LAnd (MPEN, LEqual (OSYS, 0x07D1)))
                    {
                        TRAP (0x3D)
                    }
                }
            }

            If (LGreaterEqual (OSYS, 0x07D0))
            {
                Store (0x01, PRM0)
                If (LGreaterEqual (OSYS, 0x07D1))
                {
                    Store (0x03, PRM0)
                }
            }
            Else
            {
                Store (0x00, PRM0)
            }

            TRAP (0x32)
            If (LEqual (OSYS, 0x07D0))
            {
                \_SB.PHSR (0x0A, 0x00)
            }
        }

        Name (ECOK, 0x00)
        Device (PCI0)
        {
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
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x00FF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0100,             // Length
                    ,, )
                DWordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0x00000CF7,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000CF8,         // Length
                    ,, , TypeStatic)
                IO (Decode16,
                    0x0CF8,             // Range Minimum
                    0x0CF8,             // Range Maximum
                    0x01,               // Alignment
                    0x08,               // Length
                    )
                DWordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x00000000,         // Granularity
                    0x00000D00,         // Range Minimum
                    0x0000FFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x0000F300,         // Length
                    ,, , TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000A0000,         // Range Minimum
                    0x000BFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00020000,         // Length
                    ,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C0000,         // Range Minimum
                    0x000C3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y00, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C4000,         // Range Minimum
                    0x000C7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y01, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C8000,         // Range Minimum
                    0x000CBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y02, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000CC000,         // Range Minimum
                    0x000CFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y03, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D0000,         // Range Minimum
                    0x000D3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y04, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D4000,         // Range Minimum
                    0x000D7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y05, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D8000,         // Range Minimum
                    0x000DBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y06, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000DC000,         // Range Minimum
                    0x000DFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y07, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E0000,         // Range Minimum
                    0x000E3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y08, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E4000,         // Range Minimum
                    0x000E7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y09, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E8000,         // Range Minimum
                    0x000EBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y0A, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000EC000,         // Range Minimum
                    0x000EFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y0B, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000F0000,         // Range Minimum
                    0x000FFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00010000,         // Length
                    ,, _Y0C, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0xFEBFFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000000,         // Length
                    ,, _Y0E, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0xFED40000,         // Range Minimum
                    0xFED44FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000000,         // Length
                    ,, _Y0D, AddressRangeMemory, TypeStatic)
            })
            Method (_CRS, 0, Serialized)
            {
                If (PM1L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y00._LEN, C0LN)
                    Store (Zero, C0LN)
                }

                If (LEqual (PM1L, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y00._RW, C0RW)
                    Store (Zero, C0RW)
                }

                If (PM1H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y01._LEN, C4LN)
                    Store (Zero, C4LN)
                }

                If (LEqual (PM1H, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y01._RW, C4RW)
                    Store (Zero, C4RW)
                }

                If (PM2L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y02._LEN, C8LN)
                    Store (Zero, C8LN)
                }

                If (LEqual (PM2L, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y02._RW, C8RW)
                    Store (Zero, C8RW)
                }

                If (PM2H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y03._LEN, CCLN)
                    Store (Zero, CCLN)
                }

                If (LEqual (PM2H, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y03._RW, CCRW)
                    Store (Zero, CCRW)
                }

                If (PM3L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y04._LEN, D0LN)
                    Store (Zero, D0LN)
                }

                If (LEqual (PM3L, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y04._RW, D0RW)
                    Store (Zero, D0RW)
                }

                If (PM3H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y05._LEN, D4LN)
                    Store (Zero, D4LN)
                }

                If (LEqual (PM3H, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y05._RW, D4RW)
                    Store (Zero, D4RW)
                }

                If (PM4L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y06._LEN, D8LN)
                    Store (Zero, D8LN)
                }

                If (LEqual (PM4L, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y06._RW, D8RW)
                    Store (Zero, D8RW)
                }

                If (PM4H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y07._LEN, DCLN)
                    Store (Zero, DCLN)
                }

                If (LEqual (PM4H, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y07._RW, DCRW)
                    Store (Zero, DCRW)
                }

                If (PM5L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y08._LEN, E0LN)
                    Store (Zero, E0LN)
                }

                If (LEqual (PM5L, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y08._RW, E0RW)
                    Store (Zero, E0RW)
                }

                If (PM5H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y09._LEN, E4LN)
                    Store (Zero, E4LN)
                }

                If (LEqual (PM5H, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y09._RW, E4RW)
                    Store (Zero, E4RW)
                }

                If (PM6L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y0A._LEN, E8LN)
                    Store (Zero, E8LN)
                }

                If (LEqual (PM6L, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y0A._RW, E8RW)
                    Store (Zero, E8RW)
                }

                If (PM6H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y0B._LEN, ECLN)
                    Store (Zero, ECLN)
                }

                If (LEqual (PM6H, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y0B._RW, ECRW)
                    Store (Zero, ECRW)
                }

                If (PM0H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y0C._LEN, F0LN)
                    Store (Zero, F0LN)
                }

                If (LEqual (PM0H, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y0C._RW, F0RW)
                    Store (Zero, F0RW)
                }

                If (TPMS)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y0D._LEN, TPML)
                    Store (0x5000, TPML)
                }

                CreateDWordField (BUF0, \_SB.PCI0._Y0E._MIN, M1MN)
                CreateDWordField (BUF0, \_SB.PCI0._Y0E._MAX, M1MX)
                CreateDWordField (BUF0, \_SB.PCI0._Y0E._LEN, M1LN)
                ShiftLeft (TOUD, 0x1B, M1MN)
                Add (Subtract (M1MX, M1MN), 0x01, M1LN)
                Return (BUF0)
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
                            0x03, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x001BFFFF, 
                            0x00, 
                            0x00, 
                            0x16
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x00, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x01, 
                            0x00, 
                            0x11
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
                            0x16
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
                            0x03, 
                            \_SB.PCI0.LPCB.LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001BFFFF, 
                            0x00, 
                            \_SB.PCI0.LPCB.LNKG, 
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
                            \_SB.PCI0.LPCB.LNKG, 
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

            Device (PDRC)
            {
                Name (_HID, EisaId ("PNP0C02"))
                Name (_UID, 0x01)
                Name (BUF0, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0xE0000000,         // Address Base
                        0x10000000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFED14000,         // Address Base
                        0x00004000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFED18000,         // Address Base
                        0x00001000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFED19000,         // Address Base
                        0x00001000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFED1C000,         // Address Base
                        0x00004000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFED20000,         // Address Base
                        0x00020000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFED40000,         // Address Base
                        0x00005000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFED45000,         // Address Base
                        0x0004B000,         // Address Length
                        )
                })
                Name (BUF1, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0xE0000000,         // Address Base
                        0x10000000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFED14000,         // Address Base
                        0x00004000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFED18000,         // Address Base
                        0x00001000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFED19000,         // Address Base
                        0x00001000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFED1C000,         // Address Base
                        0x00004000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFED20000,         // Address Base
                        0x00020000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFED45000,         // Address Base
                        0x0004B000,         // Address Length
                        )
                })
                Method (_CRS, 0, Serialized)
                {
                    If (LNot (TPMS))
                    {
                        Return (BUF0)
                    }

                    Return (BUF1)
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
                    Name (_PSC, 0x00)
                    Method (_PS0, 0, NotSerialized)
                    {
                        Store (0x00, _PSC)
                        \_SB.PHSR (0x0F, 0x00)
                    }

                    Method (_PS3, 0, NotSerialized)
                    {
                        Store (0x03, _PSC)
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

                Device (DD01)
                {
                    Method (_ADR, 0, Serialized)
                    {
                        Return (And (0xFFFF, DID1))
                    }

                    Method (_DCS, 0, NotSerialized)
                    {
                        TRAP (0x01)
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
                        TRAP (0x01)
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
                        TRAP (0x01)
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
                        TRAP (0x01)
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
                        TRAP (0x01)
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

            Device (HDEF)
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

                Device (LANE)
                {
                    Name (_ADR, 0x00)
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
                            Offset (0x1A), 
                    ABP3,   1, 
                        ,   2, 
                    PDC3,   1, 
                        ,   2, 
                    PDS3,   1, 
                            Offset (0x20), 
                            Offset (0x22), 
                    PSP3,   1, 
                            Offset (0x9C), 
                        ,   30, 
                    HPCS,   1, 
                    PMCS,   1
                }

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
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                0x00, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                0x00, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                0x00, 
                                0x11
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
                                \_SB.PCI0.LPCB.LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                \_SB.PCI0.LPCB.LNKD, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                \_SB.PCI0.LPCB.LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                \_SB.PCI0.LPCB.LNKB, 
                                0x00
                            }
                        })
                    }
                }
            }

            Device (RP04)
            {
                Name (_ADR, 0x001C0003)
                OperationRegion (P4CS, PCI_Config, 0x40, 0x0100)
                Field (P4CS, AnyAcc, NoLock, WriteAsZeros)
                {
                            Offset (0x10), 
                        ,   4, 
                    LDP4,   1, 
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
                                Store (0x01, \_SB.PCI0.RP04.LDP4)
                                Return (0x01)
                            }
                        }

                        Method (_EJ0, 1, NotSerialized)
                        {
                            Store (0x01, \_SB.PCI0.RP04.LDP4)
                            Store (0x01, HOTS)
                        }

                        Method (_STA, 0, NotSerialized)
                        {
                            If (LEqual (\_SB.PCI0.RP04.LDP4, 0x01))
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
                    Name (_EJD, "\\_SB.PCI0.DOCK")
                    Method (_INI, 0, NotSerialized)
                    {
                        If (LEqual (RP4D, 0x01))
                        {
                            Store (0x00, \_SB.PCI0.DOCK.DCKS)
                            Store (0x01, \_SB.PCI0.RP04.LDP4)
                        }
                        Else
                        {
                            If (LEqual (\_SB.PCI0.RP04.PDS4, 0x01))
                            {
                                Store (0x01, \_SB.PCI0.DOCK.DCKS)
                            }
                            Else
                            {
                                Store (0x00, \_SB.PCI0.DOCK.DCKS)
                                Store (0x01, \_SB.PCI0.RP04.LDP4)
                                Store (0x01, RP4D)
                            }
                        }

                        If (LGreaterEqual (OSYS, 0x07D1))
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
                            Notify (\_PR.CPU1, 0x81)
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
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0x0002FFFF, 
                                0x01, 
                                0x00, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0x0002FFFF, 
                                0x02, 
                                0x00, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0x0003FFFF, 
                                0x00, 
                                0x00, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0x0003FFFF, 
                                0x01, 
                                0x00, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0x0003FFFF, 
                                0x02, 
                                0x00, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0x0004FFFF, 
                                0x00, 
                                0x00, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x00, 
                                0x00, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0x0006FFFF, 
                                0x00, 
                                0x00, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0x0006FFFF, 
                                0x01, 
                                0x00, 
                                0x10
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
                    Method (_L1F, 0, NotSerialized)
                    {
                        If (LEqual (\_SB.DOCK, 0x01))
                        {
                            Sleep (0x012C)
                            Store (0x01, Z000)
                            Store (Z000, Local1)
                            If (LEqual (Local1, 0x01))
                            {
                                Store (Z001, Local0)
                                If (LEqual (Local0, 0x00))
                                {
                                    Store (\PPMF, CFGD)
                                    Notify (\_PR.CPU0, 0x81)
                                    Sleep (0x012C)
                                    Notify (\_PR.CPU1, 0x81)
                                    Sleep (0x012C)
                                    Store (0x01, RP4D)
                                    Sleep (0xC8)
                                    Notify (\_SB.PCI0.RP04, 0x01)
                                    Sleep (0xC8)
                                    Store (0x00, \_SB.PCI0.DOCK.DCKS)
                                    Notify (\_SB.PCI0.DOCK, 0x01)
                                }
                                Else
                                {
                                    And (CFGD, 0xFFFFFF3F, CFGD)
                                    Notify (\_PR.CPU0, 0x81)
                                    Sleep (0x012C)
                                    Notify (\_PR.CPU1, 0x81)
                                    Sleep (0x012C)
                                    Store (0x00, RP4D)
                                    Sleep (0x01F4)
                                    Store (0x00, \_SB.PCI0.RP04.LDP4)
                                    Sleep (0x012C)
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
            }

            Device (RP05)
            {
                Name (_ADR, 0x001C0004)
                OperationRegion (P5CS, PCI_Config, 0x40, 0x0100)
                Field (P5CS, AnyAcc, NoLock, WriteAsZeros)
                {
                            Offset (0x10), 
                        ,   4, 
                    LDP5,   1, 
                            Offset (0x1A), 
                    ABP5,   1, 
                        ,   2, 
                    PDC5,   1, 
                        ,   2, 
                    PDS5,   1, 
                            Offset (0x20), 
                            Offset (0x22), 
                    PSP5,   1, 
                            Offset (0x9C), 
                        ,   30, 
                    HPCS,   1, 
                    PMCS,   1
                }

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

            Device (RP06)
            {
                Name (_ADR, 0x001C0005)
                OperationRegion (P6CS, PCI_Config, 0x40, 0x0100)
                Field (P6CS, AnyAcc, NoLock, WriteAsZeros)
                {
                            Offset (0x10), 
                        ,   4, 
                    LDP6,   1, 
                            Offset (0x1A), 
                    ABP6,   1, 
                        ,   2, 
                    PDC6,   1, 
                        ,   2, 
                    PDS6,   1, 
                            Offset (0x20), 
                            Offset (0x22), 
                    PSP6,   1, 
                            Offset (0x9C), 
                        ,   30, 
                    HPCS,   1, 
                    PMCS,   1
                }

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
            }

            Device (USB4)
            {
                Name (_ADR, 0x001D0003)
                OperationRegion (U4CS, PCI_Config, 0xC4, 0x04)
                Field (U4CS, DWordAcc, NoLock, Preserve)
                {
                    U4EN,   2
                }

                Name (_PRW, Package (0x02)
                {
                    0x0E, 
                    0x03
                })
                Method (_PSW, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Store (0x03, U4EN)
                    }
                    Else
                    {
                        Store (0x00, U4EN)
                    }
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
                        Return (Package (0x03)
                        {
                            Package (0x04)
                            {
                                0x0009FFFF, 
                                0x00, 
                                0x00, 
                                0x14
                            }, 

                            Package (0x04)
                            {
                                0x0003FFFF, 
                                0x00, 
                                0x00, 
                                0x12
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
                    UADR,   3, 
                        ,   1, 
                    UBDR,   3, 
                            Offset (0x41), 
                    LPDR,   2, 
                        ,   2, 
                    FDDR,   1, 
                            Offset (0x42), 
                    UALE,   1, 
                    UBLE,   1, 
                    LPLE,   1, 
                    FDLE,   1, 
                    SBLE,   1, 
                    MDLE,   1, 
                    MSLE,   1, 
                    ADLE,   1, 
                    GLLE,   1, 
                    GHLE,   1, 
                    KBLE,   1, 
                    MCLE,   1, 
                    C1LE,   1, 
                    C2LE,   1, 
                            Offset (0x44), 
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
                        IRQ (Level, ActiveLow, Shared, )
                            {1,3,4,5,6,7,10,12,14,15}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Name (RTLA, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, _Y0F)
                                {}
                        })
                        CreateWordField (RTLA, \_SB.PCI0.LPCB.LNKA._CRS._Y0F._INT, IRQ0)
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
                        IRQ (Level, ActiveLow, Shared, )
                            {1,3,4,5,6,7,11,12,14,15}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Name (RTLB, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, _Y10)
                                {}
                        })
                        CreateWordField (RTLB, \_SB.PCI0.LPCB.LNKB._CRS._Y10._INT, IRQ0)
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
                        IRQ (Level, ActiveLow, Shared, )
                            {1,3,4,5,6,7,10,12,14,15}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Name (RTLC, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, _Y11)
                                {}
                        })
                        CreateWordField (RTLC, \_SB.PCI0.LPCB.LNKC._CRS._Y11._INT, IRQ0)
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
                        IRQ (Level, ActiveLow, Shared, )
                            {1,3,4,5,6,7,11,12,14,15}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Name (RTLD, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, _Y12)
                                {}
                        })
                        CreateWordField (RTLD, \_SB.PCI0.LPCB.LNKD._CRS._Y12._INT, IRQ0)
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
                        IRQ (Level, ActiveLow, Shared, )
                            {1,3,4,5,6,7,10,12,14,15}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Name (RTLE, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, _Y13)
                                {}
                        })
                        CreateWordField (RTLE, \_SB.PCI0.LPCB.LNKE._CRS._Y13._INT, IRQ0)
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
                        IRQ (Level, ActiveLow, Shared, )
                            {1,3,4,5,6,7,11,12,14,15}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Name (RTLF, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, _Y14)
                                {}
                        })
                        CreateWordField (RTLF, \_SB.PCI0.LPCB.LNKF._CRS._Y14._INT, IRQ0)
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
                        IRQ (Level, ActiveLow, Shared, )
                            {1,3,4,5,6,7,10,12,14,15}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Name (RTLG, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, _Y15)
                                {}
                        })
                        CreateWordField (RTLG, \_SB.PCI0.LPCB.LNKG._CRS._Y15._INT, IRQ0)
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
                        IRQ (Level, ActiveLow, Shared, )
                            {1,3,4,5,6,7,11,12,14,15}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Name (RTLH, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, _Y16)
                                {}
                        })
                        CreateWordField (RTLH, \_SB.PCI0.LPCB.LNKH._CRS._Y16._INT, IRQ0)
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
                            0x0062,             // Range Minimum
                            0x0062,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0066,             // Range Minimum
                            0x0066,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                    })
                    Name (_GPE, 0x17)
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
                            Acquire (\_SB.PCI0.LPCB.EC0.MUT1, 0xFFFF)
                            Store (0x03, \_SB.PCI0.LPCB.EC0.RG59)
                            Store (\_SB.BTEN, \_SB.PCI0.LPCB.EC0.BLTH)
                            Store (\_SB.WLAN, \_SB.PCI0.LPCB.EC0.WLAN)
                            Store (0x01, \_SB.PCI0.LPCB.EC0.CPLE)
                            Store (\_SB.PHSR (0x05, 0x00), DOFF)
                            If (LEqual (OSYS, 0x07D0))
                            {
                                Store (\_SB.PCI0.LPCB.EC0.ACDF, Local0)
                                If (Local0)
                                {
                                    \_SB.PHSR (0x10, 0x01)
                                }
                                Else
                                {
                                    \_SB.PHSR (0x10, 0x00)
                                }
                            }

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
                                Offset (0x5F), 
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
                                Offset (0x7A), 
                        MCYC,   16, 
                        MTMP,   16, 
                        MDAT,   16, 
                                Offset (0x81), 
                        ABTS,   1, 
                        ABFC,   1, 
                            ,   3, 
                        ABBL,   1, 
                        Z002,   1, 
                        ABCT,   1, 
                        ABCG,   1, 
                            ,   2, 
                        ABTP,   1, 
                                Offset (0x87), 
                        BA2C,   8, 
                                Offset (0x8A), 
                        ACYC,   16, 
                        ATMP,   16, 
                        ADAT,   16, 
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

                        If (LNotEqual (Arg0, 0x07))
                        {
                            If (LNotEqual (Arg0, 0x09))
                            {
                                If (LNotEqual (Arg0, 0x0B))
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

                        If (LNotEqual (Arg0, 0x06))
                        {
                            If (LNotEqual (Arg0, 0x08))
                            {
                                If (LNotEqual (Arg0, 0x0A))
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
                            If (LNotEqual (\_SB.ECOK, 0x00))
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
                                }
                                Else
                                {
                                    Store (0x00, \_SB.BAT1.BCRI)
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
                            \_SB.BAT1.Z003 ()
                            Notify (\_SB.ACAD, 0x80)
                            Sleep (0x01F4)
                            Notify (\_SB.BAT1, 0x80)
                            If (\_SB.BAT1.BTCH)
                            {
                                \_SB.BAT1.UBIF ()
                                Notify (\_SB.BAT1, 0x81)
                                Store (0x00, \_SB.BAT1.BTCH)
                            }
                        }
                    }

                    Method (_Q8A, 0, NotSerialized)
                    {
                        Store (0x8A, P80H)
                    }

                    Method (_Q0F, 0, NotSerialized)
                    {
                        Store (DLST, Local0)
                        Store (Local0, TLST)
                        HKDS (0x0A)
                    }

                    Method (_Q0D, 0, NotSerialized)
                    {
                        Notify (\_SB.SLPB, 0x80)
                    }

                    Method (_Q90, 0, NotSerialized)
                    {
                        Store (0x01, \_SB.WMID.WMIQ)
                        Notify (\_SB.WMID, 0x80)
                    }

                    Method (_Q91, 0, NotSerialized)
                    {
                        Store (0x02, \_SB.WMID.WMIQ)
                        Notify (\_SB.WMID, 0x80)
                    }

                    Method (_Q92, 0, NotSerialized)
                    {
                        Store (0x03, \_SB.WMID.WMIQ)
                        Notify (\_SB.WMID, 0x80)
                    }

                    Method (_Q93, 0, NotSerialized)
                    {
                        Store (0x04, \_SB.WMID.WMIQ)
                        Notify (\_SB.WMID, 0x80)
                    }

                    Method (_Q8F, 0, NotSerialized)
                    {
                        Store (0x05, \_SB.WMID.WMIQ)
                        Notify (\_SB.WMID, 0x80)
                    }

                    Method (_Q8E, 0, NotSerialized)
                    {
                        Store (0x06, \_SB.WMID.WMIQ)
                        Notify (\_SB.WMID, 0x81)
                    }

                    Method (_Q8D, 0, NotSerialized)
                    {
                        Store (0x07, \_SB.WMID.WMIQ)
                        Notify (\_SB.WMID, 0x81)
                    }

                    Method (_Q8B, 0, NotSerialized)
                    {
                        Store (0x0A, \_SB.WMID.WMIQ)
                        Notify (\_SB.WMID, 0x81)
                    }

                    Method (_Q94, 0, NotSerialized)
                    {
                        Store (0x09, \_SB.WMID.WMIQ)
                        Notify (\_SB.WMID, 0x82)
                    }

                    Method (_Q95, 0, NotSerialized)
                    {
                        Store (0x08, \_SB.WMID.WMIQ)
                        Notify (\_SB.WMID, 0x82)
                    }
                }

                Device (DMAC)
                {
                    Name (_HID, EisaId ("PNP0200"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x20,               // Length
                            )
                        IO (Decode16,
                            0x0081,             // Range Minimum
                            0x0081,             // Range Maximum
                            0x01,               // Alignment
                            0x11,               // Length
                            )
                        IO (Decode16,
                            0x0093,             // Range Minimum
                            0x0093,             // Range Maximum
                            0x01,               // Alignment
                            0x0D,               // Length
                            )
                        IO (Decode16,
                            0x00C0,             // Range Minimum
                            0x00C0,             // Range Maximum
                            0x01,               // Alignment
                            0x20,               // Length
                            )
                        DMA (Compatibility, NotBusMaster, Transfer8_16, )
                            {4}
                    })
                }

                Device (HPET)
                {
                    Name (_HID, EisaId ("PNP0103"))
                    Name (_CID, 0x010CD041)
                    Name (BUF0, ResourceTemplate ()
                    {
                        IRQNoFlags ()
                            {0}
                        IRQNoFlags ()
                            {8}
                        Memory32Fixed (ReadOnly,
                            0xFED00000,         // Address Base
                            0x00000400,         // Address Length
                            _Y17)
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        If (LGreaterEqual (OSYS, 0x07D1))
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
                            CreateDWordField (BUF0, \_SB.PCI0.LPCB.HPET._Y17._BAS, HPT0)
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
                            0x0020,             // Range Minimum
                            0x0020,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0024,             // Range Minimum
                            0x0024,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0028,             // Range Minimum
                            0x0028,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x002C,             // Range Minimum
                            0x002C,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0030,             // Range Minimum
                            0x0030,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0034,             // Range Minimum
                            0x0034,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0038,             // Range Minimum
                            0x0038,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x003C,             // Range Minimum
                            0x003C,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A0,             // Range Minimum
                            0x00A0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A4,             // Range Minimum
                            0x00A4,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A8,             // Range Minimum
                            0x00A8,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00AC,             // Range Minimum
                            0x00AC,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00B0,             // Range Minimum
                            0x00B0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00B4,             // Range Minimum
                            0x00B4,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00B8,             // Range Minimum
                            0x00B8,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00BC,             // Range Minimum
                            0x00BC,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x04D0,             // Range Minimum
                            0x04D0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
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
                            0x00F0,             // Range Minimum
                            0x00F0,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IRQNoFlags ()
                            {13}
                    })
                }

                Device (LDRC)
                {
                    Name (_HID, EisaId ("PNP0C02"))
                    Name (_UID, 0x02)
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x002E,             // Range Minimum
                            0x002E,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0061,             // Range Minimum
                            0x0061,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0063,             // Range Minimum
                            0x0063,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0065,             // Range Minimum
                            0x0065,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0067,             // Range Minimum
                            0x0067,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0068,             // Range Minimum
                            0x006F,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            )
                        IO (Decode16,
                            0x0080,             // Range Minimum
                            0x0080,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0092,             // Range Minimum
                            0x0092,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x00B2,             // Range Minimum
                            0x00B2,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0800,             // Range Minimum
                            0x0800,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x1000,             // Range Minimum
                            0x1000,             // Range Maximum
                            0x01,               // Alignment
                            0x80,               // Length
                            )
                        IO (Decode16,
                            0x1180,             // Range Minimum
                            0x1180,             // Range Maximum
                            0x01,               // Alignment
                            0x40,               // Length
                            )
                        IO (Decode16,
                            0x1600,             // Range Minimum
                            0x1600,             // Range Maximum
                            0x01,               // Alignment
                            0x70,               // Length
                            )
                        IO (Decode16,
                            0xFE10,             // Range Minimum
                            0xFE10,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0xFE00,             // Range Minimum
                            0xFE00,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                    })
                }

                Device (RTC)
                {
                    Name (_HID, EisaId ("PNP0B00"))
                    Name (BUF0, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            )
                    })
                    Name (BUF1, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
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
                            0x0040,             // Range Minimum
                            0x0040,             // Range Maximum
                            0x01,               // Alignment
                            0x04,               // Length
                            )
                        IO (Decode16,
                            0x0050,             // Range Minimum
                            0x0050,             // Range Maximum
                            0x10,               // Alignment
                            0x04,               // Length
                            )
                    })
                    Name (BUF1, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0040,             // Range Minimum
                            0x0040,             // Range Maximum
                            0x01,               // Alignment
                            0x04,               // Length
                            )
                        IO (Decode16,
                            0x0050,             // Range Minimum
                            0x0050,             // Range Maximum
                            0x10,               // Alignment
                            0x04,               // Length
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

                Device (TPM)
                {
                    Name (_HID, EisaId ("IFX0102"))
                    Name (_CID, 0x310CD041)
                    Name (_UID, 0x01)
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x004E,             // Range Minimum
                            0x004E,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x1670,             // Range Minimum
                            0x1670,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xFED40000,         // Address Base
                            0x00005000,         // Address Length
                            )
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        If (\_SB.TPMS)
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (0x00)
                        }
                    }
                }

                Device (PS2K)
                {
                    Name (_HID, EisaId ("PNP0303"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0060,             // Range Minimum
                            0x0060,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0064,             // Range Minimum
                            0x0064,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IRQ (Edge, ActiveHigh, Exclusive, )
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
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {12}
                    })
                }

                Device (SIO)
                {
                    Name (_HID, EisaId ("PNP0A05"))
                    OperationRegion (SIIO, SystemIO, 0x164E, 0x02)
                    Field (SIIO, ByteAcc, NoLock, Preserve)
                    {
                        INDX,   8, 
                        DATA,   8
                    }

                    Mutex (N383, 0x00)
                    IndexField (INDX, DATA, ByteAcc, NoLock, Preserve)
                    {
                                Offset (0x07), 
                        LDN,    8, 
                                Offset (0x26), 
                            ,   1, 
                        LPTE,   1, 
                        Z004,   1, 
                        Z005,   1, 
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
                        Acquire (N383, 0xFFFF)
                        Store (0x07, INDX)
                        Store (Arg0, DATA)
                    }

                    Method (EXFG, 0, NotSerialized)
                    {
                        Release (N383)
                    }

                    Device (FIR)
                    {
                        Name (_HID, EisaId ("NSC6001"))
                        Method (_STA, 0, NotSerialized)
                        {
                            ENFG (0x02)
                            If (LEqual (Z004, 0x00))
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
                                \_SB.PCI0.LPCB.SIO.FIR._DIS ()
                                Store (0x00, \_SB.PCI0.LPCB.UBLE)
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
                            Store (0x00, \_SB.PCI0.LPCB.UBLE)
                        }

                        Name (_PRS, ResourceTemplate ()
                        {
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02F8,             // Range Minimum
                                    0x02F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {0}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02F8,             // Range Minimum
                                    0x02F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {0}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02F8,             // Range Minimum
                                    0x02F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {1}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02F8,             // Range Minimum
                                    0x02F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {1}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02F8,             // Range Minimum
                                    0x02F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02F8,             // Range Minimum
                                    0x02F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03F8,             // Range Minimum
                                    0x03F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {0}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03F8,             // Range Minimum
                                    0x03F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {0}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03F8,             // Range Minimum
                                    0x03F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {1}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03F8,             // Range Minimum
                                    0x03F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {1}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03F8,             // Range Minimum
                                    0x03F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03F8,             // Range Minimum
                                    0x03F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {3}
                            }
                            EndDependentFn ()
                        })
                        Method (_CRS, 0, NotSerialized)
                        {
                            Name (DCRS, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
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
                            If (LEqual (ADRM, 0x03))
                            {
                                If (LEqual (ADRL, 0xF8))
                                {
                                    Store (0x00, UBDR)
                                }
                                Else
                                {
                                    Store (0x07, UBDR)
                                }
                            }
                            Else
                            {
                                If (LEqual (ADRL, 0xF8))
                                {
                                    Store (0x01, UBDR)
                                }
                                Else
                                {
                                    Store (0x05, UBDR)
                                }
                            }

                            Store (0x01, \_SB.PCI0.LPCB.UBLE)
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
                        Name (_HID, EisaId ("PNP0501"))
                        Method (_STA, 0, NotSerialized)
                        {
                            If (\_SB.DOCK)
                            {
                                ENFG (0x03)
                                If (LEqual (Z005, 0x00))
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

                            If (LEqual (Local0, 0x00))
                            {
                                \_SB.PCI0.LPCB.SIO.COMA._DIS ()
                                Store (0x00, \_SB.PCI0.LPCB.UALE)
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
                            Store (0x00, \_SB.PCI0.LPCB.UALE)
                        }

                        Name (_PRS, ResourceTemplate ()
                        {
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03F8,             // Range Minimum
                                    0x03F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02F8,             // Range Minimum
                                    0x02F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03E8,             // Range Minimum
                                    0x03E8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02E8,             // Range Minimum
                                    0x02E8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03F8,             // Range Minimum
                                    0x03F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02F8,             // Range Minimum
                                    0x02F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03E8,             // Range Minimum
                                    0x03E8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02E8,             // Range Minimum
                                    0x02E8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
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
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
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
                            Store (0x55, P80H)
                            CreateByteField (Arg0, 0x02, ADRL)
                            CreateByteField (Arg0, 0x03, ADRM)
                            CreateWordField (Arg0, 0x09, IRQM)
                            FindSetRightBit (IRQM, Local0)
                            Decrement (Local0)
                            If (LEqual (ADRM, 0x03))
                            {
                                If (LEqual (ADRL, 0xF8))
                                {
                                    Store (0x00, UADR)
                                }
                                Else
                                {
                                    Store (0x07, UADR)
                                }
                            }
                            Else
                            {
                                If (LEqual (ADRL, 0xF8))
                                {
                                    Store (0x01, UADR)
                                }
                                Else
                                {
                                    Store (0x05, UADR)
                                }
                            }

                            Store (0x01, \_SB.PCI0.LPCB.UALE)
                            ENFG (0x03)
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
                            If (LAnd (LEqual (Local2, 0x00), LOr (LEqual (Local0, 0x04), LEqual (
                                Local0, 0x07))))
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
                            If (LAnd (LEqual (LPTE, 0x00), LOr (LEqual (Local0, 0x04), LEqual (
                                Local0, 0x07))))
                            {
                                If (ACTR)
                                {
                                    Store (0x00, ACTR)
                                    Store (0x00, INTR)
                                    Store (0x00, IOAH)
                                    Store (0x00, IOAL)
                                    Store (0x00, DMCH)
                                }

                                Store (0x00, \_SB.PCI0.LPCB.LPLE)
                            }

                            EXFG ()
                        }

                        Name (_PRS, ResourceTemplate ()
                        {
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0378,             // Range Minimum
                                    0x0378,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0778,             // Range Minimum
                                    0x0778,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {7}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0278,             // Range Minimum
                                    0x0278,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0678,             // Range Minimum
                                    0x0678,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {5}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0378,             // Range Minimum
                                    0x0378,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0778,             // Range Minimum
                                    0x0778,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {5}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0278,             // Range Minimum
                                    0x0278,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0678,             // Range Minimum
                                    0x0678,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {7}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0378,             // Range Minimum
                                    0x0378,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0778,             // Range Minimum
                                    0x0778,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {7}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {1}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0278,             // Range Minimum
                                    0x0278,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0678,             // Range Minimum
                                    0x0678,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {5}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {1}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0378,             // Range Minimum
                                    0x0378,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0778,             // Range Minimum
                                    0x0778,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {5}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {1}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0278,             // Range Minimum
                                    0x0278,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0678,             // Range Minimum
                                    0x0678,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {7}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {1}
                            }
                            EndDependentFn ()
                        })
                        Method (_CRS, 0, NotSerialized)
                        {
                            Name (DCRS, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {7}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
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
                            Store (0x00, \_SB.PCI0.LPCB.LPLE)
                            If (LEqual (ADRM, 0x03))
                            {
                                Store (0x00, LPDR)
                            }
                            Else
                            {
                                Store (0x01, LPDR)
                            }

                            Store (0x01, \_SB.PCI0.LPCB.LPLE)
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
                            If (LAnd (LEqual (Local2, 0x00), LOr (LEqual (Local0, 0x02), LEqual (
                                Local0, 0x03))))
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
                            If (LAnd (LEqual (LPTE, 0x00), LOr (LEqual (Local0, 0x02), LEqual (
                                Local0, 0x03))))
                            {
                                If (ACTR)
                                {
                                    Store (0x00, ACTR)
                                    Store (0x00, INTR)
                                    Store (0x00, IOAH)
                                    Store (0x00, IOAL)
                                }

                                Store (0x00, \_SB.PCI0.LPCB.LPLE)
                            }

                            EXFG ()
                        }

                        Name (_PRS, ResourceTemplate ()
                        {
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0378,             // Range Minimum
                                    0x0378,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0778,             // Range Minimum
                                    0x0778,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {7}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0278,             // Range Minimum
                                    0x0278,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0678,             // Range Minimum
                                    0x0678,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {5}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0378,             // Range Minimum
                                    0x0378,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0778,             // Range Minimum
                                    0x0778,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {5}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0278,             // Range Minimum
                                    0x0278,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0678,             // Range Minimum
                                    0x0678,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
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
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
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
                            Store (0x00, \_SB.PCI0.LPCB.LPLE)
                            If (LEqual (ADRM, 0x03))
                            {
                                Store (0x00, LPDR)
                            }
                            Else
                            {
                                Store (0x01, LPDR)
                            }

                            Store (0x01, \_SB.PCI0.LPCB.LPLE)
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

                                Store (0x00, \_SB.PCI0.LPCB.LPLE)
                            }

                            EXFG ()
                        }

                        Name (_PRS, ResourceTemplate ()
                        {
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0378,             // Range Minimum
                                    0x0378,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0778,             // Range Minimum
                                    0x0778,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {7}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0278,             // Range Minimum
                                    0x0278,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0678,             // Range Minimum
                                    0x0678,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {5}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0378,             // Range Minimum
                                    0x0378,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0778,             // Range Minimum
                                    0x0778,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {5}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0278,             // Range Minimum
                                    0x0278,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0678,             // Range Minimum
                                    0x0678,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {7}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03BC,             // Range Minimum
                                    0x03BC,             // Range Maximum
                                    0x04,               // Alignment
                                    0x04,               // Length
                                    )
                                IO (Decode16,
                                    0x07BC,             // Range Minimum
                                    0x07BC,             // Range Maximum
                                    0x04,               // Alignment
                                    0x04,               // Length
                                    )
                                IRQNoFlags ()
                                    {7}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03BC,             // Range Minimum
                                    0x03BC,             // Range Maximum
                                    0x04,               // Alignment
                                    0x04,               // Length
                                    )
                                IO (Decode16,
                                    0x07BC,             // Range Minimum
                                    0x07BC,             // Range Maximum
                                    0x04,               // Alignment
                                    0x04,               // Length
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
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
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
                            Store (0x00, \_SB.PCI0.LPCB.LPLE)
                            If (LEqual (ADRM, 0x03))
                            {
                                If (LEqual (ADRL, 0xBC))
                                {
                                    Store (0x02, LPDR)
                                }
                                Else
                                {
                                    Store (0x00, LPDR)
                                }
                            }
                            Else
                            {
                                Store (0x01, LPDR)
                            }

                            Store (0x01, \_SB.PCI0.LPCB.LPLE)
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

                                Store (0x00, \_SB.PCI0.LPCB.LPLE)
                            }

                            EXFG ()
                        }

                        Name (_PRS, ResourceTemplate ()
                        {
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0378,             // Range Minimum
                                    0x0378,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0778,             // Range Minimum
                                    0x0778,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {7}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0278,             // Range Minimum
                                    0x0278,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0678,             // Range Minimum
                                    0x0678,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {5}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0378,             // Range Minimum
                                    0x0378,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0778,             // Range Minimum
                                    0x0778,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {5}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0278,             // Range Minimum
                                    0x0278,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0678,             // Range Minimum
                                    0x0678,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {7}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03BC,             // Range Minimum
                                    0x03BC,             // Range Maximum
                                    0x04,               // Alignment
                                    0x04,               // Length
                                    )
                                IO (Decode16,
                                    0x07BC,             // Range Minimum
                                    0x07BC,             // Range Maximum
                                    0x04,               // Alignment
                                    0x04,               // Length
                                    )
                                IRQNoFlags ()
                                    {7}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03BC,             // Range Minimum
                                    0x03BC,             // Range Maximum
                                    0x04,               // Alignment
                                    0x04,               // Length
                                    )
                                IO (Decode16,
                                    0x07BC,             // Range Minimum
                                    0x07BC,             // Range Maximum
                                    0x04,               // Alignment
                                    0x04,               // Length
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
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
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
                            Store (0x00, \_SB.PCI0.LPCB.LPLE)
                            If (LEqual (ADRM, 0x03))
                            {
                                If (LEqual (ADRL, 0xBC))
                                {
                                    Store (0x02, LPDR)
                                }
                                Else
                                {
                                    Store (0x00, LPDR)
                                }
                            }
                            Else
                            {
                                Store (0x01, LPDR)
                            }

                            Store (0x01, \_SB.PCI0.LPCB.LPLE)
                            ENFG (0x01)
                            Store (Local0, INTR)
                            Store (ADRM, IOAH)
                            Store (ADRL, IOAL)
                            Store (0x01, ACTR)
                            EXFG ()
                        }
                    }
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
                            /* 0000 */    0x78, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 
                            /* 0008 */    0x78, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 
                            /* 0010 */    0x1F, 0x00, 0x00, 0x00
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
                            And (PRIT, 0xC0F0, PRIT)
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
                            And (PRIT, 0xBF0F, PRIT)
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
                                /* 0000 */    0x03, 0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF, 0x03, 
                                /* 0008 */    0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF
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

                    Device (P_D1)
                    {
                        Name (_ADR, 0x01)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Name (PIB1, Buffer (0x0E)
                            {
                                /* 0000 */    0x03, 0x00, 0x00, 0x00, 0x00, 0xB0, 0xEF, 0x03, 
                                /* 0008 */    0x00, 0x00, 0x00, 0x00, 0xB0, 0xEF
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
                                    Add (And (PSIT, 0x03), ShiftRight (And (PSIT, 0x0C), 
                                        0x02), Local0)
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
                        ,   2, 
                    P2E,    1, 
                    P3E,    1, 
                        ,   2, 
                    P2P,    1, 
                    P3P,    1
                }

                Device (PRID)
                {
                    Name (_ADR, 0x00)
                    Method (_GTM, 0, NotSerialized)
                    {
                        Return (Buffer (0x14)
                        {
                            /* 0000 */    0x78, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 
                            /* 0008 */    0x78, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 
                            /* 0010 */    0x1F, 0x00, 0x00, 0x00
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
                            And (PRIT, 0xC0F0, PRIT)
                            And (SYNC, 0x0E, SYNC)
                            Store (0x00, SDT0)
                            And (ICR0, 0x0E, ICR0)
                            And (ICR1, 0x0E, ICR1)
                            And (ICR3, 0x0E, ICR3)
                            And (ICR5, 0x0E, ICR5)
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

                                Or (ICR1, 0x01, ICR1)
                            }
                        }

                        If (LEqual (SizeOf (Arg2), 0x0200))
                        {
                            And (PRIT, 0xBF0F, PRIT)
                            Store (0x00, PSIT)
                            And (SYNC, 0x0D, SYNC)
                            Store (0x00, SDT1)
                            And (ICR0, 0x0D, ICR0)
                            And (ICR1, 0x0D, ICR1)
                            And (ICR3, 0x0D, ICR3)
                            And (ICR5, 0x0D, ICR5)
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

                                Or (ICR1, 0x02, ICR1)
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
                                /* 0000 */    0x03, 0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF, 0x03, 
                                /* 0008 */    0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF
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

                    Device (PBAY)
                    {
                        Name (_ADR, 0x01)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Name (PIB1, Buffer (0x0E)
                            {
                                /* 0000 */    0x03, 0x00, 0x00, 0x00, 0x00, 0xB0, 0xEF, 0x03, 
                                /* 0008 */    0x00, 0x00, 0x00, 0x00, 0xB0, 0xEF
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
                                    Add (And (PSIT, 0x03), ShiftRight (And (PSIT, 0x0C), 
                                        0x02), Local0)
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

        OperationRegion (SMI1, SystemMemory, 0x1F69CE2D, 0x00000120)
        Field (SMI1, AnyAcc, NoLock, Preserve)
        {
            BCMD,   8, 
            DID,    32, 
            INF,    8
        }

        Field (SMI1, AnyAcc, NoLock, Preserve)
        {
                    Offset (0x50), 
            BLK0,   64, 
            BLK1,   64, 
            BLK2,   64, 
            BLK3,   64, 
            BLK4,   64, 
                    Offset (0x110), 
            BTEN,   1, 
            WLAN,   1, 
            DOCK,   1, 
            IDEC,   1, 
            TPMS,   1
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

                If (LEqual (OSYS, 0x07D0))
                {
                    If (ACST)
                    {
                        \_SB.PHSR (0x10, 0x01)
                    }
                    Else
                    {
                        \_SB.PHSR (0x10, 0x00)
                    }
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
                0xFFFFFFFF, 
                0xFFFFFFFF, 
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
                    Store ("PRESPAL", Index (PBIF, 0x09))
                    If (LEqual (Local3, 0x01))
                    {
                        Store ("PRESP41", Index (PBIF, 0x09))
                    }

                    If (LEqual (Local3, 0x02))
                    {
                        Store ("EFL50-09", Index (PBIF, 0x09))
                    }

                    If (LEqual (Local3, 0x03))
                    {
                        Store ("PRESP31", Index (PBIF, 0x09))
                    }

                    If (LEqual (Local3, 0x04))
                    {
                        Store ("PRESP32", Index (PBIF, 0x09))
                    }

                    If (LEqual (Local3, 0x05))
                    {
                        Store ("PRESP33", Index (PBIF, 0x09))
                    }

                    If (LEqual (Local3, 0x06))
                    {
                        Store ("PRESP43", Index (PBIF, 0x09))
                    }

                    If (LEqual (Local3, 0x07))
                    {
                        Store ("PRESP42", Index (PBIF, 0x09))
                    }

                    If (LEqual (Local3, 0x08))
                    {
                        Store ("PRESP51", Index (PBIF, 0x09))
                    }

                    If (LEqual (Local3, 0x09))
                    {
                        Store ("PRESP52", Index (PBIF, 0x09))
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
                            If (LOr (LEqual (Local4, 0x03), LEqual (Local4, 0x05)))
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
                                    Else
                                    {
                                        Store ("UNKNOWN", Index (PBIF, 0x0C))
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
                        Store (Local2, Index (PBST, 0x03))
                    }

                    If (LAnd (Local3, 0x8000))
                    {
                        If (LNotEqual (Local3, 0xFFFF))
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

            Method (Z003, 0, NotSerialized)
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

                    XOr (LIDP, 0x01, LIDP)
                }
                Else
                {
                    Store (LIDP, Local0)
                }

                Return (Local0)
            }

            Scope (\_GPE)
            {
                Method (_L1E, 0, NotSerialized)
                {
                    Notify (\_SB.LID, 0x80)
                }
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
                    Return (Add (Multiply (0x63, 0x0A), 0x0AAC))
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
                    Return (Add (Multiply (0x69, 0x0A), 0x0AAC))
                }
            }
        }

        Scope (\_SB)
        {
            Device (WMID)
            {
                Name (_HID, "PNP0C14")
                Name (_UID, 0x00)
                Name (WMIQ, 0x00)
                Name (ERRD, 0x00010000)
                Name (BUFF, Buffer (0x04)
                {
                    0x00, 0x00, 0x00, 0x00
                })
                CreateByteField (BUFF, 0x00, BF00)
                CreateByteField (BUFF, 0x01, BF01)
                CreateByteField (BUFF, 0x02, BF02)
                CreateByteField (BUFF, 0x03, BF03)
                Name (AADS, Buffer (0x04)
                {
                    0x00
                })
                CreateField (AADS, 0x00, 0x04, AS00)
                CreateField (AADS, 0x04, 0x01, AS01)
                CreateField (AADS, 0x05, 0x01, AS02)
                CreateField (AADS, 0x10, 0x10, AS03)
                CreateField (AADS, 0x00, 0x10, AS04)
                Name (BAEF, 0x00)
                Name (BADF, 0x00)
                Name (BADG, Package (0x03)
                {
                    0x00010000, 
                    0x00010000, 
                    0x00010000
                })
                Name (BADS, Package (0x04)
                {
                    0x01, 
                    0x01, 
                    0x01, 
                    0x01
                })
                Name (WLDS, 0x00)
                Name (WLED, 0x00)
                Name (BTDS, 0x00)
                Name (BTED, 0x00)
                Name (BLDS, 0x00)
                Name (BLED, 0x00)
                Name (NTDC, 0x00)
                Name (WLSD, 0x0100)
                Name (WLSE, 0x0101)
                Name (BLTD, 0x0200)
                Name (BLTE, 0x0201)
                Name (LBL0, 0x0300)
                Name (LBL1, 0x0301)
                Name (LBL2, 0x0302)
                Name (LBL3, 0x0303)
                Name (LBL4, 0x0304)
                Name (LBL5, 0x0305)
                Name (LBL6, 0x0306)
                Name (LBL7, 0x0307)
                Name (LBL8, 0x0308)
                Name (LBL9, 0x0309)
                Name (LBLA, 0x030A)
                Name (LBLB, 0x030B)
                Name (LBLC, 0x030C)
                Name (LBLD, 0x030D)
                Name (LBLE, 0x030E)
                Name (LBLF, 0x030F)
                Name (VAPO, 0x0600)
                Name (VAPI, 0x0601)
                Name (CADI, 0x0401)
                Name (CADO, 0x0400)
                Name (GSEE, 0x0501)
                Name (GSED, 0x0502)
                Name (BBSB, Buffer (0x04)
                {
                    0x00, 0x00, 0x00, 0x00
                })
                CreateField (BBSB, 0x00, 0x10, BBD0)
                CreateField (BBSB, 0x10, 0x10, BBD1)
                Name (TLS0, 0x00)
                Name (TLS1, 0x01)
                Name (TLS2, 0x02)
                Name (TLS3, 0x03)
                Name (TLS4, 0x04)
                Name (TLS5, 0x05)
                Name (TLS6, 0x06)
                Name (TLS7, 0x07)
                Name (BBPD, Buffer (0x14)
                {
                    /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0010 */    0x00, 0x00, 0x00, 0x00
                })
                CreateByteField (BBPD, 0x00, BBP0)
                CreateByteField (BBPD, 0x04, BBP1)
                CreateByteField (BBPD, 0x08, BBP2)
                CreateByteField (BBPD, 0x0C, BBP3)
                CreateByteField (BBPD, 0x10, BBP4)
                Name (BBAR, Buffer (0x08)
                {
                    /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                })
                CreateByteField (BBAR, 0x00, BBA0)
                CreateByteField (BBAR, 0x04, BBA1)
                Name (BCDS, Package (0x0D)
                {
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000
                })
                Name (BDDS, Buffer (0x04)
                {
                    0x00, 0x00, 0x00, 0x00
                })
                CreateField (BDDS, 0x00, 0x10, BDD0)
                CreateField (BDDS, 0x10, 0x10, BDD1)
                Name (DSY0, Buffer (0x28)
                {
                    /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0010 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0018 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0020 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                })
                Name (DSY1, Buffer (0x18)
                {
                    /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0010 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                })
                Name (DSY2, Buffer (0x10)
                {
                    /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                })
                Name (DSY3, Buffer (0x18)
                {
                    /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0010 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                })
                Name (DSY4, Buffer (0x10)
                {
                    /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                })
                Name (DSY5, Buffer (0x28)
                {
                    /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0010 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0018 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0020 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                })
                CreateField (DSY0, 0x00, 0x40, DY00)
                CreateField (DSY0, 0x40, 0x40, DY01)
                CreateField (DSY0, 0x80, 0x40, DY02)
                CreateField (DSY0, 0xC0, 0x40, DY03)
                CreateField (DSY0, 0x0100, 0x40, DY04)
                CreateField (DSY1, 0x00, 0x40, DY10)
                CreateField (DSY1, 0x40, 0x40, DY11)
                CreateField (DSY1, 0x80, 0x40, DY12)
                CreateField (DSY2, 0x00, 0x40, DY20)
                CreateField (DSY2, 0x40, 0x10, DY21)
                CreateField (DSY2, 0x50, 0x10, DY22)
                CreateField (DSY0, 0x00, 0xC0, DSX4)
                Name (BEDS, Package (0x10)
                {
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000
                })
                Name (WIT0, 0x00)
                Name (DSY6, Buffer (0x14)
                {
                    /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0010 */    0x00, 0x00, 0x00, 0x00
                })
                CreateField (DSY6, 0x00, 0x20, DY60)
                CreateField (DSY6, 0x20, 0x20, DY61)
                CreateField (DSY6, 0x40, 0x20, DY62)
                CreateField (DSY6, 0x60, 0x20, DY63)
                CreateField (DSY6, 0x80, 0x20, DY64)
                Name (WPRW, Buffer (0x14)
                {
                    /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0010 */    0x00, 0x00, 0x00, 0x00
                })
                CreateField (WPRW, 0x00, 0x08, WWD0)
                CreateField (WPRW, 0x08, 0x08, WWD1)
                CreateField (WPRW, 0x10, 0x08, WWD2)
                CreateField (WPRW, 0x18, 0x08, WWD3)
                CreateField (WPRW, 0x20, 0x08, WWD4)
                CreateField (WPRW, 0x28, 0x20, WWD5)
                Name (WPCI, Buffer (0x04)
                {
                    0x00, 0x00, 0x00, 0x00
                })
                CreateField (WPCI, 0x00, 0x08, WPIR)
                CreateField (WPCI, 0x08, 0x03, WPIF)
                CreateField (WPCI, 0x0B, 0x05, WPID)
                CreateField (WPCI, 0x10, 0x08, WPIB)
                Name (BFDS, Package (0x04)
                {
                    0x02, 
                    0x02, 
                    0x02, 
                    0x02
                })
                Name (GSTS, 0x00)
                Name (BFEF, 0x00)
                Name (BGEF, 0x00)
                Name (BGDS, Package (0x01)
                {
                    0x01
                })
                Method (PHSR, 2, NotSerialized)
                {
                    Acquire (\_SB.PSMX, 0xFFFF)
                    Store (0x91, BCMD)
                    Store (Arg0, DID)
                    Store (Arg1, INF)
                    Store (Zero, SMIC)
                    Store (DID, Local0)
                    Release (\_SB.PSMX)
                    Return (Local0)
                }

                Method (AAF1, 0, NotSerialized)
                {
                    Store (\_SB.WMID.PHSR (0x00, 0x00), AS04)
                    Store (0x00, AS03)
                }

                Method (Z006, 1, NotSerialized)
                {
                    While (One)
                    {
                        Name (_T_0, 0x00)
                        Store (Arg0, _T_0)
                        If (LEqual (_T_0, 0x01))
                        {
                            Store (\_SB.WMID.PHSR (0x01, 0x00), BUFF)
                        }
                        Else
                        {
                            If (LEqual (_T_0, 0x02))
                            {
                                Store (\_SB.WMID.PHSR (0x01, 0x01), BUFF)
                            }
                            Else
                            {
                                If (LEqual (_T_0, 0x03))
                                {
                                    Store (\_SB.WMID.PHSR (0x01, 0x02), BUFF)
                                }
                                Else
                                {
                                    Store (0x01, BUFF)
                                }
                            }
                        }

                        Break
                    }
                }

                Method (Z007, 2, NotSerialized)
                {
                    Store (Arg1, BUFF)
                    If (LEqual (BF00, 0x00))
                    {
                        Store (0x00, Local0)
                    }
                    Else
                    {
                        Store (0x01, Local0)
                    }

                    While (One)
                    {
                        Name (_T_0, 0x00)
                        Store (Arg0, _T_0)
                        If (LEqual (_T_0, 0x04))
                        {
                            Or (Local0, 0x10, Local0)
                            Store (\_SB.WMID.PHSR (0x02, Local0), BUFF)
                        }
                        Else
                        {
                            If (LEqual (_T_0, 0x05))
                            {
                                Or (Local0, 0x20, Local0)
                                Store (\_SB.WMID.PHSR (0x02, Local0), BUFF)
                            }
                            Else
                            {
                                If (LEqual (_T_0, 0x06))
                                {
                                    Or (BF00, 0x40, Local0)
                                    Store (\_SB.WMID.PHSR (0x02, Local0), BUFF)
                                }
                                Else
                                {
                                    Store (0x01, BUFF)
                                }
                            }
                        }

                        Break
                    }
                }

                Method (Z008, 0, NotSerialized)
                {
                    Store (\_SB.WMID.WMIQ, Local0)
                    Store (0x00, \_SB.WMID.WMIQ)
                    While (One)
                    {
                        Name (_T_0, 0x00)
                        Store (Local0, _T_0)
                        If (LEqual (_T_0, 0x01))
                        {
                            Return (WLSE)
                        }
                        Else
                        {
                            If (LEqual (_T_0, 0x02))
                            {
                                Return (WLSD)
                            }
                            Else
                            {
                                If (LEqual (_T_0, 0x03))
                                {
                                    Return (BLTE)
                                }
                                Else
                                {
                                    If (LEqual (_T_0, 0x04))
                                    {
                                        Return (BLTD)
                                    }
                                    Else
                                    {
                                        If (LEqual (_T_0, 0x05))
                                        {
                                            Store (0x85, P80H)
                                            Store (\_SB.WMID.PHSR (0x01, 0x02), Local1)
                                            And (Local1, 0x0F, Local1)
                                            And (LBL0, 0x0F00, LBL0)
                                            Or (Local1, LBL0, LBL0)
                                            Store (LBL0, P80H)
                                            Return (LBL0)
                                        }
                                        Else
                                        {
                                            If (LEqual (_T_0, 0x06))
                                            {
                                                Store (0x0501, BUFF)
                                                Return (BUFF)
                                            }
                                            Else
                                            {
                                                If (LEqual (_T_0, 0x07))
                                                {
                                                    Store (0x0502, BUFF)
                                                    Return (BUFF)
                                                }
                                                Else
                                                {
                                                    If (LEqual (_T_0, 0x08))
                                                    {
                                                        Return (VAPO)
                                                    }
                                                    Else
                                                    {
                                                        If (LEqual (_T_0, 0x09))
                                                        {
                                                            Return (VAPI)
                                                        }
                                                        Else
                                                        {
                                                            If (LEqual (_T_0, 0x0A))
                                                            {
                                                                Store (0x0501, BUFF)
                                                                Return (BUFF)
                                                            }
                                                            Else
                                                            {
                                                                Return (0xFFFF)
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }

                        Break
                    }
                }

                Method (Z009, 2, NotSerialized)
                {
                    Store (Arg1, BUFF)
                    And (BF00, 0x0F, Local0)
                    If (LEqual (Arg0, 0x02))
                    {
                        ShiftLeft (Local0, 0x01, Local0)
                        Or (Local0, 0x10, Local0)
                    }

                    Store (\_SB.WMID.PHSR (0x03, Local0), BBSB)
                }

                Method (Z00A, 1, NotSerialized)
                {
                    Store (\_SB.WMID.PHSR (0x10, Arg0), BUFF)
                    Store (BF00, BBP0)
                    Store (BF01, BBP1)
                    Store (BF02, BBP2)
                    Store (And (BF03, 0x0F), BBP3)
                    Store (ShiftRight (And (BF03, 0xF0), 0x04), BBP4)
                }

                Method (Z00B, 2, NotSerialized)
                {
                }

                Method (Z00C, 1, NotSerialized)
                {
                    \_SB.WMID.PHSR (0x04, Arg0)
                    Store (BLK0, DY00)
                    Store (BLK1, DY01)
                    Store (BLK2, DY02)
                    Store (BLK3, DY03)
                    Store (0x00, DY04)
                }

                Method (Z00D, 1, NotSerialized)
                {
                    Store (DY10, BLK0)
                    If (LEqual (Arg0, 0x03))
                    {
                        Store (DY11, BLK1)
                        Store (DY12, BLK2)
                    }

                    Store (\_SB.WMID.PHSR (0x05, Arg0), Local0)
                    Store (BLK0, DY10)
                    Store (BLK1, DY11)
                    If (Local0)
                    {
                        Store (0x01, DY12)
                    }
                    Else
                    {
                        Store (0x00, DY12)
                    }
                }

                Method (Z00E, 1, NotSerialized)
                {
                    Store (\_SB.WMID.PHSR (0x06, Arg0), BUFF)
                }

                Method (Z00F, 0, NotSerialized)
                {
                }

                Method (Z00G, 2, NotSerialized)
                {
                    Store (DSY4, DSY2)
                    Store (0x01, DY22)
                    If (LEqual (Arg0, 0x08)) {}
                    Else
                    {
                    }
                }

                Method (Z00H, 0, NotSerialized)
                {
                    Store (\_SB.WMID.PHSR (0x07, 0x00), BUFF)
                }

                Method (Z00I, 1, NotSerialized)
                {
                    While (One)
                    {
                        Name (_T_0, 0x00)
                        Store (Arg0, _T_0)
                        If (LEqual (_T_0, 0x01))
                        {
                            Store (\_SB.BAT1._STA (), Local0)
                            If (And (Local0, 0x10))
                            {
                                Store (0x00, BUFF)
                            }
                            Else
                            {
                                Store (0x00020000, BUFF)
                            }
                        }
                        Else
                        {
                            If (LEqual (_T_0, 0x02))
                            {
                                Store (0x00010000, BUFF)
                            }
                            Else
                            {
                                Store (0x00010000, BUFF)
                            }
                        }

                        Break
                    }
                }

                Method (Z00J, 1, NotSerialized)
                {
                    If (\_SB.ECOK)
                    {
                        Acquire (\_SB.PCI0.LPCB.EC0.MUT1, 0xFFFF)
                        Store (\_SB.PCI0.LPCB.EC0.MTMP, Local0)
                        Store (\_SB.PCI0.LPCB.EC0.ATMP, Local1)
                        Release (\_SB.PCI0.LPCB.EC0.MUT1)
                    }
                    Else
                    {
                        Store (0x1388, Local0)
                        Store (0x1388, Local1)
                    }

                    Z00K (Arg0, Local0, Local1)
                }

                Method (Z00L, 1, NotSerialized)
                {
                    If (\_SB.ECOK)
                    {
                        Acquire (\_SB.PCI0.LPCB.EC0.MUT1, 0xFFFF)
                        Store (\_SB.PCI0.LPCB.EC0.MCUR, Local0)
                        Store (\_SB.PCI0.LPCB.EC0.ABCR, Local1)
                        Release (\_SB.PCI0.LPCB.EC0.MUT1)
                    }
                    Else
                    {
                        Store (0x00, Local0)
                        Store (0x00, Local1)
                    }

                    Z00K (Arg0, Local0, Local1)
                }

                Method (Z00M, 1, NotSerialized)
                {
                    If (\_SB.ECOK)
                    {
                        Acquire (\_SB.PCI0.LPCB.EC0.MUT1, 0xFFFF)
                        Store (\_SB.PCI0.LPCB.EC0.MBVG, Local0)
                        Store (\_SB.PCI0.LPCB.EC0.ABVG, Local1)
                        Release (\_SB.PCI0.LPCB.EC0.MUT1)
                    }
                    Else
                    {
                        Store (0x00, Local0)
                        Store (0x00, Local1)
                    }

                    Z00K (Arg0, Local0, Local1)
                }

                Method (Z00N, 1, NotSerialized)
                {
                    If (\_SB.ECOK)
                    {
                        Acquire (\_SB.PCI0.LPCB.EC0.MUT1, 0xFFFF)
                        Store (\_SB.PCI0.LPCB.EC0.MBRM, Local0)
                        Store (\_SB.PCI0.LPCB.EC0.ABRM, Local1)
                        Release (\_SB.PCI0.LPCB.EC0.MUT1)
                    }
                    Else
                    {
                        Store (0x00, Local0)
                        Store (0x00, Local1)
                    }

                    Z00K (Arg0, Local0, Local1)
                }

                Method (Z00O, 1, NotSerialized)
                {
                    If (\_SB.ECOK)
                    {
                        Acquire (\_SB.PCI0.LPCB.EC0.MUT1, 0xFFFF)
                        Store (\_SB.PCI0.LPCB.EC0.LFCC, Local0)
                        Store (\_SB.PCI0.LPCB.EC0.AFCC, Local1)
                        Release (\_SB.PCI0.LPCB.EC0.MUT1)
                    }
                    Else
                    {
                        Store (0x00, Local0)
                        Store (0x00, Local1)
                    }

                    Z00K (Arg0, Local0, Local1)
                }

                Method (Z00P, 1, NotSerialized)
                {
                    If (\_SB.ECOK)
                    {
                        Acquire (\_SB.PCI0.LPCB.EC0.MUT1, 0xFFFF)
                        Store (\_SB.PCI0.LPCB.EC0.MCYC, Local0)
                        Store (\_SB.PCI0.LPCB.EC0.ACYC, Local1)
                        Release (\_SB.PCI0.LPCB.EC0.MUT1)
                    }
                    Else
                    {
                        Store (0x00, Local0)
                        Store (0x00, Local1)
                    }

                    Z00K (Arg0, Local0, Local1)
                }

                Method (Z00Q, 1, NotSerialized)
                {
                    If (\_SB.ECOK)
                    {
                        Acquire (\_SB.PCI0.LPCB.EC0.MUT1, 0xFFFF)
                        Store (\_SB.PCI0.LPCB.EC0.BTDC, Local0)
                        Store (\_SB.PCI0.LPCB.EC0.ABDC, Local1)
                        Release (\_SB.PCI0.LPCB.EC0.MUT1)
                    }
                    Else
                    {
                        Store (0x00, Local0)
                        Store (0x00, Local1)
                    }

                    Z00K (Arg0, Local0, Local1)
                }

                Method (Z00R, 1, NotSerialized)
                {
                    If (\_SB.ECOK)
                    {
                        Acquire (\_SB.PCI0.LPCB.EC0.MUT1, 0xFFFF)
                        Store (\_SB.PCI0.LPCB.EC0.BTDV, Local0)
                        Store (\_SB.PCI0.LPCB.EC0.ABDV, Local1)
                        Release (\_SB.PCI0.LPCB.EC0.MUT1)
                    }
                    Else
                    {
                        Store (0x00, Local0)
                        Store (0x00, Local1)
                    }

                    Z00K (Arg0, Local0, Local1)
                }

                Method (Z00S, 1, NotSerialized)
                {
                    If (\_SB.ECOK)
                    {
                        Acquire (\_SB.PCI0.LPCB.EC0.MUT1, 0xFFFF)
                        Store (\_SB.PCI0.LPCB.EC0.MDAT, Local0)
                        Store (\_SB.PCI0.LPCB.EC0.ADAT, Local1)
                        Release (\_SB.PCI0.LPCB.EC0.MUT1)
                    }
                    Else
                    {
                        Store (0x00, Local0)
                        Store (0x00, Local1)
                    }

                    Z00K (Arg0, Local0, Local1)
                }

                Method (Z00T, 1, NotSerialized)
                {
                    If (\_SB.ECOK)
                    {
                        Acquire (\_SB.PCI0.LPCB.EC0.MUT1, 0xFFFF)
                        Store (\_SB.PCI0.LPCB.EC0.BTSN, Local0)
                        Store (\_SB.PCI0.LPCB.EC0.ABSN, Local1)
                        Release (\_SB.PCI0.LPCB.EC0.MUT1)
                    }
                    Else
                    {
                        Store (0x00, Local0)
                        Store (0x00, Local1)
                    }

                    Z00K (Arg0, Local0, Local1)
                }

                Method (Z00K, 3, NotSerialized)
                {
                    While (One)
                    {
                        Name (_T_0, 0x00)
                        Store (Arg0, _T_0)
                        If (LEqual (_T_0, 0x01))
                        {
                            Store (\_SB.BAT1._STA (), Local2)
                            If (And (Local2, 0x10))
                            {
                                Store (Arg1, Local3)
                            }
                            Else
                            {
                                Store (0xFFFF, Local3)
                            }
                        }
                        Else
                        {
                            If (LEqual (_T_0, 0x02))
                            {
                                Store (\_SB.BAT1._STA (), Local2)
                                If (And (Local2, 0x10))
                                {
                                    Store (Arg2, Local3)
                                }
                                Else
                                {
                                    Store (0xFFFF, Local3)
                                }
                            }
                            Else
                            {
                                Store (Arg1, Local3)
                            }
                        }

                        Break
                    }

                    If (LEqual (Local3, 0xFFFF))
                    {
                        Store (0x00020000, BUFF)
                    }
                    Else
                    {
                        Store (Local3, Index (BEDS, 0x01))
                        Store (DerefOf (Index (BEDS, 0x01)), BUFF)
                    }
                }

                Method (Z00U, 1, NotSerialized)
                {
                    Store (And (Arg0, 0x01), Local0)
                    If (LLessEqual (Local0, 0x01))
                    {
                        Store (\_SB.WMID.PHSR (0x08, Arg0), BUFF)
                    }
                    Else
                    {
                        Store (0x02, BUFF)
                    }
                }

                Method (Z00V, 1, NotSerialized)
                {
                    Store (\_SB.WMID.PHSR (0x09, Arg0), BUFF)
                }

                Method (Z00W, 1, NotSerialized)
                {
                    Store (And (Arg0, 0x01), Local0)
                    If (LLessEqual (Local0, 0x01))
                    {
                        Store (\_SB.WMID.PHSR (0x0A, Arg0), BUFF)
                    }
                    Else
                    {
                        Store (0x02, BUFF)
                    }
                }

                Method (Z00X, 1, NotSerialized)
                {
                    Store (\_SB.WMID.PHSR (0x0B, Arg0), BUFF)
                }

                Method (Z00Y, 1, NotSerialized)
                {
                    Store (Arg0, Local0)
                    If (LEqual (Local0, 0x01))
                    {
                        \_SB.WMID.PHSR (0x0D, Local0)
                    }

                    Store (0x00, BUFF)
                }

                Method (Z00Z, 1, NotSerialized)
                {
                    Store (\_SB.WMID.PHSR (0x0E, Arg0), BUFF)
                }

                Method (Z010, 0, NotSerialized)
                {
                    Store (\_SB.WMID.PHSR (0x0F, 0x00), BUFF)
                }

                Name (_WDG, Buffer (0xDC)
                {
                    0x09, 0x4E, 0x76, 0x95, 0x56, 0xFB, 0x83, 0x4E, 
                    0xB3, 0x1A, 0x37, 0x76, 0x1F, 0x60, 0x99, 0x4A, 
                    0x41, 0x41, 
                    0x01, 
                    0x01, 

                    0x58, 0xF2, 0xF4, 0x6A, 0x01, 0xB4, 0xFD, 0x42,
                    0xBE, 0x91, 0x3D, 0x4A, 0xC2, 0xD7, 0xC0, 0xD3, 
                    0x42, 0x41, 
                    0x01, 0x02, 

                    0xAC, 0x61, 0x1A, 0xCC, 0x56, 0x42, 0xA3, 0x41, 
                    0xB9, 0xE0, 0x05, 0xA4, 0x45, 0xAD, 0xE2, 0xF5, 
                    0x80, 0x00, 
                    0x01, 
                    0x08, 

                    0x53, 0x44, 0x8C, 0xE7, 0x27, 0x02, 0x61, 0x48, 
                    0x9E, 0xDE, 0xF5, 0x60, 0x0B, 0x4A, 0x3D, 0x39, 
                    0x42, 0x42, 
                    0x01, 
                    0x02, 

                    0x7B, 0x4F, 0xE0, 0xAA, 0xC5, 0xB3, 0x65, 0x48, 
                    0x95, 0xD6, 0x9F, 0xAC, 0x7F, 0xF3, 0xE9, 0x2B, 
                    0x42, 0x43,
                    0x01, 
                    0x02, 

                    0x79, 0x4C, 0xF9, 0xCF, 0x77, 0x6C, 0xF7, 0x4A, 
                    0xAC, 0x56, 0x7D, 0xD0, 0xCE, 0x01, 0xC9, 0x97, 
                    0x42, 0x44, 
                    0x01, 
                    0x02, 

                    0xC5, 0x2E, 0x77, 0x79, 0xB1, 0x04, 0xFD, 0x4B, 
                    0x84, 0x3C, 0x61, 0xE7, 0xF7, 0x7B, 0x6C, 0xC9, 
                    0x42, 0x45, 
                    0x01, 
                    0x02, 

                    0xB7, 0xA0, 0xC9, 0xA7, 0x9D, 0x4C, 0x72, 0x4C, 
                    0x83, 0xBB, 0x53, 0xA3, 0x45, 0x91, 0x71, 0xDF, 
                    0x42, 0x46, 
                    0x01, 
                    0x02, 

                    0x4F, 0x06, 0x3A, 0x65, 0x3A, 0xA2, 0x5F, 0x48, 
                    0xB3, 0xD9, 0x13, 0xF6, 0x53, 0x2A, 0x01, 0x82, 
                    0x42, 0x47, 
                    0x01, 
                    0x02, 

                    0xA7, 0xB1, 0x85, 0xDB, 0x9A, 0x06, 0xBB, 0x4A, 
                    0xA2, 0xB5, 0xD1, 0x86, 0xA2, 0x1B, 0x80, 0xF1, 
                    0x81, 0x00, 
                    0x01, 
                    0x08, 

                    0x91, 0x6B, 0x91, 0x36, 0x64, 0x1A, 0x83, 0x45, 
                    0x84, 0xD0, 0x53, 0x83, 0x0F, 0xB9, 0x10, 0x8D, 
                    0x82, 0x00, 
                    0x01, 
                    0x08
                })
                Method (WQAA, 1, NotSerialized)
                {
                    AAF1 ()
                    Store (AADS, BUFF)
                    Return (BUFF)
                }

                Method (WMBA, 3, NotSerialized)
                {
                    If (LLess (Arg1, 0x04))
                    {
                        Z006 (Arg1)
                    }
                    Else
                    {
                        If (LEqual (Arg1, 0x07))
                        {
                            Store (Arg2, BUFF)
                            If (BF00)
                            {
                                Store (0x01, BAEF)
                            }
                            Else
                            {
                                Store (0x00, BAEF)
                            }

                            Store (0x00, BUFF)
                        }
                        Else
                        {
                            Z007 (Arg1, Arg2)
                        }
                    }

                    Return (BUFF)
                }

                Method (_WED, 1, NotSerialized)
                {
                    If (LEqual (Arg0, 0x81))
                    {
                        Return (Z008 ())
                    }
                    Else
                    {
                        If (LEqual (BAEF, 0x01))
                        {
                            If (LOr (LEqual (Arg0, 0x80), LEqual (Arg0, 0x82)))
                            {
                                Return (Z008 ())
                            }
                        }
                    }

                    Return (0xFFFF)
                }

                Method (WMBB, 3, NotSerialized)
                {
                    While (One)
                    {
                        Name (_T_0, 0x00)
                        Store (Arg1, _T_0)
                        If (LNotEqual (Match (Package (0x02)
                                        {
                                            0x01, 
                                            0x02
                                        }, MEQ, _T_0, MTR, 0x00, 0x00), Ones))
                        {
                            Z009 (Arg1, Arg2)
                            Store (BBSB, BUFF)
                            Return (BUFF)
                        }
                        Else
                        {
                            Store (0x1000, BUFF)
                            Return (BUFF)
                        }

                        Break
                    }
                }

                Method (WMBC, 3, NotSerialized)
                {
                    Z00B (Arg1, Arg2)
                    If (LLess (Arg1, 0x0A))
                    {
                        Subtract (Arg1, 0x01, Local0)
                        Store (DerefOf (Index (BCDS, Subtract (Arg1, 0x01))), BUFF)
                    }
                    Else
                    {
                        ShiftRight (DerefOf (Index (BCDS, Subtract (Arg1, 0x0A))), 0x10, 
                            BUFF)
                    }

                    Return (BUFF)
                }

                Method (WMBD, 3, NotSerialized)
                {
                    While (One)
                    {
                        Name (_T_0, 0x00)
                        Store (Arg1, _T_0)
                        If (LEqual (_T_0, 0x01))
                        {
                            Store (Arg2, BUFF)
                            Z00C (BF00)
                            Return (DSY0)
                        }
                        Else
                        {
                            If (LNotEqual (Match (Package (0x02)
                                            {
                                                0x02, 
                                                0x03
                                            }, MEQ, _T_0, MTR, 0x00, 0x00), Ones))
                            {
                                If (LEqual (Arg1, 0x02))
                                {
                                    Store (Arg2, DY10)
                                }
                                Else
                                {
                                    Store (Arg2, DSY1)
                                }

                                Z00D (Arg1)
                                Return (DSY1)
                            }
                            Else
                            {
                                If (LNotEqual (Match (Package (0x02)
                                                {
                                                    0x04, 
                                                    0x05
                                                }, MEQ, _T_0, MTR, 0x00, 0x00), Ones))
                                {
                                    Store (Arg1, Local0)
                                    If (LEqual (Local0, 0x04))
                                    {
                                        Store (Arg2, BUFF)
                                        If (LEqual (BF00, 0x01))
                                        {
                                            Or (Local0, 0x10, Local0)
                                        }
                                    }

                                    Z00E (Local0)
                                    If (LNotEqual (BF01, 0x00))
                                    {
                                        If (LEqual (Arg1, 0x04))
                                        {
                                            Store (0x01, BUFF)
                                        }
                                    }

                                    Return (BUFF)
                                }
                                Else
                                {
                                    If (LEqual (_T_0, 0x07))
                                    {
                                        Store (\_TZ.THRM._TMP (), Local0)
                                        Divide (Local0, 0x0A, , Local0)
                                        Store (Local0, Index (BCDS, 0x0B))
                                        Store (DerefOf (Index (BCDS, 0x0B)), BUFF)
                                        Return (BUFF)
                                    }
                                    Else
                                    {
                                        If (LEqual (_T_0, 0x0A))
                                        {
                                            Z00H ()
                                            Return (BUFF)
                                        }
                                        Else
                                        {
                                            If (LEqual (_T_0, 0x0B))
                                            {
                                                Store (Arg2, BBAR)
                                                Store (ShiftLeft (And (BBA1, 0x0F), 0x04), Local1)
                                                Or (And (BBA0, 0x0F), Local1, Local1)
                                                Store (Local1, P80H)
                                                Z00A (Local1)
                                                Return (BBPD)
                                            }
                                            Else
                                            {
                                            }
                                        }
                                    }
                                }
                            }
                        }

                        Break
                    }
                }

                Method (WMBE, 3, NotSerialized)
                {
                    While (One)
                    {
                        Name (_T_0, 0x00)
                        Store (Arg1, _T_0)
                        If (LEqual (_T_0, 0x01))
                        {
                            Z00I (Arg2)
                            Return (BUFF)
                        }
                        Else
                        {
                            If (LEqual (_T_0, 0x02))
                            {
                                Z00J (Arg2)
                                Return (BUFF)
                            }
                            Else
                            {
                                If (LEqual (_T_0, 0x03))
                                {
                                    Z00M (Arg2)
                                    Return (BUFF)
                                }
                                Else
                                {
                                    If (LEqual (_T_0, 0x04))
                                    {
                                        Z00L (Arg2)
                                        Return (BUFF)
                                    }
                                    Else
                                    {
                                        If (LEqual (_T_0, 0x05))
                                        {
                                            Z00N (Arg2)
                                            Return (BUFF)
                                        }
                                        Else
                                        {
                                            If (LEqual (_T_0, 0x06))
                                            {
                                                Z00O (Arg2)
                                                Return (BUFF)
                                            }
                                            Else
                                            {
                                                If (LEqual (_T_0, 0x07))
                                                {
                                                    Z00P (Arg2)
                                                    Return (BUFF)
                                                }
                                                Else
                                                {
                                                    If (LEqual (_T_0, 0x08))
                                                    {
                                                        Z00Q (Arg2)
                                                        Return (BUFF)
                                                    }
                                                    Else
                                                    {
                                                        If (LEqual (_T_0, 0x09))
                                                        {
                                                            Z00R (Arg2)
                                                            Return (BUFF)
                                                        }
                                                        Else
                                                        {
                                                            If (LEqual (_T_0, 0x0A))
                                                            {
                                                                Z00S (Arg2)
                                                                Return (BUFF)
                                                            }
                                                            Else
                                                            {
                                                                If (LEqual (_T_0, 0x0B))
                                                                {
                                                                    Z00T (Arg2)
                                                                    Return (BUFF)
                                                                }
                                                                Else
                                                                {
                                                                    If (LEqual (_T_0, 0x11))
                                                                    {
                                                                        Store (\_SB.WMID.PHSR (0x0C, 0x00), BUFF)
                                                                        Return (BUFF)
                                                                    }
                                                                    Else
                                                                    {
                                                                        If (LEqual (_T_0, 0x12))
                                                                        {
                                                                            Store (\_SB.WMID.PHSR (0x0C, 0x01), BUFF)
                                                                            Return (BUFF)
                                                                        }
                                                                        Else
                                                                        {
                                                                            Store (0x00010000, BUFF)
                                                                            Return (BUFF)
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }

                        Break
                    }
                }

                Method (WMBF, 3, NotSerialized)
                {
                    Store (Arg2, BUFF)
                    While (One)
                    {
                        Name (_T_0, 0x00)
                        Store (Arg1, _T_0)
                        If (LEqual (_T_0, 0x01))
                        {
                            Z00U (BF00)
                        }
                        Else
                        {
                            If (LEqual (_T_0, 0x02))
                            {
                                Z00V (BF00)
                            }
                            Else
                            {
                                If (LEqual (_T_0, 0x03))
                                {
                                    Z00W (BF00)
                                }
                                Else
                                {
                                    If (LEqual (_T_0, 0x05))
                                    {
                                        Z00Y (BF00)
                                    }
                                    Else
                                    {
                                        Store (0x02, BF00)
                                    }
                                }
                            }
                        }

                        Break
                    }

                    Store (0x00, BF01)
                    Store (0x00, BF02)
                    Store (0x00, BF03)
                    Return (BUFF)
                }

                Method (WMBG, 3, NotSerialized)
                {
                    While (One)
                    {
                        Name (_T_0, 0x00)
                        Store (Arg1, _T_0)
                        If (LEqual (_T_0, 0x01))
                        {
                            Store (Arg2, BUFF)
                            Z00Z (BF00)
                        }
                        Else
                        {
                            If (LEqual (_T_0, 0x02))
                            {
                                Z010 ()
                            }
                            Else
                            {
                                Store (0x00010000, BUFF)
                            }
                        }

                        Break
                    }

                    Store (0x00, BF01)
                    Store (0x00, BF02)
                    Store (0x00, BF03)
                    Return (BUFF)
                }
            }
        }
    }

    Name (FWSO, "FWSO")
}

