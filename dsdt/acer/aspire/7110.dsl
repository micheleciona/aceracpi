/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20061109
 *
 * Disassembly of 7110, Tue Jan  8 15:38:47 2008
 *
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x00006EFF (28415)
 *     Revision         0x01
 *     OEM ID           "INTEL "
 *     OEM Table ID     "CALISTGA"
 *     OEM Revision     0x06040000 (100925440)
 *     Creator ID       "MSFT"
 *     Creator Revision 0x0100000E (16777230)
 */
DefinitionBlock ("7110.aml", "DSDT", 1, "INTEL ", "CALISTGA", 0x06040000)
{
    External (PDC1)
    External (PDC0)
    External (CFGD)
    External (\_PR_.CPU0.CSTX)

    OperationRegion (PORT, SystemIO, 0x80, 0x01)
    Field (PORT, ByteAcc, NoLock, Preserve)
    {
        P80H,   8
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
                Offset (0x2C), 
            ,   1, 
        HOTP,   1, 
                Offset (0x42), 
            ,   1, 
        GPEC,   1
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
        GIV0,   8, 
        GIV1,   8, 
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
            ,   6, 
        GP38,   1, 
        GP39,   1, 
        GL05,   8, 
        GL06,   8, 
        GL07,   8
    }

    OperationRegion (GNVS, SystemMemory, 0x3F69FE4C, 0x0100)
    Field (GNVS, AnyAcc, Lock, Preserve)
    {
        OSYS,   16, 
        SMIF,   8, 
        PRM0,   8, 
        PRM1,   8, 
        SCIF,   8, 
        PRM2,   8, 
        PRM3,   8, 
        LCKF,   8, 
        PRM4,   8, 
        PRM5,   8, 
        P80D,   32, 
        LIDS,   8, 
        PWRS,   8, 
        DBGS,   8, 
        LINX,   8, 
                Offset (0x14), 
        ACTT,   8, 
        PSVT,   8, 
        TC1V,   8, 
        TC2V,   8, 
        TSPV,   8, 
        CRTT,   8, 
        DTSE,   8, 
        DTS1,   8, 
        DTS2,   8, 
                Offset (0x1E), 
        BNUM,   8, 
        B0SC,   8, 
        B1SC,   8, 
        B2SC,   8, 
        B0SS,   8, 
        B1SS,   8, 
        B2SS,   8, 
                Offset (0x28), 
        APIC,   8, 
        MPEN,   8, 
        PPCS,   8, 
        PPCM,   8, 
        PCP0,   8, 
        PCP1,   8, 
        C4EA,   8, 
                Offset (0x32), 
        NATP,   8, 
        CMAP,   8, 
        CMBP,   8, 
        LPTP,   8, 
        FDCP,   8, 
        CMCP,   8, 
        CIRP,   8, 
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
                Offset (0x66), 
        LDTD,   8, 
        BLCS,   8, 
        BRTL,   8, 
        ALSE,   8, 
        ALAF,   8, 
        LLOW,   8, 
        LHIH,   8, 
                Offset (0x6E), 
        EMAE,   8, 
        EMAP,   16, 
        EMAL,   16, 
                Offset (0x74), 
        MEFE,   8, 
                Offset (0x78), 
        TPMP,   8, 
        TPME,   8, 
                Offset (0x82), 
        GTF0,   56, 
        GTF2,   56, 
        IDEM,   8, 
                Offset (0x96), 
        WNVA,   32, 
        WNVB,   32, 
        WNVC,   32, 
        WNVD,   32, 
        WFLG,   32, 
        WNVS,   32, 
        WNVI,   32
    }

    OperationRegion (RCRB, SystemMemory, 0xFED1C000, 0x4000)
    Field (RCRB, DWordAcc, Lock, Preserve)
    {
                Offset (0x1000), 
                Offset (0x1E88), 
            ,   1, 
        TRP2,   15, 
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

    Mutex (MSMI, 0x07)
    Method (PHSR, 2, NotSerialized)
    {
        Acquire (MSMI, 0xFFFF)
        Store (Arg1, PRM0)
        Store (Arg0, SMIF)
        Store (Zero, TRP0)
        Store (PRM0, Local0)
        Release (MSMI)
        Return (Local0)
    }

    Method (HKEY, 1, NotSerialized)
    {
        PHSR (0x1E, Arg0)
    }

    Method (LAMN, 1, NotSerialized)
    {
        If (\_SB.AMW0.WLMP)
        {
            Store (Arg0, \_SB.AMW0.WLID)
            Notify (\_SB.AMW0, 0xB0)
        }
        Else
        {
            PHSR (0x1F, Arg0)
        }
    }

    Method (RBEC, 1, NotSerialized)
    {
        Return (PHSR (0x20, Arg0))
    }

    Method (WBEC, 2, NotSerialized)
    {
        Acquire (MSMI, 0xFFFF)
        Store (Arg1, PRM1)
        Store (Arg0, PRM0)
        Store (0x21, SMIF)
        Store (Zero, TRP0)
        Release (MSMI)
    }

    Method (MBEC, 3, NotSerialized)
    {
        Acquire (MSMI, 0xFFFF)
        Store (Arg2, PRM2)
        Store (Arg1, PRM1)
        Store (Arg0, PRM0)
        Store (0x22, SMIF)
        Store (Zero, TRP0)
        Release (MSMI)
    }

    Name (B2ED, Buffer (0x1C)
    {
        /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
        /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
        /* 0010 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
        /* 0018 */    0x00, 0x00, 0x00, 0x00
    })
    Method (WH15, 2, NotSerialized)
    {
        Acquire (MSMI, 0xFFFF)
        CreateDWordField (Arg1, 0x00, DEAX)
        CreateDWordField (Arg1, 0x04, DEBX)
        CreateDWordField (Arg1, 0x08, DECX)
        CreateDWordField (Arg1, 0x0C, DEDX)
        If (LEqual (\_SB.AMW0.WMID, 0x01))
        {
            CreateDWordField (Arg1, 0x10, DESI)
            CreateDWordField (Arg1, 0x14, DEDI)
            CreateDWordField (B2ED, 0x14, OESI)
            CreateDWordField (B2ED, 0x18, OEDI)
        }

        If (\_SB.AMW0.FIRE)
        {
            If (LEqual (DEAX, 0x9610))
            {
                If (LOr (LEqual (DEBX, 0x34), LEqual (DEBX, 0x0134)))
                {
                    Store (\_SB.AMW0.BSTS, Local5)
                }
            }

            If (LEqual (DEAX, 0x9610))
            {
                If (LOr (LEqual (DEBX, 0x35), LEqual (DEBX, 0x0135)))
                {
                    Store (\_SB.AMW0.WSTS, Local6)
                }
            }
        }

        Store (DEAX, WNVA)
        Store (DEBX, WNVB)
        Store (DECX, WNVC)
        Store (DEDX, WNVD)
        If (LEqual (\_SB.AMW0.WMID, 0x01))
        {
            Store (DESI, WNVS)
            Store (DEDI, WNVI)
        }

        Store (0x23, SMIF)
        Store (Zero, TRP0)
        Concatenate (WNVA, WNVB, Local0)
        Concatenate (WNVC, WNVD, Local1)
        Concatenate (Local0, Local1, B2ED)
        Store (WFLG, Index (B2ED, 0x10))
        If (LEqual (\_SB.AMW0.WMID, 0x01))
        {
            Store (WNVS, OESI)
            Store (WNVI, OEDI)
        }

        If (\_SB.AMW0.FIRE)
        {
            If (LEqual (DEAX, 0x9610))
            {
                If (LOr (LEqual (DEBX, 0x34), LEqual (DEBX, 0x0134)))
                {
                    If (LNotEqual (Local5, \_SB.AMW0.BSTS))
                    {
                        \_SB.AMW0.ACRN (0x02)
                    }
                }
            }

            If (LEqual (DEAX, 0x9610))
            {
                If (LOr (LEqual (DEBX, 0x35), LEqual (DEBX, 0x0135)))
                {
                    If (LNotEqual (Local6, \_SB.AMW0.WSTS))
                    {
                        \_SB.AMW0.ACRN (0x01)
                    }
                }
            }
        }

        Release (MSMI)
        Return (B2ED)
    }

    Method (I15H, 5, NotSerialized)
    {
        Acquire (MSMI, 0xFFFF)
        Store (Arg0, Local1)
        Store (Arg1, WNVA)
        Store (Arg2, WNVB)
        Store (Arg3, WNVC)
        Store (Arg4, WNVD)
        Store (0x23, SMIF)
        Store (Zero, TRP0)
        If (LEqual (Local1, 0x01))
        {
            Store (WNVA, Local0)
        }

        If (LEqual (Local1, 0x02))
        {
            Store (WNVB, Local0)
        }

        If (LEqual (Local1, 0x03))
        {
            Store (WNVC, Local0)
        }

        If (LEqual (Local1, 0x04))
        {
            Store (WNVD, Local0)
        }

        Release (MSMI)
        Return (Local0)
    }

    Name (B3ED, Buffer (0x28)
    {
        /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
        /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
        /* 0010 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
        /* 0018 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
        /* 0020 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    })
    Method (AWMI, 5, NotSerialized)
    {
        Acquire (MSMI, 0xFFFF)
        Store (Arg1, WNVA)
        Store (Arg2, WNVB)
        Store (Arg3, WNVC)
        Store (Arg4, WNVD)
        Store (Arg0, PRM0)
        Store (0x24, SMIF)
        Store (Zero, TRP0)
        If (LEqual (Arg0, 0x00))
        {
            Concatenate (WNVA, 0x00, Local0)
            Concatenate (WNVB, 0x00, Local1)
            Concatenate (WNVC, 0x00, Local2)
            Concatenate (WNVD, 0x00, Local3)
            Concatenate (Local3, Local2, Local4)
            Concatenate (Local1, Local0, Local5)
            Concatenate (Local4, Local5, B3ED)
            Store (0x00, Index (B3ED, 0x20))
        }

        If (LOr (LEqual (Arg0, 0x01), LEqual (Arg0, 0x02)))
        {
            Concatenate (WNVA, 0x00, Local0)
            Concatenate (WNVB, 0x00, Local1)
            Concatenate (Local0, Local1, B3ED)
            Store (0x00, Index (B3ED, 0x10))
        }

        If (LEqual (Arg0, 0x03))
        {
            Concatenate (WNVA, 0x00, B3ED)
            Store (0x00, Index (B3ED, 0x08))
        }

        Release (MSMI)
        Return (B3ED)
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
    Name (\WLPW, 0x00)
    Name (\WLLE, 0x00)
    Name (\BTPW, 0x00)
    Name (\BTLE, 0x00)
    Name (\EEPM, 0x00)
    Name (\CAST, 0x00)
    Name (\CIRT, 0x00)
    Method (\_PIC, 1, NotSerialized)
    {
        Store (Arg0, GPIC)
    }

    Name (FWSO, "FWSO")
    Name (_PSC, 0x00)
    Method (_PS0, 0, NotSerialized)
    {
        Store (_PSC, Local0)
        Store (0x00, _PSC)
    }

    Method (_PS3, 0, NotSerialized)
    {
        Store (0x03, _PSC)
    }

    Method (_PTS, 1, NotSerialized)
    {
        Store (Arg0, P80H)
        Store (0x01, \_SB.PCI0.LPCB.EC0.MUTE)
        If (LEqual (Arg0, 0x03))
        {
            Store (\_SB.PCI0.LPCB.EC0.CIRE, CIRT)
        }

        If (LEqual (Arg0, 0x04))
        {
            Store (0x01, \_SB.PCI0.LPCB.EC0.BLNK)
            Store (0x00, \_SB.PCI0.LPCB.EC0.CIRE)
        }

        If (LOr (LEqual (Arg0, 0x03), LEqual (Arg0, 0x04)))
        {
            Store (\_SB.PCI0.LPCB.EC0.WEPM, EEPM)
            Store (\_SB.PCI0.LPCB.EC0.CAME, CAST)
            Store (\_SB.PCI0.LPCB.EC0.WLEN, WLPW)
            Store (\_SB.PCI0.LPCB.EC0.BTEN, BTPW)
            Store (\_SB.PCI0.LPCB.EC0.WLLD, WLLE)
            Store (\_SB.PCI0.LPCB.EC0.BTLD, BTLE)
        }

        Store (0x00, \_SB.PCI0.LPCB.EC0.CAME)
        Store (0x00, \_SB.PCI0.LPCB.EC0.CIRE)
        Store (0x00, \_SB.PCI0.LPCB.EC0.WLEN)
        If (LEqual (Arg0, 0x05))
        {
            PHSR (0x28, 0x00)
        }
    }

    Method (_WAK, 1, NotSerialized)
    {
        Store (Arg0, P80H)
        If (LEqual (Arg0, 0x03))
        {
            Store (CIRT, \_SB.PCI0.LPCB.EC0.CIRE)
        }

        If (LOr (LEqual (Arg0, 0x03), LEqual (Arg0, 0x04)))
        {
            Store (EEPM, \_SB.PCI0.LPCB.EC0.WEPM)
            Store (CAST, \_SB.PCI0.LPCB.EC0.CAME)
            Store (WLPW, \_SB.PCI0.LPCB.EC0.WLEN)
            Store (BTPW, \_SB.PCI0.LPCB.EC0.BTEN)
            Store (WLLE, \_SB.PCI0.LPCB.EC0.WLLD)
            Store (BTLE, \_SB.PCI0.LPCB.EC0.BTLD)
        }

        Store (0x00, \_SB.PCI0.LPCB.EC0.MUTE)
        Store (0x00, \_SB.PCI0.LPCB.EC0.KTAF)
        Store (0x01, \_SB.PCI0.LPCB.EC0.KTEE)
        Notify (\_SB.PCI0.LPCB.EC0.BAT0, 0x81)
        If (LOr (LEqual (Arg0, 0x03), LEqual (Arg0, 0x04)))
        {
            If (And (CFGD, 0x01000000))
            {
                If (LAnd (And (CFGD, 0xF0), LEqual (OSYS, 0x07D1)))
                {
                    TRAP (0x3D)
                }
            }
        }

        If (LEqual (Arg0, 0x04)) {}
        If (LEqual (OSYS, 0x07D2))
        {
            If (And (CFGD, 0x01))
            {
                If (LGreater (PPCS, 0x00))
                {
                    Subtract (PPCS, 0x01, PPCS)
                    PNOT ()
                    Add (PPCS, 0x01, PPCS)
                    PNOT ()
                }
                Else
                {
                    Add (PPCS, 0x01, PPCS)
                    PNOT ()
                    Subtract (PPCS, 0x01, PPCS)
                    PNOT ()
                }
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
            Sleep (0x012C)
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
                    Notify (\_SB.PCI0.RP04, 0x00)
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
                    Notify (\_SB.PCI0.RP06, 0x00)
                }
                Else
                {
                    Store (0x01, \_SB.PCI0.RP06.HPCS)
                }
            }
        }

        Method (_L02, 0, NotSerialized)
        {
            Store (0x00, GPEC)
            Notify (\_TZ.TZS0, 0x80)
            Notify (\_TZ.TZS1, 0x80)
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
            If (HDAD)
            {
                Notify (\_SB.PCI0.MODM, 0x02)
            }
            Else
            {
                Notify (\_SB.PCI0.HDEF, 0x02)
            }
        }

        Method (_L07, 0, NotSerialized)
        {
            Store (0x20, \_SB.PCI0.SBUS.HSTS)
        }

        Method (_L08, 0, NotSerialized)
        {
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

        Method (_L19, 0, NotSerialized)
        {
            Store (0x19, P80H)
            Notify (\_SB.SLPB, 0x02)
        }
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

    Scope (\_TZ)
    {
        Name (TBSE, 0x0AAC)
        Name (CRT0, 0x00)
        Name (PSV0, 0x00)
        Name (PSVA, 0x00)
        ThermalZone (TZS0)
        {
            Method (_TMP, 0, NotSerialized)
            {
                If (\ECON)
                {
                    Store (\_SB.PCI0.LPCB.EC0.THS0, Local0)
                    Store (\_SB.PCI0.LPCB.EC0.KCSS, Local1)
                    Store (\_SB.PCI0.LPCB.EC0.KOSD, Local2)
                }
                Else
                {
                    Store (RBEC (0x92), Local0)
                    And (Local0, 0x01, Local1)
                    And (Local0, 0x08, Local2)
                    Store (RBEC (0xA8), Local0)
                }

                If (Local2)
                {
                    If (LLessEqual (Local0, CRT0))
                    {
                        Add (CRT0, 0x02, Local0)
                    }
                }

                Return (C2K (Local0))
            }

            Method (_CRT, 0, NotSerialized)
            {
                If (\ECON)
                {
                    Store (0x20, \_SB.PCI0.LPCB.EC0.TIID)
                    Store (\_SB.PCI0.LPCB.EC0.TSC0, Local0)
                }
                Else
                {
                    WBEC (0x01, 0x20)
                    Store (RBEC (0xD1), Local0)
                }

                If (LOr (LGreaterEqual (Local0, 0x80), LLess (Local0, 0x1E)))
                {
                    Store (0x78, Local0)
                }

                Store (Local0, CRT0)
                Return (C2K (Local0))
            }
        }

        ThermalZone (TZS1)
        {
            Method (_TMP, 0, NotSerialized)
            {
                If (\ECON)
                {
                    Store (\_SB.PCI0.LPCB.EC0.THS1, Local0)
                }
                Else
                {
                    Store (RBEC (0xA9), Local0)
                }

                Return (C2K (Local0))
            }

            Method (_CRT, 0, NotSerialized)
            {
                If (\ECON)
                {
                    Store (0x20, \_SB.PCI0.LPCB.EC0.TIID)
                    Store (\_SB.PCI0.LPCB.EC0.TSC1, Local0)
                }
                Else
                {
                    WBEC (0x01, 0x20)
                    Store (RBEC (0xD3), Local0)
                }

                If (LOr (LGreaterEqual (Local0, 0x80), LLess (Local0, 0x1E)))
                {
                    Store (0x78, Local0)
                }

                Return (C2K (Local0))
            }
        }

        Method (C2K, 1, NotSerialized)
        {
            Store (Arg0, Local0)
            If (LLessEqual (Local0, 0x10))
            {
                Store (0x1E, Local0)
            }

            If (LGreaterEqual (Local0, 0x7F))
            {
                Store (0x1E, Local0)
            }

            Add (Multiply (Local0, 0x0A), TBSE, Local0)
            Return (Local0)
        }

        Method (SPSV, 2, NotSerialized)
        {
            ShiftLeft (0x01, Arg0, Local0)
            If (Arg1)
            {
                Or (PSVA, Local0, PSVA)
            }
            Else
            {
                And (PSVA, Not (Local0), PSVA)
            }
        }
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
                    Store (0x01, LINX)
                }

                If (_OSI ("Windows 2001"))
                {
                    Store (0x07D1, OSYS)
                }

                If (_OSI ("Windows 2001 SP1"))
                {
                    Store (0x07D1, OSYS)
                }

                If (_OSI ("Windows 2001 SP2"))
                {
                    Store (0x07D2, OSYS)
                }

                If (_OSI ("Windows 2006"))
                {
                    Store (0x07D6, OSYS)
                }
            }

            If (LAnd (MPEN, LEqual (OSYS, 0x07D1)))
            {
                TRAP (0x3D)
            }

            TRAP (0x32)
        }

        Device (AMW0)
        {
            Name (_HID, "*pnp0c14")
            Name (_UID, 0x00)
            Name (WLMP, 0x00)
            Name (WMID, 0x00)
            Name (B0ED, Buffer (0x04)
            {
                0x00, 0x00, 0x00, 0x00
            })
            CreateDWordField (B0ED, 0x00, WLID)
            Name (B1ED, Buffer (0x04)
            {
                0x00, 0x00, 0x00, 0x00
            })
            Name (B2ED, Buffer (0x04)
            {
                0x00, 0x00, 0x00, 0x00
            })
            CreateDWordField (B2ED, 0x00, BUID)
            Name (_WDG, Buffer (0x0118)
            {
                /* 0000 */    0x81, 0x17, 0xF4, 0xD9, 0x33, 0xF6, 0x00, 0x44, 
                /* 0008 */    0x93, 0x55, 0x60, 0x17, 0x70, 0xBE, 0xC5, 0x10, 
                /* 0010 */    0x41, 0x41, 0x01, 0x00, 0x1D, 0x37, 0xC3, 0x67, 
                /* 0018 */    0xA3, 0x95, 0x37, 0x4C, 0xBB, 0x61, 0xDD, 0x47, 
                /* 0020 */    0xB4, 0x91, 0xDA, 0xAB, 0x41, 0x42, 0x01, 0x02, 
                /* 0028 */    0xED, 0x16, 0x1F, 0x43, 0x2B, 0x0C, 0x4C, 0x44, 
                /* 0030 */    0xB2, 0x67, 0x27, 0xDE, 0xB1, 0x40, 0xCF, 0x9C, 
                /* 0038 */    0x41, 0x43, 0x01, 0x02, 0x71, 0xBF, 0xD1, 0x40, 
                /* 0040 */    0x2D, 0xA8, 0x59, 0x4E, 0xA1, 0x68, 0x39, 0x85, 
                /* 0048 */    0xE0, 0x3B, 0x2E, 0x87, 0xB0, 0x00, 0x01, 0x08, 
                /* 0050 */    0x21, 0x12, 0x90, 0x05, 0x66, 0xD5, 0xD1, 0x11, 
                /* 0058 */    0xB2, 0xF0, 0x00, 0xA0, 0xC9, 0x06, 0x29, 0x10, 
                /* 0060 */    0x44, 0x44, 0x01, 0x00, 0x09, 0x4E, 0x76, 0x95, 
                /* 0068 */    0x56, 0xFB, 0x83, 0x4E, 0xB3, 0x1A, 0x37, 0x76, 
                /* 0070 */    0x1F, 0x60, 0x99, 0x4A, 0x43, 0x38, 0x01, 0x01, 
                /* 0078 */    0x58, 0xF2, 0xF4, 0x6A, 0x01, 0xB4, 0xFD, 0x42, 
                /* 0080 */    0xBE, 0x91, 0x3D, 0x4A, 0xC2, 0xD7, 0xC0, 0xD3, 
                /* 0088 */    0x43, 0x41, 0x01, 0x02, 0xAC, 0x61, 0x1A, 0xCC, 
                /* 0090 */    0x56, 0x42, 0xA3, 0x41, 0xB9, 0xE0, 0x05, 0xA4, 
                /* 0098 */    0x45, 0xAD, 0xE2, 0xF5, 0xB2, 0x00, 0x01, 0x08, 
                /* 00A0 */    0x53, 0x44, 0x8C, 0xE7, 0x27, 0x02, 0x61, 0x48, 
                /* 00A8 */    0x9E, 0xDE, 0xF5, 0x60, 0x0B, 0x4A, 0x3D, 0x39, 
                /* 00B0 */    0x43, 0x42, 0x01, 0x02, 0x7B, 0x4F, 0xE0, 0xAA, 
                /* 00B8 */    0xC5, 0xB3, 0x65, 0x48, 0x95, 0xD6, 0x9F, 0xAC, 
                /* 00C0 */    0x7F, 0xF3, 0xE9, 0x2B, 0x43, 0x43, 0x01, 0x02, 
                /* 00C8 */    0x79, 0x4C, 0xF9, 0xCF, 0x77, 0x6C, 0xF7, 0x4A, 
                /* 00D0 */    0xAC, 0x56, 0x7D, 0xD0, 0xCE, 0x01, 0xC9, 0x97, 
                /* 00D8 */    0x43, 0x44, 0x01, 0x02, 0xC5, 0x2E, 0x77, 0x79, 
                /* 00E0 */    0xB1, 0x04, 0xFD, 0x4B, 0x84, 0x3C, 0x61, 0xE7, 
                /* 00E8 */    0xF7, 0x7B, 0x6C, 0xC9, 0x43, 0x45, 0x01, 0x02, 
                /* 00F0 */    0x4F, 0x06, 0x3A, 0x65, 0x3A, 0xA2, 0x5F, 0x48, 
                /* 00F8 */    0xB3, 0xD9, 0x13, 0xF6, 0x53, 0x2A, 0x01, 0x82, 
                /* 0100 */    0x43, 0x46, 0x01, 0x02, 0x91, 0x6B, 0x91, 0x36, 
                /* 0108 */    0x64, 0x1A, 0x83, 0x45, 0x84, 0xD0, 0x53, 0x83, 
                /* 0110 */    0x0F, 0xB9, 0x10, 0x8D, 0xB4, 0x00, 0x01, 0x08
            })
            Method (_WED, 1, NotSerialized)
            {
                Store (Arg0, P80H)
                If (LEqual (Arg0, 0xB0))
                {
                    Return (B0ED)
                }

                If (LEqual (Arg0, 0xB2))
                {
                    GACR ()
                    Return (B2ED)
                }

                If (LEqual (Arg0, 0xB4))
                {
                    Return (B4ED)
                }
            }

            Method (WQAA, 1, NotSerialized)
            {
                Store (0xAA, P80H)
                Return (B1ED)
            }

            Method (WSAA, 2, NotSerialized)
            {
                Store (0xA1, P80H)
                CreateDWordField (Arg1, 0x00, DDD0)
                If (LEqual (DDD0, 0x01))
                {
                    Add (DDD0, 0x02, DDD0)
                    Store (DDD0, Index (B1ED, 0x00))
                }
            }

            Method (WMAB, 3, NotSerialized)
            {
                Store (0xAB, P80H)
                Store (0x01, WLMP)
                Store (0x00, WMID)
                Return (WH15 (Arg1, Arg2))
            }

            Method (WMAC, 3, NotSerialized)
            {
                Store (0xAC, P80H)
                Store (0x01, WLMP)
                Store (0x01, WMID)
                Return (WH15 (Arg1, Arg2))
            }

            Name (WQDD, Buffer (0x0560)
            {
                /* 0000 */    0x46, 0x4F, 0x4D, 0x42, 0x01, 0x00, 0x00, 0x00, 
                /* 0008 */    0x50, 0x05, 0x00, 0x00, 0x70, 0x1D, 0x00, 0x00, 
                /* 0010 */    0x44, 0x53, 0x00, 0x01, 0x1A, 0x7D, 0xDA, 0x54, 
                /* 0018 */    0x18, 0xCB, 0x8D, 0x00, 0x01, 0x06, 0x18, 0x42, 
                /* 0020 */    0x10, 0x09, 0x10, 0x8A, 0xE7, 0x80, 0x42, 0x04, 
                /* 0028 */    0x0A, 0x0D, 0xA1, 0x40, 0x30, 0x28, 0x38, 0x4B, 
                /* 0030 */    0x82, 0x90, 0x0B, 0x26, 0x26, 0x40, 0x08, 0x84, 
                /* 0038 */    0x24, 0x0A, 0x30, 0x2F, 0x40, 0xB7, 0x00, 0xC3, 
                /* 0040 */    0x02, 0x6C, 0x0B, 0x30, 0x2D, 0xC0, 0x31, 0x90, 
                /* 0048 */    0xFA, 0xF7, 0x87, 0x28, 0x0D, 0x44, 0x22, 0x20, 
                /* 0050 */    0xA9, 0x14, 0x08, 0x09, 0x15, 0xA0, 0x5C, 0x80, 
                /* 0058 */    0x6F, 0x01, 0xDA, 0x11, 0x25, 0x59, 0x80, 0x65, 
                /* 0060 */    0x18, 0x11, 0xD8, 0x2B, 0x32, 0x41, 0xE3, 0x04, 
                /* 0068 */    0xE5, 0x0C, 0x03, 0x05, 0x6F, 0xC0, 0x36, 0x05, 
                /* 0070 */    0x98, 0x1C, 0x04, 0x95, 0x3D, 0x08, 0x94, 0x0C, 
                /* 0078 */    0x08, 0x79, 0x14, 0x60, 0x15, 0x4E, 0xD3, 0x49, 
                /* 0080 */    0x60, 0xF7, 0x73, 0x91, 0x30, 0x18, 0x19, 0x13, 
                /* 0088 */    0xA0, 0x50, 0x80, 0x46, 0x01, 0xDE, 0x40, 0x64, 
                /* 0090 */    0x4B, 0x80, 0x41, 0x01, 0xE2, 0x04, 0x28, 0x83, 
                /* 0098 */    0x12, 0x4A, 0xB8, 0x83, 0x69, 0x4D, 0x80, 0x39, 
                /* 00A0 */    0x28, 0x82, 0x56, 0x1B, 0x98, 0x50, 0x3A, 0x03, 
                /* 00A8 */    0x12, 0x48, 0xAC, 0x16, 0xC1, 0x05, 0x13, 0x3B, 
                /* 00B0 */    0x6A, 0x94, 0x40, 0xD1, 0xDB, 0x1F, 0x04, 0x09, 
                /* 00B8 */    0xA7, 0x00, 0xA2, 0x06, 0x10, 0x45, 0x1A, 0x0D, 
                /* 00C0 */    0x6A, 0x44, 0x09, 0x0E, 0xCC, 0xA3, 0x39, 0xD5, 
                /* 00C8 */    0xCE, 0x05, 0x48, 0x9F, 0xAB, 0x40, 0x8E, 0xF5, 
                /* 00D0 */    0x34, 0xEA, 0x1C, 0x2E, 0x01, 0x49, 0x60, 0xAC, 
                /* 00D8 */    0x04, 0xB7, 0xEE, 0x21, 0xE2, 0x5D, 0x03, 0x6A, 
                /* 00E0 */    0xE2, 0x87, 0xC8, 0x04, 0xC1, 0xA1, 0x86, 0xE8, 
                /* 00E8 */    0xF1, 0x86, 0x3B, 0x81, 0xA3, 0x3E, 0x12, 0x06, 
                /* 00F0 */    0x71, 0x50, 0x47, 0x83, 0x39, 0x07, 0xD8, 0xE1, 
                /* 00F8 */    0x64, 0x34, 0xE3, 0x52, 0x05, 0x98, 0x1D, 0xBA, 
                /* 0100 */    0x46, 0x96, 0xE0, 0x78, 0x0C, 0x7D, 0xF6, 0xE7, 
                /* 0108 */    0xD3, 0x33, 0x24, 0x91, 0x3F, 0x08, 0xD4, 0xC8, 
                /* 0110 */    0x0C, 0xED, 0xA1, 0x9E, 0x56, 0xCC, 0x90, 0x4F, 
                /* 0118 */    0x01, 0x87, 0xC5, 0xC4, 0x42, 0x68, 0x93, 0x1A, 
                /* 0120 */    0x0F, 0xC4, 0xFF, 0xFF, 0x78, 0xC0, 0xA3, 0xF8, 
                /* 0128 */    0x68, 0x20, 0x84, 0x57, 0x82, 0xD8, 0x1E, 0x50, 
                /* 0130 */    0x82, 0x01, 0x21, 0xE4, 0x64, 0x3C, 0xA8, 0x51, 
                /* 0138 */    0x18, 0x35, 0xDC, 0x61, 0x1C, 0xB5, 0x8F, 0x0F, 
                /* 0140 */    0x3A, 0x3C, 0x50, 0x51, 0xC3, 0xA6, 0x67, 0x06, 
                /* 0148 */    0x7E, 0x5C, 0x60, 0xE7, 0x82, 0x98, 0x8F, 0x00, 
                /* 0150 */    0x1E, 0xC9, 0x09, 0xF9, 0x38, 0xE1, 0x81, 0xC1, 
                /* 0158 */    0x07, 0xC4, 0x7B, 0x9F, 0x32, 0x19, 0xC1, 0x99, 
                /* 0160 */    0x7A, 0x80, 0xE0, 0xB0, 0x3E, 0x7C, 0x02, 0xFC, 
                /* 0168 */    0xB2, 0xF0, 0xB0, 0x90, 0xC0, 0xF7, 0x07, 0x03, 
                /* 0170 */    0xE3, 0x46, 0x68, 0xBF, 0x02, 0x10, 0x82, 0x97, 
                /* 0178 */    0x79, 0x02, 0x90, 0x53, 0x04, 0x8D, 0xCD, 0xD0, 
                /* 0180 */    0x4F, 0x03, 0x2F, 0x0E, 0xE1, 0x83, 0x47, 0x38, 
                /* 0188 */    0xDF, 0x03, 0x38, 0x85, 0xC7, 0x00, 0x0F, 0xC1, 
                /* 0190 */    0x04, 0x16, 0x39, 0x02, 0x94, 0x98, 0x11, 0xA0, 
                /* 0198 */    0x8E, 0x0D, 0x27, 0x70, 0x3C, 0x61, 0x8F, 0xE0, 
                /* 01A0 */    0x78, 0xA2, 0x9C, 0xC4, 0x01, 0xF9, 0xA8, 0x61, 
                /* 01A8 */    0x84, 0xE0, 0xE5, 0x9E, 0x38, 0x88, 0xE6, 0x71, 
                /* 01B0 */    0x6A, 0x16, 0xEF, 0x00, 0x87, 0xC0, 0xC6, 0x84, 
                /* 01B8 */    0x3B, 0x40, 0x78, 0x08, 0x7C, 0x00, 0x8F, 0x1A, 
                /* 01C0 */    0xE7, 0x67, 0xA5, 0xB3, 0x42, 0x9E, 0x3B, 0xF8, 
                /* 01C8 */    0x98, 0xB0, 0x03, 0xE0, 0xD2, 0x0F, 0x27, 0x28, 
                /* 01D0 */    0xB1, 0xE7, 0x13, 0x50, 0xFC, 0xFF, 0xCF, 0x27, 
                /* 01D8 */    0xC0, 0x1E, 0xE4, 0x99, 0xE4, 0xED, 0xE4, 0x68, 
                /* 01E0 */    0x9E, 0x4B, 0x1E, 0x48, 0x9E, 0x48, 0x9E, 0x4F, 
                /* 01E8 */    0x8C, 0xF3, 0x66, 0xF2, 0x64, 0x10, 0xE1, 0xF9, 
                /* 01F0 */    0xC4, 0xD7, 0x14, 0x23, 0x44, 0x09, 0x19, 0xE8, 
                /* 01F8 */    0xE1, 0x24, 0x42, 0x94, 0x70, 0x81, 0xC2, 0x1A, 
                /* 0200 */    0x21, 0xC8, 0x63, 0xC1, 0x09, 0x1F, 0x76, 0xAC, 
                /* 0208 */    0x40, 0x61, 0x9E, 0x4F, 0x98, 0xF0, 0xA7, 0x86, 
                /* 0210 */    0x2C, 0x9C, 0x4F, 0x00, 0xBA, 0xFC, 0xFF, 0xCF, 
                /* 0218 */    0x27, 0x80, 0x33, 0x81, 0xE7, 0x13, 0x90, 0x0E, 
                /* 0220 */    0x8F, 0x1F, 0x4F, 0x80, 0xC9, 0x08, 0xB8, 0x16, 
                /* 0228 */    0x13, 0x87, 0x2F, 0xD4, 0xE3, 0xC0, 0xA7, 0x11, 
                /* 0230 */    0x40, 0xCE, 0x09, 0xE4, 0xFD, 0xE3, 0x38, 0x9F, 
                /* 0238 */    0x44, 0x7C, 0xF7, 0xF2, 0xFF, 0xFF, 0xE6, 0xE5, 
                /* 0240 */    0x83, 0xC8, 0x1B, 0xC8, 0xC1, 0x3E, 0x8D, 0xB0, 
                /* 0248 */    0x51, 0x05, 0x33, 0xCA, 0xE9, 0x47, 0x88, 0xFA, 
                /* 0250 */    0x52, 0x62, 0xC4, 0x08, 0xC1, 0x42, 0x05, 0x8A, 
                /* 0258 */    0x11, 0x35, 0xB2, 0x61, 0x23, 0xC4, 0x79, 0xF8, 
                /* 0260 */    0xA2, 0x0F, 0x06, 0x0D, 0xD5, 0xA7, 0x11, 0x80, 
                /* 0268 */    0x1F, 0xA7, 0x09, 0xDC, 0xE9, 0x02, 0x4C, 0x93, 
                /* 0270 */    0x38, 0x80, 0x28, 0x45, 0xC3, 0x68, 0x3A, 0x8F, 
                /* 0278 */    0x03, 0x01, 0x9F, 0x2F, 0x80, 0x89, 0xE2, 0x97, 
                /* 0280 */    0x9E, 0xCE, 0x27, 0xFE, 0xFF, 0xAB, 0x05, 0x91, 
                /* 0288 */    0x8D, 0xB5, 0x7A, 0x58, 0x34, 0xF3, 0x03, 0x48, 
                /* 0290 */    0xF0, 0xC5, 0x03, 0x6B, 0xD8, 0x27, 0x79, 0x16, 
                /* 0298 */    0x27, 0x99, 0x60, 0x56, 0x28, 0xC1, 0x7A, 0xD8, 
                /* 02A0 */    0x4E, 0x09, 0xA3, 0x04, 0x24, 0x1A, 0x8E, 0xA1, 
                /* 02A8 */    0xAD, 0x19, 0x46, 0x70, 0x06, 0xF1, 0x79, 0xC8, 
                /* 02B0 */    0x21, 0xCE, 0x31, 0x50, 0x8E, 0x0C, 0x1E, 0xC5, 
                /* 02B8 */    0x59, 0x3D, 0x07, 0x78, 0x8C, 0x8F, 0x0B, 0x6C, 
                /* 02C0 */    0x7C, 0x3E, 0x08, 0xF0, 0xC3, 0xA0, 0x6F, 0x06, 
                /* 02C8 */    0x46, 0xB6, 0x9A, 0xD3, 0x0C, 0x0A, 0xCC, 0xC7, 
                /* 02D0 */    0x0B, 0x4E, 0x50, 0xD7, 0xCD, 0x05, 0x64, 0x43, 
                /* 02D8 */    0x82, 0x79, 0x10, 0x38, 0x24, 0x30, 0x4F, 0xD5, 
                /* 02E0 */    0x43, 0x02, 0x1E, 0xE0, 0x87, 0x04, 0xE6, 0x2B, 
                /* 02E8 */    0x81, 0x87, 0x04, 0x2C, 0xFE, 0xFF, 0xA8, 0x07, 
                /* 02F0 */    0x71, 0x48, 0x60, 0x46, 0xF2, 0x90, 0xC0, 0xA6, 
                /* 02F8 */    0xEF, 0xC8, 0x01, 0x0A, 0x20, 0xDF, 0x30, 0x7C, 
                /* 0300 */    0xDC, 0x7B, 0xCA, 0x60, 0x63, 0x78, 0xE2, 0x33, 
                /* 0308 */    0x9A, 0xD1, 0xB9, 0xC4, 0xE5, 0xE8, 0x42, 0xC1, 
                /* 0310 */    0x45, 0xC1, 0xE8, 0x58, 0x60, 0x10, 0x4F, 0xCB, 
                /* 0318 */    0x51, 0xA6, 0x8A, 0x9E, 0x89, 0x7D, 0x9E, 0x42, 
                /* 0320 */    0xC8, 0x89, 0x82, 0x5F, 0xDD, 0x74, 0x9F, 0x81, 
                /* 0328 */    0x76, 0xF7, 0x08, 0xEA, 0x8B, 0x0A, 0x83, 0xF3, 
                /* 0330 */    0x64, 0x39, 0x9C, 0xAF, 0x14, 0xFC, 0xAE, 0xE3, 
                /* 0338 */    0xCB, 0x15, 0xF8, 0x46, 0x05, 0xF7, 0x50, 0xC1, 
                /* 0340 */    0x46, 0x05, 0xF6, 0xEB, 0x88, 0x47, 0x05, 0xD6, 
                /* 0348 */    0xFF, 0xFF, 0xA8, 0x60, 0x9D, 0x2B, 0xD8, 0xA8, 
                /* 0350 */    0xC0, 0x7E, 0x26, 0xF0, 0xA8, 0x80, 0xCB, 0xD1, 
                /* 0358 */    0x82, 0x8D, 0x0A, 0xEC, 0x1E, 0x46, 0x05, 0xCA, 
                /* 0360 */    0x20, 0xD7, 0x0F, 0x28, 0xD0, 0x8F, 0x96, 0xAF, 
                /* 0368 */    0x40, 0x0F, 0x41, 0x8F, 0x51, 0x1E, 0x14, 0xB8, 
                /* 0370 */    0x61, 0x7C, 0xDF, 0x03, 0x4E, 0x17, 0x10, 0x98, 
                /* 0378 */    0xF0, 0x18, 0xC1, 0x47, 0x18, 0xF2, 0xFF, 0x27, 
                /* 0380 */    0x28, 0x6B, 0x5C, 0xA8, 0xFB, 0x8A, 0xAF, 0x72, 
                /* 0388 */    0xEC, 0x3A, 0x85, 0xBB, 0x2A, 0x62, 0x60, 0x3D, 
                /* 0390 */    0x52, 0x0E, 0x6B, 0xB4, 0xB0, 0x07, 0xFC, 0xA6, 
                /* 0398 */    0xE5, 0x63, 0x9A, 0x67, 0x66, 0x8C, 0xB0, 0x1E, 
                /* 03A0 */    0xAD, 0x95, 0x92, 0xD2, 0x2B, 0x9F, 0x23, 0xDD, 
                /* 03A8 */    0xFA, 0x00, 0x41, 0x73, 0x79, 0x10, 0x78, 0xCE, 
                /* 03B0 */    0x7B, 0x4B, 0x78, 0x73, 0xF7, 0x59, 0xC2, 0xC7, 
                /* 03B8 */    0xBD, 0xC7, 0x82, 0x97, 0x80, 0x97, 0x81, 0xF7, 
                /* 03C0 */    0x92, 0x57, 0x5A, 0x76, 0xED, 0xF3, 0xAD, 0xCF, 
                /* 03C8 */    0x48, 0x0F, 0x80, 0x46, 0x09, 0x12, 0x23, 0xE6, 
                /* 03D0 */    0xFB, 0x89, 0x91, 0x1F, 0x6D, 0x7D, 0x69, 0xF0, 
                /* 03D8 */    0xBD, 0x2F, 0xC6, 0x5B, 0x1F, 0x8B, 0x77, 0xEB, 
                /* 03E0 */    0x03, 0x44, 0xFD, 0xFF, 0x6F, 0x7D, 0xC0, 0xFE, 
                /* 03E8 */    0x72, 0xF1, 0xD6, 0x07, 0x1C, 0x30, 0x23, 0xBE, 
                /* 03F0 */    0xF6, 0x01, 0x93, 0x34, 0x2B, 0xD0, 0x59, 0xC3, 
                /* 03F8 */    0x49, 0x40, 0x74, 0xED, 0xC3, 0xE9, 0x01, 0xD2, 
                /* 0400 */    0xB5, 0x0F, 0xAF, 0x03, 0x96, 0x8E, 0xDB, 0x0A, 
                /* 0408 */    0x60, 0x94, 0xE4, 0x58, 0x85, 0xD2, 0x7E, 0xAC, 
                /* 0410 */    0xA2, 0x20, 0x3E, 0xCE, 0xF8, 0xDA, 0x07, 0x58, 
                /* 0418 */    0xF9, 0xFF, 0x5F, 0xFB, 0x00, 0x26, 0x0E, 0x09, 
                /* 0420 */    0xE6, 0xF5, 0xE2, 0x09, 0xC7, 0x43, 0x02, 0xEB, 
                /* 0428 */    0x8D, 0xC6, 0x43, 0x82, 0xFB, 0xFF, 0x1F, 0x34, 
                /* 0430 */    0xD8, 0x86, 0x04, 0xE6, 0x8B, 0x9D, 0xAF, 0x8E, 
                /* 0438 */    0xC0, 0x59, 0xF6, 0x82, 0x75, 0x29, 0xE1, 0x42, 
                /* 0440 */    0x61, 0x74, 0xB4, 0x30, 0x88, 0x01, 0x7D, 0x75, 
                /* 0448 */    0x04, 0x7E, 0x17, 0x3E, 0xE0, 0x73, 0x75, 0x04, 
                /* 0450 */    0x0E, 0x17, 0x3E, 0xFC, 0xFF, 0xFF, 0xEA, 0x08, 
                /* 0458 */    0x38, 0xB8, 0xF1, 0x81, 0xF3, 0xEA, 0x08, 0xFC, 
                /* 0460 */    0x4C, 0x5C, 0x1D, 0x01, 0x1D, 0x2A, 0x46, 0x0E, 
                /* 0468 */    0x74, 0x4E, 0x31, 0x8C, 0xE0, 0xFF, 0x7F, 0x54, 
                /* 0470 */    0xE0, 0x06, 0xF6, 0xF1, 0x00, 0xD8, 0x8C, 0x0A, 
                /* 0478 */    0x18, 0x9C, 0x06, 0x7C, 0x09, 0x05, 0xBC, 0x2A, 
                /* 0480 */    0xB4, 0xE9, 0x53, 0xA3, 0x51, 0xAB, 0x06, 0x65, 
                /* 0488 */    0x6A, 0x94, 0x69, 0x50, 0xAB, 0x4F, 0xA5, 0xC6, 
                /* 0490 */    0x8C, 0x5D, 0x29, 0x13, 0x8C, 0xB1, 0x02, 0x8D, 
                /* 0498 */    0xC5, 0x22, 0x96, 0x23, 0x10, 0x87, 0x04, 0xA1, 
                /* 04A0 */    0x22, 0x1F, 0x43, 0x02, 0x71, 0x44, 0x10, 0x1A, 
                /* 04A8 */    0xE1, 0x4D, 0x23, 0x10, 0xC7, 0x5B, 0x9B, 0x40, 
                /* 04B0 */    0x2C, 0xEE, 0xA1, 0x21, 0x10, 0xFF, 0xFF, 0x83, 
                /* 04B8 */    0x3C, 0x23, 0x64, 0x04, 0x44, 0xA9, 0x40, 0x74, 
                /* 04C0 */    0x4B, 0x22, 0x6B, 0x12, 0x90, 0x95, 0x81, 0x08, 
                /* 04C8 */    0xC8, 0x81, 0x80, 0x68, 0x3A, 0x20, 0x2A, 0xEA, 
                /* 04D0 */    0x21, 0x20, 0x20, 0x2B, 0x04, 0x11, 0x90, 0xD5, 
                /* 04D8 */    0xD8, 0x00, 0x62, 0xDA, 0x40, 0x04, 0xE4, 0x5C, 
                /* 04E0 */    0x40, 0x34, 0x25, 0x10, 0x55, 0xA8, 0x03, 0x88, 
                /* 04E8 */    0xE9, 0x05, 0x11, 0x90, 0xB3, 0x02, 0xD1, 0xE4, 
                /* 04F0 */    0x40, 0x54, 0xB3, 0x0F, 0x20, 0x96, 0x00, 0x44, 
                /* 04F8 */    0x40, 0x4E, 0x4A, 0x23, 0x10, 0xEB, 0x54, 0x02, 
                /* 0500 */    0xC2, 0x52, 0xBD, 0x1D, 0x04, 0xE8, 0x88, 0x20, 
                /* 0508 */    0x02, 0xB2, 0xB2, 0x2F, 0xAB, 0x80, 0x2C, 0x13, 
                /* 0510 */    0x44, 0x40, 0x4E, 0x07, 0x44, 0xA3, 0x02, 0x51, 
                /* 0518 */    0x85, 0x56, 0x80, 0x98, 0x5C, 0x10, 0x01, 0x39, 
                /* 0520 */    0x25, 0x10, 0x8D, 0x0C, 0x44, 0x95, 0x6A, 0x01, 
                /* 0528 */    0x62, 0xB2, 0x41, 0x04, 0x64, 0x89, 0x5E, 0x80, 
                /* 0530 */    0x98, 0x60, 0x10, 0x01, 0x39, 0x2C, 0x10, 0x8D, 
                /* 0538 */    0x0E, 0x44, 0x65, 0xBF, 0x0A, 0x04, 0xE4, 0x10, 
                /* 0540 */    0x20, 0x3A, 0x25, 0x10, 0x33, 0x40, 0x4C, 0x0E, 
                /* 0548 */    0x88, 0x0E, 0x00, 0x04, 0x88, 0xC6, 0x02, 0xA2, 
                /* 0550 */    0x92, 0xFE, 0x5B, 0x02, 0xB2, 0x40, 0x10, 0x01, 
                /* 0558 */    0x39, 0x1C, 0x10, 0x8D, 0x0A, 0x44, 0xFF, 0xFF
            })
            Name (FIRE, 0x00)
            Name (CBE0, Buffer (0x04)
            {
                0x00, 0x00, 0x00, 0x00
            })
            CreateDWordField (CBE0, 0x00, BER4)
            CreateWordField (CBE0, 0x00, BUF0)
            CreateWordField (CBE0, 0x02, BER2)
            OperationRegion (RAM, EmbeddedControl, 0x00, 0xFF)
            Field (RAM, ByteAcc, Lock, Preserve)
            {
                CMD0,   8, 
                        Offset (0x02), 
                NBID,   8, 
                        Offset (0x08), 
                DAT0,   8, 
                DAT1,   8, 
                    ,   2, 
                WLED,   2, 
                BLED,   2, 
                        Offset (0x52), 
                WDEV,   1, 
                BDEV,   1, 
                WEPM,   1, 
                        Offset (0x70), 
                CRTS,   1, 
                KLID,   1, 
                    ,   3, 
                KACS,   1, 
                        Offset (0x71), 
                WSTS,   1, 
                BSTS,   1, 
                        Offset (0x82), 
                MSTP,   8, 
                CSTP,   7, 
                        Offset (0x88), 
                NB0A,   1, 
                        Offset (0x89), 
                NB1A,   1, 
                        Offset (0x95), 
                FAN1,   8, 
                        Offset (0xA8), 
                THS0,   8, 
                THS1,   8
            }

            Field (RAM, ByteAcc, Lock, Preserve)
            {
                        Offset (0xE0), 
                BSRC,   16, 
                BSFC,   16, 
                        Offset (0xE8), 
                BSVO,   16, 
                    ,   15, 
                BSCM,   1, 
                BSCU,   16, 
                BSBT,   16
            }

            Field (RAM, ByteAcc, Lock, Preserve)
            {
                        Offset (0xE0), 
                BSDC,   16, 
                BSDV,   16, 
                BSSN,   16, 
                        Offset (0xEE), 
                BSCY,   16
            }

            Field (RAM, ByteAcc, NoLock, Preserve)
            {
                        Offset (0xE2), 
                BSTF,   16, 
                BSTE,   16, 
                        Offset (0xEA), 
                BSMD,   16, 
                BSCC,   16, 
                BSME,   16
            }

            OperationRegion (PCNT, SystemIO, 0x1010, 0x04)
            Field (PCNT, ByteAcc, NoLock, Preserve)
            {
                    ,   1, 
                TDTY,   3, 
                T_EN,   1, 
                    ,   12, 
                T_ST,   1
            }

            Method (WQC8, 1, NotSerialized)
            {
                Store (0xC8, P80H)
                Store (0x00, Local0)
                If (WDEV)
                {
                    Store (WTYP (), Local0)
                }

                Store (BDEV, Local1)
                ShiftLeft (Local1, 0x04, Local1)
                Or (Local0, Local1, Local0)
                If (LGreaterEqual (MSTP, 0x0F))
                {
                    ShiftLeft (0x01, 0x05, Local1)
                    Or (Local0, Local1, Local0)
                }

                Store (0x00, BER2)
                Store (Local0, BUF0)
                Return (CBE0)
            }

            Method (WMCA, 3, NotSerialized)
            {
                Store (0xCA, P80H)
                CreateDWordField (Arg2, 0x00, CB04)
                CreateByteField (Arg2, 0x00, CB01)
                Store (0x00, BER2)
                If (LEqual (Arg1, 0x01))
                {
                    Store (WSTS, Local0)
                    Store (Local0, BUF0)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x02))
                {
                    Store (BSTS, Local0)
                    Store (Local0, BUF0)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x03))
                {
                    Store (CSTP, Local0)
                    Store (Local0, BUF0)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x04))
                {
                    If (WDEV)
                    {
                        If (CB04)
                        {
                            Store (0x01, Local0)
                        }
                        Else
                        {
                            Store (0x00, Local0)
                        }

                        Store (Local0, WSTS)
                    }

                    Store (0x00, BER4)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x05))
                {
                    If (BDEV)
                    {
                        If (CB04)
                        {
                            Store (0x01, Local0)
                        }
                        Else
                        {
                            Store (0x00, Local0)
                        }

                        Store (Local0, BSTS)
                        Store (Local0, BLED)
                    }

                    Store (0x00, BER4)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x06))
                {
                    Store (CB01, Local0)
                    If (LLessEqual (Local0, MSTP))
                    {
                        Store (Local0, CSTP)
                    }

                    Store (0x00, BER4)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x07))
                {
                    If (CB04)
                    {
                        Store (0x01, Local0)
                    }
                    Else
                    {
                        Store (0x00, Local0)
                    }

                    Store (Local0, FIRE)
                    Store (Local0, WEPM)
                    Store (0x00, BER4)
                    Return (CBE0)
                }
            }

            Method (WMCB, 3, NotSerialized)
            {
                Store (0xCB, P80H)
                CreateDWordField (Arg2, 0x00, CD04)
                CreateByteField (Arg2, 0x00, CD01)
                Store (0x00, BER2)
                If (LEqual (Arg1, 0x01))
                {
                    Store (0x00, Local0)
                    If (T_EN)
                    {
                        Store (TDTY, Local0)
                        If (LEqual (Local0, 0x00))
                        {
                            Store (0x04, Local0)
                        }
                    }

                    Store (Local0, BUF0)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x02))
                {
                    If (CD04)
                    {
                        Store (CD01, TDTY)
                        Store (0x01, T_EN)
                    }
                    Else
                    {
                        Store (0x00, T_EN)
                    }

                    Store (0x00, BER4)
                    Return (CBE0)
                }
            }

            Method (WMCC, 3, NotSerialized)
            {
                Store (0xCC, P80H)
            }

            Method (WMCD, 3, NotSerialized)
            {
                Store (0xCD, P80H)
                CreateDWordField (Arg2, 0x00, CD04)
                CreateByteField (Arg2, 0x00, CD01)
                Store (0x00, BER2)
                If (LEqual (Arg1, 0x01))
                {
                    Return (AWMI (0x00, CD04, 0x00, 0x00, 0x00))
                }

                If (LEqual (Arg1, 0x02))
                {
                    Return (AWMI (0x01, 0x00, 0x00, CD04, 0x00))
                }

                If (LEqual (Arg1, 0x03))
                {
                    CreateDWordField (Arg2, 0x08, CD08)
                    CreateDWordField (Arg2, 0x10, CD16)
                    Return (AWMI (0x02, CD08, 0x00, CD04, CD16))
                }

                If (LEqual (Arg1, 0x04))
                {
                    If (LEqual (C4EA, 0x01))
                    {
                        If (CD04)
                        {
                            Store (0x01, \_SB.PCI0.LPCB.C4C3)
                        }
                        Else
                        {
                            Store (0x00, \_SB.PCI0.LPCB.C4C3)
                        }
                    }

                    Store (0x00, BER4)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x05))
                {
                    Store (\_SB.PCI0.LPCB.C4C3, Local0)
                    Store (Local0, BUF0)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x06))
                {
                    Store (FAN1, Local0)
                    If (LEqual (Local0, 0xFF))
                    {
                        Store (0x00, Local0)
                    }
                    Else
                    {
                        Store (0x00078000, Local1)
                        Divide (Local1, Local0, Local2, Local0)
                    }

                    Store (Local0, BUF0)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x07))
                {
                    Store (THS0, Local0)
                    Add (Local0, 0x0111, Local0)
                    Store (Local0, BUF0)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x08))
                {
                    CreateByteField (Arg2, 0x00, PD00)
                    CreateDWordField (Arg2, 0x01, PD01)
                    Return (AWMI (0x03, PD00, PD01, 0x00, 0x00))
                }

                If (LEqual (Arg1, 0x09))
                {
                    CreateByteField (Arg2, 0x08, PD08)
                    CreateDWordField (Arg2, 0x09, PD09)
                    AWMI (0x04, PD08, PD09, CD04, 0x00)
                    Store (0x01, BER4)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x0A)) {}
            }

            Method (WMCE, 3, NotSerialized)
            {
                Store (0xCE, P80H)
                CreateDWordField (Arg2, 0x00, CD04)
                CreateByteField (Arg2, 0x00, CD01)
                If (LEqual (Arg1, 0x01))
                {
                    Store (GBID (CD04), Local2)
                    If (BER2)
                    {
                        Return (CBE0)
                    }

                    Acquire (\_SB.PCI0.LPCB.EC0.BATM, 0xFFFF)
                    And (Local2, 0xF0, NBID)
                    Store (BSCM, Local0)
                    Release (\_SB.PCI0.LPCB.EC0.BATM)
                    Store (Local0, BUF0)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x02))
                {
                    Store (GBID (CD04), Local2)
                    If (BER2)
                    {
                        Return (CBE0)
                    }

                    Acquire (\_SB.PCI0.LPCB.EC0.BATM, 0xFFFF)
                    And (Local2, 0xF0, NBID)
                    Store (BSBT, Local0)
                    Release (\_SB.PCI0.LPCB.EC0.BATM)
                    Store (Local0, BUF0)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x03))
                {
                    Store (GBID (CD04), Local2)
                    If (BER2)
                    {
                        Return (CBE0)
                    }

                    Acquire (\_SB.PCI0.LPCB.EC0.BATM, 0xFFFF)
                    And (Local2, 0xF0, NBID)
                    Store (BSVO, Local0)
                    Release (\_SB.PCI0.LPCB.EC0.BATM)
                    Store (Local0, BUF0)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x04))
                {
                    Store (GBID (CD04), Local2)
                    If (BER2)
                    {
                        Return (CBE0)
                    }

                    Acquire (\_SB.PCI0.LPCB.EC0.BATM, 0xFFFF)
                    And (Local2, 0xF0, NBID)
                    Store (BSCU, Local0)
                    Release (\_SB.PCI0.LPCB.EC0.BATM)
                    Store (Local0, BUF0)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x05))
                {
                    Store (GBID (CD04), Local2)
                    If (BER2)
                    {
                        Return (CBE0)
                    }

                    Acquire (\_SB.PCI0.LPCB.EC0.BATM, 0xFFFF)
                    And (Local2, 0xF0, NBID)
                    Store (BSRC, Local0)
                    Release (\_SB.PCI0.LPCB.EC0.BATM)
                    Store (Local0, BUF0)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x06))
                {
                    Store (GBID (CD04), Local2)
                    If (BER2)
                    {
                        Return (CBE0)
                    }

                    Acquire (\_SB.PCI0.LPCB.EC0.BATM, 0xFFFF)
                    And (Local2, 0xF0, NBID)
                    Store (BSFC, Local0)
                    Release (\_SB.PCI0.LPCB.EC0.BATM)
                    Store (Local0, BUF0)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x07))
                {
                    Store (GBID (CD04), Local2)
                    If (BER2)
                    {
                        Return (CBE0)
                    }

                    Acquire (\_SB.PCI0.LPCB.EC0.BATM, 0xFFFF)
                    Or (Local2, 0x01, NBID)
                    Store (BSCY, Local0)
                    Release (\_SB.PCI0.LPCB.EC0.BATM)
                    Store (Local0, BUF0)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x08))
                {
                    Store (GBID (CD04), Local2)
                    If (BER2)
                    {
                        Return (CBE0)
                    }

                    Acquire (\_SB.PCI0.LPCB.EC0.BATM, 0xFFFF)
                    Or (Local2, 0x01, NBID)
                    Store (BSDC, Local0)
                    Release (\_SB.PCI0.LPCB.EC0.BATM)
                    Store (Local0, BUF0)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x09))
                {
                    Store (GBID (CD04), Local2)
                    If (BER2)
                    {
                        Return (CBE0)
                    }

                    Acquire (\_SB.PCI0.LPCB.EC0.BATM, 0xFFFF)
                    Or (Local2, 0x01, NBID)
                    Store (BSDV, Local0)
                    Release (\_SB.PCI0.LPCB.EC0.BATM)
                    Store (Local0, BUF0)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x0A))
                {
                    Store (GBID (CD04), Local2)
                    If (BER2)
                    {
                        Return (CBE0)
                    }

                    Acquire (\_SB.PCI0.LPCB.EC0.BATM, 0xFFFF)
                    Or (Local2, 0x05, NBID)
                    Store (BSMD, Local0)
                    Release (\_SB.PCI0.LPCB.EC0.BATM)
                    Store (Local0, BUF0)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x0B))
                {
                    Store (GBID (CD04), Local2)
                    If (BER2)
                    {
                        Return (CBE0)
                    }

                    Acquire (\_SB.PCI0.LPCB.EC0.BATM, 0xFFFF)
                    Or (Local2, 0x01, NBID)
                    Store (BSSN, Local0)
                    Release (\_SB.PCI0.LPCB.EC0.BATM)
                    Store (Local0, BUF0)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x0C))
                {
                    Or (NB0A, NB1A, Local0)
                    If (LEqual (Local0, 0x00))
                    {
                        Store (0x03, BER2)
                        Return (CBE0)
                    }

                    If (CD04)
                    {
                        Store (0xEA, CMD0)
                    }
                    Else
                    {
                        Store (0xE9, CMD0)
                    }

                    Store (0x00, BER2)
                    Store (0x01, BUF0)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x0D)) {}
                If (LEqual (Arg1, 0x0E)) {}
                If (LEqual (Arg1, 0x0F))
                {
                    Store (GBID (CD04), Local2)
                    If (BER2)
                    {
                        Return (CBE0)
                    }

                    Acquire (\_SB.PCI0.LPCB.EC0.BATM, 0xFFFF)
                    Or (Local2, 0x05, NBID)
                    Store (BSTF, Local0)
                    Release (\_SB.PCI0.LPCB.EC0.BATM)
                    Store (Local0, BUF0)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x10))
                {
                    Store (GBID (CD04), Local2)
                    If (BER2)
                    {
                        Return (CBE0)
                    }

                    Acquire (\_SB.PCI0.LPCB.EC0.BATM, 0xFFFF)
                    Or (Local2, 0x05, NBID)
                    Store (BSME, Local0)
                    Release (\_SB.PCI0.LPCB.EC0.BATM)
                    Store (Local0, BUF0)
                    Return (CBE0)
                }
            }

            Method (GBID, 1, NotSerialized)
            {
                Store (0x00, Local1)
                If (LEqual (Arg0, 0x01))
                {
                    If (NB0A)
                    {
                        Store (0x00, Local0)
                    }
                    Else
                    {
                        Store (0x02, Local1)
                    }
                }
                Else
                {
                    If (LEqual (Arg0, 0x02))
                    {
                        If (NB1A)
                        {
                            Store (0x10, Local0)
                        }
                        Else
                        {
                            Store (0x02, Local1)
                        }
                    }
                    Else
                    {
                        Store (0x02, Local1)
                    }
                }

                Store (0x00, BUF0)
                Store (Local1, BER2)
                Return (Local0)
            }

            Method (ACRN, 1, NotSerialized)
            {
                Store (0x00, Local0)
                If (FIRE)
                {
                    If (LEqual (Arg0, 0x01))
                    {
                        Store (0x0100, Local0)
                    }

                    If (LEqual (Arg0, 0x02))
                    {
                        Store (0x0200, Local0)
                    }

                    If (LEqual (Arg0, 0x03))
                    {
                        Store (0x0300, Local0)
                    }

                    If (LEqual (Arg0, 0x04))
                    {
                        Store (0x0500, Local0)
                    }

                    If (LEqual (Arg0, 0x05))
                    {
                        Store (0x0501, Local0)
                    }

                    Store (Local0, BUID)
                    Notify (AMW0, 0xB2)
                }
            }

            Method (GACR, 0, NotSerialized)
            {
                Store (0x00, Local0)
                If (FIRE)
                {
                    And (BUID, 0xFF00, Local1)
                    If (LEqual (Local1, 0x0100))
                    {
                        Or (Local1, WSTS, Local0)
                    }

                    If (LEqual (Local1, 0x0200))
                    {
                        Or (Local1, BSTS, Local0)
                    }

                    If (LEqual (Local1, 0x0300))
                    {
                        Or (Local1, CSTP, Local0)
                    }
                }

                Store (Local0, BUID)
            }

            Method (WTYP, 0, NotSerialized)
            {
                Store (0x00, Local1)
                Store (\I15H (0x01, 0x9610, 0x0235, 0x00, 0x00), Local0)
                If (And (Local0, 0x01))
                {
                    Store (0x02, Local1)
                }

                If (And (Local0, 0x02))
                {
                    Store (0x06, Local1)
                }

                If (And (Local0, 0x04))
                {
                    Store (0x05, Local1)
                }

                If (And (Local0, 0x08))
                {
                    Store (0x04, Local1)
                }

                If (And (Local0, 0x10))
                {
                    Store (0x03, Local1)
                }

                If (And (Local0, 0x20))
                {
                    Store (0x07, Local1)
                }

                Return (Local1)
            }

            Name (FDSP, 0x00)
            Name (FKDN, 0x00)
            Name (B4ED, Buffer (0x04)
            {
                0x00, 0x00, 0x00, 0x00
            })
            CreateDWordField (B4ED, 0x00, DSID)
            Method (WMCF, 3, NotSerialized)
            {
                Store (0xCF, P80H)
                CreateDWordField (Arg2, 0x00, CF04)
                Store (0x00, BER2)
                If (LEqual (Arg1, 0x01))
                {
                    Store (0x00, FKDN)
                    If (CF04)
                    {
                        Store (0x01, Local0)
                    }
                    Else
                    {
                        Store (0x00, Local0)
                    }

                    Store (Local0, FDSP)
                    Store (0x00, BER4)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x02))
                {
                    Store (FDSP, BUF0)
                    Return (CBE0)
                }

                If (LEqual (Arg1, 0x03))
                {
                    If (LEqual (FKDN, 0x01))
                    {
                        Store (0x01, Local0)
                    }
                    Else
                    {
                        Store (0x02, Local0)
                    }

                    Store (Local0, BUF0)
                    Return (CBE0)
                }
            }

            Method (ADSN, 1, NotSerialized)
            {
                Store (0x00, Local0)
                If (FDSP)
                {
                    If (LEqual (Arg0, 0x01))
                    {
                        If (CRTS)
                        {
                            Store (0x0601, Local0)
                        }
                        Else
                        {
                            Store (0x0600, Local0)
                        }
                    }

                    If (LEqual (Arg0, 0x02))
                    {
                        Store (0x01, FKDN)
                        Store (0x00015001, Local0)
                    }

                    If (LEqual (Arg0, 0x03))
                    {
                        If (LEqual (FKDN, 0x01))
                        {
                            Store (0x02, FKDN)
                            Store (0x00010002, Local0)
                        }
                    }

                    Store (Local0, DSID)
                    If (Local0)
                    {
                        Notify (AMW0, 0xB4)
                    }
                }
            }
        }

        Device (LID0)
        {
            Name (_HID, EisaId ("PNP0C0D"))
            Method (_LID, 0, NotSerialized)
            {
                If (\ECON)
                {
                    Store (\_SB.PCI0.LPCB.EC0.KLID, Local0)
                }
                Else
                {
                    And (\RBEC (0x70), 0x02, Local0)
                }

                If (Local0)
                {
                    Return (0x01)
                }
                Else
                {
                    Return (0x00)
                }
            }

            Method (_PSW, 1, NotSerialized)
            {
                If (\ECON)
                {
                    Store (Arg0, \_SB.PCI0.LPCB.EC0.LIDW)
                }
                Else
                {
                    If (Arg0)
                    {
                        \MBEC (0x72, 0xEF, 0x10)
                    }
                    Else
                    {
                        \MBEC (0x72, 0xEF, 0x00)
                    }
                }
            }

            Name (_PRW, Package (0x02)
            {
                0x19, 
                0x03
            })
        }

        Device (SLPB)
        {
            Name (_HID, EisaId ("PNP0C0E"))
            Name (_PRW, Package (0x02)
            {
                0x19, 
                0x03
            })
        }

        Scope (\_SB)
        {
        }

        Device (PCI0)
        {
            Name (_HID, EisaId ("PNP0A08"))
            Name (_CID, 0x030AD041)
            Name (_ADR, 0x00)
            Name (_BBN, 0x00)
            OperationRegion (HBUS, PCI_Config, 0x40, 0xC0)
            Field (HBUS, DWordAcc, NoLock, Preserve)
            {
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
                TOUD,   5, 
                        Offset (0xA4), 
                    ,   6, 
                IGDD,   1
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

                If (TPMP)
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
                            0x00, 
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
                            0x00, 
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
                    If (LNot (TPMP))
                    {
                        Return (BUF0)
                    }

                    Return (BUF1)
                }
            }

            Device (PEGP)
            {
                Name (_ADR, 0x00010000)
                Device (VGA)
                {
                    Name (_ADR, 0x00)
                    Method (_DOS, 1, NotSerialized)
                    {
                        Store (And (Arg0, 0x03), DSEN)
                    }

                    Method (_DOD, 0, NotSerialized)
                    {
                        If (LEqual (PHSR (0x2C, 0x00), 0x03))
                        {
                            Return (Package (0x04)
                            {
                                0x00010100, 
                                0x00010200, 
                                0x00010118, 
                                0x00010120
                            })
                        }
                        Else
                        {
                            Return (Package (0x04)
                            {
                                0x00010100, 
                                0x00010200, 
                                0x00010118, 
                                0x00010210
                            })
                        }
                    }

                    Device (CRT)
                    {
                        Name (_ADR, 0x0100)
                        Method (_DCS, 0, NotSerialized)
                        {
                            PHSR (0x25, 0x00)
                            If (And (CSTE, 0x0101))
                            {
                                Return (0x1F)
                            }

                            Return (0x1D)
                        }

                        Method (_DGS, 0, NotSerialized)
                        {
                            If (And (NSTE, 0x0101))
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

                    Device (LCD)
                    {
                        Name (_ADR, 0x0118)
                        Method (_DCS, 0, NotSerialized)
                        {
                            PHSR (0x25, 0x00)
                            If (And (CSTE, 0x0808))
                            {
                                Return (0x1F)
                            }

                            Return (0x1D)
                        }

                        Method (_DGS, 0, NotSerialized)
                        {
                            If (And (NSTE, 0x0808))
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

                        Method (_DDC, 1, NotSerialized)
                        {
                            If (LEqual (Arg0, 0x01))
                            {
                                Return (\_SB.PCI0.PEGP.VGA.DDC4)
                            }

                            If (LEqual (Arg0, 0x02))
                            {
                                Concatenate (\_SB.PCI0.PEGP.VGA.DDC4, \_SB.PCI0.PEGP.VGA.DDC0, Local0)
                                Return (Local0)
                            }

                            Return (0x00)
                        }
                    }

                    Device (TV0)
                    {
                        Name (_ADR, 0x0200)
                        Method (_DCS, 0, NotSerialized)
                        {
                            PHSR (0x25, 0x00)
                            If (And (CSTE, 0x0202))
                            {
                                Return (0x1F)
                            }

                            Return (0x1D)
                        }

                        Method (_DGS, 0, NotSerialized)
                        {
                            If (And (NSTE, 0x0202))
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

                        Method (_DDC, 1, NotSerialized)
                        {
                            If (LEqual (Arg0, 0x01))
                            {
                                Return (\_SB.PCI0.PEGP.VGA.DDC3)
                            }

                            If (LEqual (Arg0, 0x02))
                            {
                                Concatenate (\_SB.PCI0.PEGP.VGA.DDC3, \_SB.PCI0.PEGP.VGA.DDC0, Local0)
                                Return (Local0)
                            }

                            Return (0x00)
                        }
                    }

                    Device (DVI)
                    {
                        Method (_ADR, 0, NotSerialized)
                        {
                            If (LEqual (PHSR (0x2C, 0x00), 0x03))
                            {
                                Return (0x0120)
                            }
                            Else
                            {
                                Return (0x0210)
                            }
                        }

                        Method (_DCS, 0, NotSerialized)
                        {
                            PHSR (0x25, 0x00)
                            If (And (CSTE, 0x0404))
                            {
                                Return (0x1F)
                            }

                            Return (0x1D)
                        }

                        Method (_DGS, 0, NotSerialized)
                        {
                            If (And (NSTE, 0x0404))
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

                    Name (DDC0, Buffer (0x80)
                    {
                        /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0010 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0018 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0020 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0028 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0030 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0038 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0040 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0048 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0050 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0058 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0060 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0068 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0070 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0078 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                    })
                    Name (DDC3, Buffer (0x80)
                    {
                        /* 0000 */    0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 
                        /* 0008 */    0x41, 0xD0, 0xFE, 0x09, 0x00, 0x00, 0x00, 0x00, 
                        /* 0010 */    0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0018 */    0xF0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0020 */    0x00, 0x00, 0x00, 0x21, 0x08, 0x00, 0x00, 0x00, 
                        /* 0028 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0030 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0038 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0040 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0048 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0050 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0058 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0060 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0068 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0070 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0078 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xD3
                    })
                    Name (DDC4, Buffer (0x80)
                    {
                        /* 0000 */    0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 
                        /* 0008 */    0x36, 0x7F, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0010 */    0x00, 0x00, 0x02, 0x00, 0x01, 0x28, 0x1E, 0x00, 
                        /* 0018 */    0xF0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0020 */    0x00, 0x00, 0x00, 0x21, 0x08, 0x00, 0x00, 0x00, 
                        /* 0028 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0030 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0038 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0040 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0048 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0050 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0058 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0060 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0068 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0070 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0078 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xEC
                    })
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
            }

            Device (GFX0)
            {
                Name (_ADR, 0x00020000)
                Method (_DOS, 1, NotSerialized)
                {
                    Store (And (Arg0, 0x03), DSEN)
                }

                Method (_DOD, 0, NotSerialized)
                {
                    Return (Package (0x04)
                    {
                        0x0100, 
                        0x0410, 
                        0x0240, 
                        0x0320
                    })
                }

                Device (CRT)
                {
                    Name (_ADR, 0x0100)
                    Method (_DCS, 0, NotSerialized)
                    {
                        PHSR (0x25, 0x00)
                        If (And (CSTE, 0x0101))
                        {
                            Return (0x1F)
                        }

                        Return (0x1D)
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        If (And (NSTE, 0x0101))
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

                Device (TV0)
                {
                    Name (_ADR, 0x0240)
                    Method (_DCS, 0, NotSerialized)
                    {
                        PHSR (0x25, 0x00)
                        If (And (CSTE, 0x0202))
                        {
                            Return (0x1F)
                        }

                        Return (0x1D)
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        If (And (NSTE, 0x0202))
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

                Device (DVI)
                {
                    Name (_ADR, 0x0320)
                    Method (_DCS, 0, NotSerialized)
                    {
                        PHSR (0x25, 0x00)
                        If (And (CSTE, 0x0404))
                        {
                            Return (0x1F)
                        }

                        Return (0x1D)
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        If (And (NSTE, 0x0404))
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

                Device (LCD)
                {
                    Name (_ADR, 0x0410)
                    Method (_DCS, 0, NotSerialized)
                    {
                        PHSR (0x25, 0x00)
                        If (And (CSTE, 0x0808))
                        {
                            Return (0x1F)
                        }

                        Return (0x1D)
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        If (And (NSTE, 0x0808))
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
                Name (HDWA, 0x00)
                Name (_PRW, Package (0x02)
                {
                    0x05, 
                    0x03
                })
                Method (_PS0, 0, Serialized)
                {
                    If (LEqual (HDWA, 0x00))
                    {
                        Store (0x01, HDWA)
                        HKEY (0x8F)
                    }
                }

                Method (_PS3, 0, Serialized)
                {
                    Store (0x00, HDWA)
                }
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

                Device (LANE)
                {
                    Name (_ADR, 0x00)
                    Name (_PRW, Package (0x02)
                    {
                        0x0B, 
                        0x05
                    })
                    Method (_PSW, 1, NotSerialized)
                    {
                    }
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
                    HPCE,   1, 
                    PMCE,   1, 
                        ,   30, 
                    HPCS,   1, 
                    PMCS,   1
                }

                Device (PXS3)
                {
                    Name (_ADR, 0x00)
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
                            Offset (0x9B), 
                        ,   6, 
                    HPCE,   1, 
                    PMCE,   1, 
                        ,   30, 
                    HPCS,   1, 
                    PMCS,   1
                }

                Device (PXS4)
                {
                    Name (_ADR, 0x00)
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
                            Offset (0x9B), 
                        ,   6, 
                    HPCE,   1, 
                    PMCE,   1, 
                        ,   30, 
                    HPCS,   1, 
                    PMCS,   1
                }

                Device (PXS5)
                {
                    Name (_ADR, 0x00)
                    Name (_PRW, Package (0x02)
                    {
                        0x09, 
                        0x04
                    })
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

                Device (PXS6)
                {
                    Name (_ADR, 0x00)
                    Name (_PRW, Package (0x02)
                    {
                        0x09, 
                        0x04
                    })
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
                Device (HUB7)
                {
                    Name (_ADR, 0x00)
                    Device (PRT1)
                    {
                        Name (_ADR, 0x01)
                    }

                    Device (PRT2)
                    {
                        Name (_ADR, 0x02)
                    }

                    Device (PRT3)
                    {
                        Name (_ADR, 0x03)
                    }

                    Device (PRT4)
                    {
                        Name (_ADR, 0x04)
                    }

                    Device (PRT5)
                    {
                        Name (_ADR, 0x05)
                    }

                    Device (PRT6)
                    {
                        Name (_ADR, 0x06)
                    }

                    Device (PRT7)
                    {
                        Name (_ADR, 0x07)
                    }

                    Device (PRT8)
                    {
                        Name (_ADR, 0x08)
                    }
                }

                Name (_PRW, Package (0x02)
                {
                    0x0D, 
                    0x03
                })
                Method (_S3D, 0, NotSerialized)
                {
                    Return (0x02)
                }

                Method (_S4D, 0, NotSerialized)
                {
                    Return (0x02)
                }

                Method (_PSW, 1, NotSerialized)
                {
                    If (Arg0) {}
                    Else
                    {
                    }
                }
            }

            Device (PCIB)
            {
                Name (_ADR, 0x001E0000)
                Device (LANC)
                {
                    Name (_ADR, 0x00070000)
                    Name (_PRW, Package (0x02)
                    {
                        0x0B, 
                        0x05
                    })
                }

                Method (_PRT, 0, NotSerialized)
                {
                    If (GPIC)
                    {
                        Return (Package (0x08)
                        {
                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x00, 
                                0x00, 
                                0x14
                            }, 

                            Package (0x04)
                            {
                                0x0006FFFF, 
                                0x00, 
                                0x00, 
                                0x16
                            }, 

                            Package (0x04)
                            {
                                0x0006FFFF, 
                                0x01, 
                                0x00, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0x0006FFFF, 
                                0x02, 
                                0x00, 
                                0x15
                            }, 

                            Package (0x04)
                            {
                                0x0006FFFF, 
                                0x03, 
                                0x00, 
                                0x16
                            }, 

                            Package (0x04)
                            {
                                0x0007FFFF, 
                                0x00, 
                                0x00, 
                                0x17
                            }, 

                            Package (0x04)
                            {
                                0x0009FFFF, 
                                0x00, 
                                0x00, 
                                0x16
                            }, 

                            Package (0x04)
                            {
                                0x0009FFFF, 
                                0x01, 
                                0x00, 
                                0x11
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x08)
                        {
                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x00, 
                                \_SB.PCI0.LPCB.LNKE, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0006FFFF, 
                                0x00, 
                                \_SB.PCI0.LPCB.LNKG, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0006FFFF, 
                                0x01, 
                                \_SB.PCI0.LPCB.LNKB, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0006FFFF, 
                                0x02, 
                                \_SB.PCI0.LPCB.LNKF, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0006FFFF, 
                                0x03, 
                                \_SB.PCI0.LPCB.LNKG, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0007FFFF, 
                                0x00, 
                                \_SB.PCI0.LPCB.LNKH, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0009FFFF, 
                                0x00, 
                                \_SB.PCI0.LPCB.LNKG, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0009FFFF, 
                                0x01, 
                                \_SB.PCI0.LPCB.LNKB, 
                                0x00
                            }
                        })
                    }
                }
            }

            Device (AUD0)
            {
                Name (_ADR, 0x001E0002)
            }

            Device (MODM)
            {
                Name (_ADR, 0x001E0003)
                Name (_PRW, Package (0x02)
                {
                    0x05, 
                    0x03
                })
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
                    Z000,   1, 
                    Z001,   1, 
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
                        IRQ (Level, ActiveLow, Shared, )
                            {10,11}
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
                            {10,11}
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
                            {10,11}
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
                            {10,11}
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
                            {10,11}
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
                            {10,11}
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
                            {10,11}
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
                            {10,11}
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
                    Name (_GPE, 0x17)
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }

                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0062,             // Range Minimum
                            0x0062,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0066,             // Range Minimum
                            0x0066,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                    })
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

                    OperationRegion (RAM, EmbeddedControl, 0x00, 0xFF)
                    Field (RAM, ByteAcc, Lock, Preserve)
                    {
                                Offset (0x0A), 
                            ,   1, 
                        BLNK,   1, 
                        WLLD,   2, 
                        BTLD,   2, 
                                Offset (0x50), 
                            ,   1, 
                        CAME,   1, 
                        CIRE,   1, 
                                Offset (0x52), 
                            ,   1, 
                            ,   1, 
                        WEPM,   1, 
                                Offset (0x70), 
                            ,   1, 
                        KLID,   1, 
                            ,   3, 
                        KACS,   1, 
                                Offset (0x71), 
                        WLEN,   1, 
                        BTEN,   1, 
                        DCKS,   1, 
                        MUTE,   1, 
                        KBID,   3, 
                                Offset (0x72), 
                            ,   2, 
                        KEYW,   1, 
                        RTCW,   1, 
                        LIDW,   1, 
                        BL2W,   1, 
                        TPDW,   1, 
                                Offset (0x75), 
                        SWBL,   1, 
                        KLMA,   1
                    }

                    Field (RAM, ByteAcc, Lock, Preserve)
                    {
                                Offset (0x01), 
                        TIID,   8, 
                                Offset (0x10), 
                            ,   1, 
                        KTEE,   1, 
                                Offset (0x11), 
                        KPPS,   1, 
                                Offset (0x91), 
                        TTID,   8, 
                        KCSS,   1, 
                        KCTT,   1, 
                        KDTT,   1, 
                        KOSD,   1, 
                        KVTP,   1, 
                                Offset (0xA8), 
                        THS0,   8, 
                        THS1,   8, 
                        THS2,   8, 
                        THS3,   8, 
                        THS4,   8, 
                        THS5,   8, 
                        THS6,   8, 
                        THS7,   8
                    }

                    Field (RAM, ByteAcc, Lock, Preserve)
                    {
                                Offset (0x92), 
                        KTAF,   8
                    }

                    Field (RAM, ByteAcc, Lock, Preserve)
                    {
                                Offset (0x92), 
                        THSL,   4
                    }

                    Field (RAM, ByteAcc, Lock, Preserve)
                    {
                                Offset (0xD0), 
                        TSP0,   8, 
                        TSC0,   8, 
                        TSP1,   8, 
                        TSC1,   8, 
                        TSP2,   8, 
                        TSC2,   8, 
                        TSP3,   8, 
                        TSC3,   8, 
                        TSP4,   8, 
                        TSC4,   8, 
                        TSP5,   8, 
                        TSC5,   8, 
                        TSP6,   8, 
                        TSC6,   8, 
                        TSP7,   8, 
                        TSC7,   8
                    }

                    Method (_REG, 2, NotSerialized)
                    {
                        If (LEqual (Arg0, 0x03))
                        {
                            Store (Arg1, ECON)
                            TINI ()
                        }
                    }

                    Method (TINI, 0, NotSerialized)
                    {
                        If (\ECON)
                        {
                            Store (0x00, KTAF)
                            Store (0x01, KTEE)
                        }
                        Else
                        {
                            WBEC (0x92, 0x00)
                            MBEC (0x10, 0xFD, 0x02)
                        }
                    }

                    Method (_Q16, 0, NotSerialized)
                    {
                        Store (0x16, P80H)
                        LAMN (0x01)
                    }

                    Method (_Q24, 0, NotSerialized)
                    {
                        Store (0x24, P80H)
                        LAMN (0x6A)
                    }

                    Method (_Q25, 0, NotSerialized)
                    {
                        Store (0x25, P80H)
                        LAMN (0x6D)
                    }

                    Method (_Q17, 0, NotSerialized)
                    {
                        Store (0x17, P80H)
                        Notify (\_SB.SLPB, 0x80)
                    }

                    Method (HKDS, 1, NotSerialized)
                    {
                        If (LEqual (0x00, DSEN))
                        {
                            Store (PHSR (0x2D, 0x00), Local1)
                            If (LNotEqual (Local1, LDTD))
                            {
                                Store (Local1, LDTD)
                                If (LOr (LGreater (OSYS, 0x07D0), LLess (OSYS, 0x07D6)))
                                {
                                    Notify (\_SB.PCI0, 0x00)
                                }
                                Else
                                {
                                    If (LEqual (\_SB.PCI0.IGDD, 0x00))
                                    {
                                        Notify (\_SB.PCI0.GFX0, 0x00)
                                    }
                                    Else
                                    {
                                        Notify (\_SB.PCI0.PEGP.VGA, 0x00)
                                    }
                                }

                                Sleep (0x02EE)
                            }

                            If (LEqual (Arg0, 0x10))
                            {
                                Store (PHSR (0x27, 0x00), Local0)
                                Increment (Local0)
                                If (LGreaterEqual (Local0, 0x03))
                                {
                                    Store (0x00, Local0)
                                }
                            }
                            Else
                            {
                                Store (Arg0, Local0)
                            }

                            If (LEqual (Local0, 0x00))
                            {
                                Store (0x0101, NSTE)
                            }

                            If (LEqual (Local0, 0x01))
                            {
                                Store (0x0808, NSTE)
                            }

                            If (LEqual (Local0, 0x02))
                            {
                                Store (0x0909, NSTE)
                            }

                            If (LEqual (Local0, 0x03))
                            {
                                Store (0x0404, NSTE)
                            }

                            If (LEqual (Local0, 0x04))
                            {
                                Store (0x0202, NSTE)
                            }

                            If (LEqual (Local0, 0x05))
                            {
                                Store (0x0C0C, NSTE)
                            }

                            If (LEqual (Local0, 0x06))
                            {
                                Store (0x0A0A, NSTE)
                            }

                            If (LEqual (\_SB.PCI0.IGDD, 0x00))
                            {
                                Notify (\_SB.PCI0.GFX0, 0x80)
                            }
                            Else
                            {
                                Notify (\_SB.PCI0.PEGP.VGA, 0x80)
                            }
                        }

                        If (LEqual (0x01, DSEN))
                        {
                            If (LEqual (Arg0, 0x10))
                            {
                                PHSR (0x26, 0x00)
                            }
                            Else
                            {
                                PHSR (0x2E, Arg0)
                            }
                        }
                    }

                    Method (_Q19, 0, NotSerialized)
                    {
                        Store (0x19, P80H)
                        If (\_SB.PCI0.LPCB.EC0.KLMA)
                        {
                            LAMN (0x05)
                        }
                        Else
                        {
                            HKDS (0x10)
                        }
                    }

                    Method (_Q80, 0, NotSerialized)
                    {
                        Store (0x80, P80H)
                        HKDS (0x00)
                    }

                    Method (_Q81, 0, NotSerialized)
                    {
                        Store (0x81, P80H)
                        HKDS (0x01)
                    }

                    Method (_Q82, 0, NotSerialized)
                    {
                        Store (0x82, P80H)
                        HKDS (0x02)
                    }

                    Method (_Q83, 0, NotSerialized)
                    {
                        Store (0x83, P80H)
                        HKDS (0x03)
                    }

                    Method (_Q84, 0, NotSerialized)
                    {
                        Store (0x84, P80H)
                        HKDS (0x04)
                    }

                    Method (_Q85, 0, NotSerialized)
                    {
                        Store (0x85, P80H)
                        HKDS (0x05)
                    }

                    Method (_Q86, 0, NotSerialized)
                    {
                        Store (0x86, P80H)
                        HKDS (0x06)
                    }

                    Method (_Q1A, 0, NotSerialized)
                    {
                        Store (0x1A, P80H)
                        LAMN (0x06)
                    }

                    Method (_Q5C, 0, NotSerialized)
                    {
                        Store (0x5C, P80H)
                        HKEY (0x5C)
                    }

                    Method (_Q1E, 0, NotSerialized)
                    {
                        Store (0x1E, P80H)
                        LAMN (0x20)
                    }

                    Method (_Q1F, 0, NotSerialized)
                    {
                        Store (0x1F, P80H)
                        LAMN (0x21)
                    }

                    Method (_Q22, 0, NotSerialized)
                    {
                        Store (0x22, P80H)
                        LAMN (0x07)
                    }

                    Method (_Q10, 0, NotSerialized)
                    {
                        Store (0x10, P80H)
                        LAMN (0x30)
                    }

                    Method (_Q11, 0, NotSerialized)
                    {
                        Store (0x11, P80H)
                        LAMN (0x36)
                    }

                    Method (_Q12, 0, NotSerialized)
                    {
                        Store (0x12, P80H)
                        LAMN (0x31)
                    }

                    Method (_Q13, 0, NotSerialized)
                    {
                        Store (0x13, P80H)
                        LAMN (0x11)
                    }

                    Method (_Q14, 0, NotSerialized)
                    {
                        Store (0x14, P80H)
                        LAMN (0x12)
                    }

                    Method (_Q15, 0, NotSerialized)
                    {
                        Store (0x15, P80H)
                        LAMN (0x13)
                    }

                    Method (_Q1B, 0, NotSerialized)
                    {
                        Store (0x1B, P80H)
                        LAMN (0x08)
                    }

                    Method (_Q1C, 0, NotSerialized)
                    {
                        Store (0x1C, P80H)
                        If (\_SB.AMW0.FIRE)
                        {
                            \_SB.AMW0.ACRN (0x03)
                        }
                        Else
                        {
                            LAMN (0x73)
                        }
                    }

                    Method (_Q1D, 0, NotSerialized)
                    {
                        Store (0x1D, P80H)
                        If (\_SB.AMW0.FIRE)
                        {
                            \_SB.AMW0.ACRN (0x03)
                        }
                        Else
                        {
                            LAMN (0x74)
                        }
                    }

                    Method (_Q23, 0, NotSerialized)
                    {
                        Store (0x23, P80H)
                        LAMN (0x44)
                    }

                    Method (_Q32, 0, NotSerialized)
                    {
                        Store (0x32, P80H)
                        HKEY (0x32)
                        Store (0x00, KCTT)
                    }

                    Method (_Q33, 0, NotSerialized)
                    {
                        Store (0x33, P80H)
                        Store (0x00, KCSS)
                        SGV3 (0x00)
                    }

                    Method (_Q34, 0, NotSerialized)
                    {
                        Store (0x34, P80H)
                        Store (0x01, KCSS)
                        SGV3 (0xFF)
                    }

                    Method (_Q35, 0, NotSerialized)
                    {
                        Store (0x35, P80H)
                        HKEY (0x35)
                        Store (0x01, KCTT)
                    }

                    Method (_Q36, 0, NotSerialized)
                    {
                        Store (0x36, P80H)
                        Store (0x01, KOSD)
                        Sleep (0x01F4)
                        NTMR ()
                    }

                    Method (_Q37, 0, NotSerialized)
                    {
                        Store (0x37, P80H)
                        Store (0x01, KVTP)
                        HKEY (0x37)
                    }

                    Method (_Q38, 0, NotSerialized)
                    {
                        Store (0x38, P80H)
                        Store (0x00, KVTP)
                        HKEY (0x38)
                    }

                    Method (_Q3F, 0, NotSerialized)
                    {
                        HKEY (0x3F)
                    }

                    Method (_Q40, 0, NotSerialized)
                    {
                        Store (0x40, P80H)
                        Notify (\_SB.PCI0.LPCB.EC0.BAT0, 0x81)
                        If (\_SB.AMW0.FIRE)
                        {
                            If (\_SB.PCI0.LPCB.EC0.NB0N)
                            {
                                \_SB.AMW0.ACRN (0x04)
                            }
                        }
                    }

                    Method (_Q41, 0, NotSerialized)
                    {
                        Store (0x41, P80H)
                        Notify (\_SB.PCI0.LPCB.EC0.BAT0, 0x81)
                    }

                    Method (_Q44, 0, NotSerialized)
                    {
                        Store (0x44, P80H)
                        Store (0x55, \_PR.CPU0.CSTX)
                        Notify (\_PR.CPU1, 0x81)
                    }

                    Method (_Q45, 0, NotSerialized)
                    {
                        Store (0x45, P80H)
                        Store (0x00, \_PR.CPU0.CSTX)
                        Notify (\_PR.CPU0, 0x81)
                        Notify (\_PR.CPU1, 0x81)
                    }

                    Method (_Q48, 0, NotSerialized)
                    {
                        Store (0x48, P80H)
                        Notify (\_SB.PCI0.LPCB.EC0.BAT0, 0x80)
                    }

                    Method (_Q4C, 0, NotSerialized)
                    {
                        Store (0x4C, P80H)
                        If (B0ST)
                        {
                            Notify (\_SB.PCI0.LPCB.EC0.BAT0, 0x80)
                        }
                    }

                    Method (_Q4D, 0, NotSerialized)
                    {
                        Store (0x4D, P80H)
                        \_SB.AMW0.ADSN (0x01)
                    }

                    Method (_Q4E, 0, NotSerialized)
                    {
                        Store (0x4E, P80H)
                    }

                    Method (_Q50, 0, NotSerialized)
                    {
                        Store (0x50, P80H)
                        Notify (\_SB.PCI0.LPCB.EC0.ADP1, 0x80)
                    }

                    Method (_Q51, 0, NotSerialized)
                    {
                        Store (0x51, P80H)
                        Notify (\_SB.PCI0.LPCB.EC0.ADP1, 0x80)
                    }

                    Method (_Q52, 0, NotSerialized)
                    {
                        Store (0x52, P80H)
                        Notify (\_SB.LID0, 0x80)
                    }

                    Method (_Q53, 0, NotSerialized)
                    {
                        Store (0x53, P80H)
                        Notify (\_SB.LID0, 0x80)
                    }

                    Method (_Q56, 0, NotSerialized)
                    {
                        Store (0x56, P80H)
                    }

                    Method (_Q57, 0, NotSerialized)
                    {
                        Store (0x57, P80H)
                    }

                    Method (_Q58, 0, NotSerialized)
                    {
                        Store (0x58, P80H)
                    }

                    Method (_Q59, 0, NotSerialized)
                    {
                        Store (0x59, P80H)
                    }

                    Method (NTMR, 0, NotSerialized)
                    {
                        Notify (\_TZ.TZS0, 0x80)
                        Notify (\_TZ.TZS1, 0x80)
                    }

                    Method (SGV3, 1, NotSerialized)
                    {
                        If (LGreater (Arg0, 0x64))
                        {
                            Store (PPCM, PPCS)
                        }
                        Else
                        {
                            Store (Arg0, PPCS)
                        }

                        Notify (\_PR.CPU0, 0x80)
                        If (MPEN)
                        {
                            Notify (\_PR.CPU1, 0x80)
                        }
                    }

                    Field (RAM, ByteAcc, Lock, Preserve)
                    {
                                Offset (0x02), 
                        NBID,   8, 
                                Offset (0x17), 
                            ,   5, 
                        SM0F,   1, 
                            ,   1, 
                        SM1F,   1, 
                                Offset (0x88), 
                        NB0A,   1, 
                            ,   2, 
                        NB0R,   1, 
                        NB0L,   1, 
                        NB0F,   1, 
                        NB0N,   1, 
                                Offset (0x89), 
                        NB1A,   1, 
                            ,   2, 
                        NB1R,   1, 
                        NB1L,   1, 
                        NB1F,   1, 
                        NB1N,   1
                    }

                    Field (RAM, ByteAcc, Lock, Preserve)
                    {
                                Offset (0x88), 
                        NB0S,   8, 
                        NB1S,   8
                    }

                    Field (RAM, ByteAcc, Lock, Preserve)
                    {
                                Offset (0xE0), 
                        BSRC,   16, 
                        BSFC,   16, 
                        BSPE,   16, 
                        BSAC,   16, 
                        BSVO,   16, 
                            ,   15, 
                        BSCM,   1, 
                        BSCU,   16, 
                        BSTV,   16
                    }

                    Field (RAM, ByteAcc, Lock, Preserve)
                    {
                                Offset (0xE0), 
                        BSDC,   16, 
                        BSDV,   16, 
                        BSSN,   16
                    }

                    Field (RAM, ByteAcc, NoLock, Preserve)
                    {
                                Offset (0xE0), 
                        BSMN,   128
                    }

                    Field (RAM, ByteAcc, NoLock, Preserve)
                    {
                                Offset (0xE0), 
                        BSDN,   128
                    }

                    Field (RAM, ByteAcc, NoLock, Preserve)
                    {
                                Offset (0xE0), 
                        BSCH,   128
                    }

                    Mutex (BATM, 0x07)
                    Method (GBIF, 3, NotSerialized)
                    {
                        Acquire (BATM, 0xFFFF)
                        If (Arg2)
                        {
                            Store (0xFFFFFFFF, Index (Arg1, 0x01))
                            Store (0xFFFFFFFF, Index (Arg1, 0x02))
                            Store (0xFFFFFFFF, Index (Arg1, 0x04))
                            Store (0x00, Index (Arg1, 0x05))
                            Store (0x00, Index (Arg1, 0x06))
                        }
                        Else
                        {
                            And (Arg0, 0xF0, NBID)
                            Store (BSCM, Local0)
                            XOr (Local0, 0x01, Index (Arg1, 0x00))
                            Or (Arg0, 0x01, NBID)
                            If (Local0)
                            {
                                Multiply (BSDC, 0x0A, Local1)
                            }
                            Else
                            {
                                Store (BSDC, Local1)
                            }

                            Store (Local1, Index (Arg1, 0x01))
                            And (Arg0, 0xF0, NBID)
                            If (Local0)
                            {
                                Multiply (BSFC, 0x0A, Local2)
                            }
                            Else
                            {
                                Store (BSFC, Local2)
                            }

                            Store (Local2, Index (Arg1, 0x02))
                            Or (Arg0, 0x01, NBID)
                            Store (BSDV, Index (Arg1, 0x04))
                            Divide (Local2, 0x64, Local7, Local6)
                            Multiply (Local6, 0x05, Local3)
                            Store (Local3, Index (Arg1, 0x05))
                            Multiply (0x03, 0x02, Local4)
                            Add (Local4, 0x01, Local4)
                            Multiply (Local6, Local4, Local4)
                            Divide (Local4, 0x02, Local7, Local4)
                            Store (Local4, Index (Arg1, 0x06))
                            Subtract (Local3, Local4, Index (Arg1, 0x07))
                            Subtract (Local2, Local3, Index (Arg1, 0x08))
                            Store (BSSN, Local7)
                            Name (SERN, Buffer (0x06)
                            {
                                "     "
                            })
                            Store (0x04, Local6)
                            While (Local7)
                            {
                                Divide (Local7, 0x0A, Local5, Local7)
                                Add (Local5, 0x30, Index (SERN, Local6))
                                Decrement (Local6)
                            }

                            Store (SERN, Index (Arg1, 0x0A))
                            Or (Arg0, 0x03, NBID)
                            Store (BSDN, Index (Arg1, 0x09))
                            Or (Arg0, 0x04, NBID)
                            Store (BSCH, Index (Arg1, 0x0B))
                            Or (Arg0, 0x02, NBID)
                            Store (BSMN, Index (Arg1, 0x0C))
                        }

                        Release (BATM)
                        Return (Arg1)
                    }

                    Method (GBST, 4, NotSerialized)
                    {
                        Acquire (BATM, 0xFFFF)
                        If (LAnd (LEqual (Arg0, 0x00), LOr (LEqual (NB0R, 0x00), LEqual (
                            SM0F, 0x01)))) {}
                        Else
                        {
                            If (LAnd (LEqual (Arg0, 0x10), LOr (LEqual (NB1R, 0x00), LEqual (
                                SM1F, 0x01)))) {}
                            Else
                            {
                                If (And (Arg1, 0x02))
                                {
                                    Store (0x02, Local0)
                                    If (And (Arg1, 0x20))
                                    {
                                        Store (0x00, Local0)
                                    }
                                }
                                Else
                                {
                                    If (And (Arg1, 0x04))
                                    {
                                        Store (0x01, Local0)
                                    }
                                    Else
                                    {
                                        Store (0x00, Local0)
                                    }
                                }

                                If (And (Arg1, 0x10))
                                {
                                    Or (Local0, 0x04, Local0)
                                }

                                If (And (Arg1, 0x01))
                                {
                                    And (Arg0, 0xF0, NBID)
                                    Store (BSAC, Local1)
                                    Store (BSRC, Local2)
                                    If (ACST)
                                    {
                                        If (And (Arg1, 0x20))
                                        {
                                            Store (BSFC, Local2)
                                        }
                                    }

                                    If (Arg2)
                                    {
                                        Multiply (Local2, 0x0A, Local2)
                                    }

                                    Store (BSVO, Local3)
                                    If (LGreaterEqual (Local1, 0x8000))
                                    {
                                        If (And (Local0, 0x01))
                                        {
                                            Subtract (0x00010000, Local1, Local1)
                                        }
                                        Else
                                        {
                                            Store (0x00, Local1)
                                        }
                                    }
                                    Else
                                    {
                                        If (LEqual (And (Local0, 0x02), 0x00))
                                        {
                                            Store (0x00, Local1)
                                        }
                                    }

                                    If (Arg2)
                                    {
                                        Multiply (Local3, Local1, Local1)
                                        Divide (Local1, 0x03E8, Local7, Local1)
                                    }
                                }
                                Else
                                {
                                    Store (0x00, Local0)
                                    Store (0xFFFFFFFF, Local1)
                                    Store (0xFFFFFFFF, Local2)
                                    Store (0xFFFFFFFF, Local3)
                                }

                                Store (Local0, Index (Arg3, 0x00))
                                Store (Local1, Index (Arg3, 0x01))
                                Store (Local2, Index (Arg3, 0x02))
                                Store (Local3, Index (Arg3, 0x03))
                            }
                        }

                        Release (BATM)
                        Return (Arg3)
                    }

                    Name (B0ST, 0x00)
                    Device (BAT0)
                    {
                        Name (_HID, EisaId ("PNP0C0A"))
                        Name (_UID, 0x01)
                        Method (_PCL, 0, NotSerialized)
                        {
                            Return (\_SB)
                        }

                        Name (B0IP, Package (0x0D)
                        {
                            0x01, 
                            0xFFFFFFFF, 
                            0xFFFFFFFF, 
                            0x01, 
                            0xFFFFFFFF, 
                            0x00, 
                            0x00, 
                            0x5A, 
                            0x5A, 
                            "", 
                            "100", 
                            "Lion", 
                            0x00
                        })
                        Name (B0SP, Package (0x04)
                        {
                            0x00, 
                            0xFFFFFFFF, 
                            0xFFFFFFFF, 
                            0xFFFFFFFF
                        })
                        Method (_STA, 0, NotSerialized)
                        {
                            If (\ECON)
                            {
                                Store (NB0A, Local1)
                                If (NB0N)
                                {
                                    Store (0x00, Local1)
                                }
                            }
                            Else
                            {
                                Store (RBEC (0x88), Local0)
                                ShiftRight (Local0, 0x00, Local1)
                                And (Local1, 0x01, Local1)
                                If (And (Local0, 0x40))
                                {
                                    Store (0x00, Local1)
                                }
                            }

                            Store (Local1, B0ST)
                            If (Local1)
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
                            Store (B0ST, Local6)
                            Store (0x14, Local7)
                            While (LAnd (Local6, Local7))
                            {
                                If (\ECON)
                                {
                                    Store (NB0S, Local1)
                                }
                                Else
                                {
                                    Store (RBEC (0x88), Local1)
                                }

                                If (And (Local1, 0x08))
                                {
                                    Store (0x00, Local6)
                                }
                                Else
                                {
                                    Sleep (0x01F4)
                                    Decrement (Local7)
                                }
                            }

                            Return (GBIF (0x00, B0IP, Local6))
                        }

                        Method (_BST, 0, NotSerialized)
                        {
                            XOr (DerefOf (Index (B0IP, 0x00)), 0x01, Local0)
                            If (\ECON)
                            {
                                Store (NB0S, Local1)
                            }
                            Else
                            {
                                Store (RBEC (0x88), Local1)
                            }

                            Return (GBST (0x00, Local1, Local0, B0SP))
                        }
                    }

                    Name (ACST, 0x01)
                    Device (ADP1)
                    {
                        Name (_HID, "ACPI0003")
                        Method (_PSR, 0, NotSerialized)
                        {
                            If (ECON)
                            {
                                Store (KACS, Local1)
                            }
                            Else
                            {
                                Store (RBEC (0x70), Local0)
                                And (Local0, 0x20, Local1)
                            }

                            If (Local1)
                            {
                                Store (0x01, ACST)
                            }
                            Else
                            {
                                Store (0x00, ACST)
                            }

                            Return (ACST)
                        }

                        Method (_PCL, 0, NotSerialized)
                        {
                            Return (\_SB)
                        }

                        Method (_STA, 0, NotSerialized)
                        {
                            Return (0x0F)
                        }
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

                Device (FWHD)
                {
                    Name (_HID, EisaId ("INT0800"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        Memory32Fixed (ReadOnly,
                            0xFF000000,         // Address Base
                            0x01000000,         // Address Length
                            )
                    })
                }

                Device (HPET)
                {
                    Name (_HID, EisaId ("PNP0103"))
                    Name (_CID, 0x010CD041)
                    Name (BUF0, ResourceTemplate ()
                    {
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
                            0x004E,             // Range Minimum
                            0x004E,             // Range Maximum
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
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
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
                            0x0680,             // Range Minimum
                            0x0680,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
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
                            0x1200,             // Range Minimum
                            0x1200,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                    })
                }

                Device (CDRC)
                {
                    Name (_HID, EisaId ("PNP0C02"))
                    Name (_UID, 0x03)
                    Name (BUF0, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x06B0,             // Range Minimum
                            0x06B0,             // Range Maximum
                            0x01,               // Alignment
                            0x40,               // Length
                            )
                    })
                    Name (BUF1, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x06B0,             // Range Minimum
                            0x06B0,             // Range Maximum
                            0x01,               // Alignment
                            0x50,               // Length
                            )
                    })
                    Name (BUF2, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x06A0,             // Range Minimum
                            0x06A0,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x06B0,             // Range Minimum
                            0x06B0,             // Range Maximum
                            0x01,               // Alignment
                            0x40,               // Length
                            )
                    })
                    Name (BUF3, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x06A0,             // Range Minimum
                            0x06A0,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x06B0,             // Range Minimum
                            0x06B0,             // Range Maximum
                            0x01,               // Alignment
                            0x50,               // Length
                            )
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        If (EMAE)
                        {
                            If (CIRP)
                            {
                                Return (BUF0)
                            }

                            Return (BUF1)
                        }
                        Else
                        {
                            If (CIRP)
                            {
                                Return (BUF2)
                            }

                            Return (BUF3)
                        }
                    }
                }

                Device (RTC)
                {
                    Name (_HID, EisaId ("PNP0B00"))
                    Name (_CRS, ResourceTemplate ()
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
                }

                Device (TIMR)
                {
                    Name (_HID, EisaId ("PNP0100"))
                    Name (_CRS, ResourceTemplate ()
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
                }

                Device (N393)
                {
                    Name (_HID, EisaId ("PNP0A05"))
                    Name (_UID, 0x01)
                    Method (_STA, 0, Serialized)
                    {
                        If (NATP)
                        {
                            Return (0x0F)
                        }

                        Return (0x00)
                    }

                    OperationRegion (N393, SystemIO, 0x2E, 0x02)
                    Field (N393, ByteAcc, Lock, Preserve)
                    {
                        INDX,   8, 
                        DATA,   8
                    }

                    IndexField (INDX, DATA, ByteAcc, Lock, Preserve)
                    {
                                Offset (0x07), 
                        R07H,   8, 
                                Offset (0x20), 
                        R20H,   8, 
                        R21H,   8, 
                        R22H,   8, 
                        R23H,   8, 
                        R24H,   8, 
                        R25H,   8, 
                        R26H,   8, 
                        R27H,   8, 
                        R28H,   8, 
                        R29H,   8, 
                        R2AH,   8, 
                                Offset (0x30), 
                        R30H,   8, 
                                Offset (0x60), 
                        R60H,   8, 
                        R61H,   8, 
                                Offset (0x70), 
                        R70H,   8, 
                        R71H,   8, 
                                Offset (0x74), 
                        R74H,   8, 
                        R75H,   8, 
                                Offset (0xF0), 
                        RF0H,   8, 
                        RF1H,   8
                    }

                    Name (CMBF, 0xFF)
                    Method (CMBM, 0, NotSerialized)
                    {
                        If (LEqual (CMBF, 0xFF))
                        {
                            Store (0x02, R07H)
                            And (R74H, 0x07, Local0)
                            XOr (R26H, 0x04, Local1)
                            If (Local1)
                            {
                                If (LEqual (Local0, 0x04))
                                {
                                    Store (0x01, CMBF)
                                }
                                Else
                                {
                                    Store (0x02, CMBF)
                                }
                            }
                            Else
                            {
                                Store (0x00, CMBF)
                            }
                        }

                        Return (CMBF)
                    }

                    Device (COMB)
                    {
                        Name (_HID, EisaId ("PNP0501"))
                        Name (_UID, 0x03)
                        Method (_STA, 0, Serialized)
                        {
                            If (LAnd (LAnd (NATP, CMBP), LEqual (CMBM (), 0x01)))
                            {
                                Store (0x02, R07H)
                                If (R30H)
                                {
                                    Return (0x0F)
                                }

                                Return (0x0D)
                            }

                            Return (0x00)
                        }

                        Method (_DIS, 0, Serialized)
                        {
                            Store (0x02, R07H)
                            Store (0x00, R30H)
                        }

                        Method (_CRS, 0, Serialized)
                        {
                            Name (BUF0, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x02F8,             // Range Minimum
                                    0x02F8,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    _Y18)
                                IRQNoFlags (_Y19)
                                    {3}
                            })
                            Store (0x02, R07H)
                            If (LAnd (LAnd (NATP, CMBP), LEqual (CMBM (), 0x01)))
                            {
                                CreateByteField (BUF0, \_SB.PCI0.LPCB.N393.COMB._CRS._Y18._MIN, IOL0)
                                CreateByteField (BUF0, 0x03, IOH0)
                                CreateByteField (BUF0, \_SB.PCI0.LPCB.N393.COMB._CRS._Y18._MAX, IOL1)
                                CreateByteField (BUF0, 0x05, IOH1)
                                CreateByteField (BUF0, \_SB.PCI0.LPCB.N393.COMB._CRS._Y18._LEN, LEN0)
                                CreateWordField (BUF0, \_SB.PCI0.LPCB.N393.COMB._CRS._Y19._INT, IRQW)
                                Store (R60H, IOH0)
                                Store (R61H, IOL0)
                                Store (R60H, IOH1)
                                Store (R61H, IOL1)
                                Store (0x08, LEN0)
                                And (R70H, 0x0F, Local0)
                                If (Local0)
                                {
                                    ShiftLeft (One, Local0, IRQW)
                                }
                                Else
                                {
                                    Store (Zero, IRQW)
                                }
                            }

                            Return (BUF0)
                        }

                        Method (_PRS, 0, Serialized)
                        {
                            Name (BUF0, ResourceTemplate ()
                            {
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x02E8,             // Range Minimum
                                        0x02E8,             // Range Maximum
                                        0x01,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {3}
                                }
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x02F8,             // Range Minimum
                                        0x02F8,             // Range Maximum
                                        0x01,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {3}
                                }
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x03E8,             // Range Minimum
                                        0x03E8,             // Range Maximum
                                        0x01,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {3}
                                }
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x03F8,             // Range Minimum
                                        0x03F8,             // Range Maximum
                                        0x01,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {3}
                                }
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x02E8,             // Range Minimum
                                        0x02E8,             // Range Maximum
                                        0x01,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {4}
                                }
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x02F8,             // Range Minimum
                                        0x02F8,             // Range Maximum
                                        0x01,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {4}
                                }
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x03E8,             // Range Minimum
                                        0x03E8,             // Range Maximum
                                        0x01,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {4}
                                }
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x03F8,             // Range Minimum
                                        0x03F8,             // Range Maximum
                                        0x01,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {4}
                                }
                                EndDependentFn ()
                            })
                            Return (BUF0)
                        }

                        Method (_SRS, 1, Serialized)
                        {
                            CreateByteField (Arg0, 0x02, IOLO)
                            CreateByteField (Arg0, 0x03, IOHI)
                            CreateWordField (Arg0, 0x09, IRQW)
                            Store (0x02, R07H)
                            Store (0x00, R30H)
                            Store (IOLO, R61H)
                            Store (IOHI, R60H)
                            Or (ShiftLeft (R60H, 0x08), R61H, Local1)
                            Add (Local1, 0x04, Local1)
                            ShiftRight (Local1, 0x02, TRP2)
                            FindSetRightBit (IRQW, Local0)
                            If (LNotEqual (IRQW, Zero))
                            {
                                Decrement (Local0)
                            }

                            Store (Local0, R70H)
                            And (IOD0, 0x8F, IOD0)
                            If (LEqual (IOHI, 0x03))
                            {
                                If (LEqual (IOLO, 0xF8))
                                {
                                    Or (IOD0, 0x00, IOD0)
                                }
                                Else
                                {
                                    Or (IOD0, 0x70, IOD0)
                                }
                            }
                            Else
                            {
                                If (LEqual (IOLO, 0xF8))
                                {
                                    Or (IOD0, 0x10, IOD0)
                                }
                                Else
                                {
                                    Or (IOD0, 0x50, IOD0)
                                }
                            }

                            Store (0x01, R30H)
                        }

                        Method (_PS0, 0, Serialized)
                        {
                            Store (0x02, R07H)
                            Store (0x01, R30H)
                        }

                        Method (_PS3, 0, Serialized)
                        {
                            Store (0x02, R07H)
                            Store (0x00, R30H)
                        }
                    }

                    Device (FIR)
                    {
                        Name (_HID, EisaId ("NSC6001"))
                        Name (_UID, 0x01)
                        Method (_STA, 0, Serialized)
                        {
                            If (LAnd (LAnd (NATP, CMBP), LEqual (CMBM (), 0x02)))
                            {
                                Store (0x02, R07H)
                                If (R30H)
                                {
                                    Return (0x0F)
                                }

                                Return (0x0D)
                            }

                            Return (0x00)
                        }

                        Method (_DIS, 0, Serialized)
                        {
                            Store (0x02, R07H)
                            Store (0x00, R30H)
                        }

                        Method (_CRS, 0, Serialized)
                        {
                            Name (BUF0, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x02F8,             // Range Minimum
                                    0x02F8,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    _Y1A)
                                IRQNoFlags (_Y1B)
                                    {3}
                                DMA (Compatibility, NotBusMaster, Transfer8_16, _Y1C)
                                    {3}
                            })
                            Store (0x02, R07H)
                            If (LAnd (LAnd (NATP, CMBP), LEqual (CMBM (), 0x02)))
                            {
                                CreateByteField (BUF0, \_SB.PCI0.LPCB.N393.FIR._CRS._Y1A._MIN, IOL0)
                                CreateByteField (BUF0, 0x03, IOH0)
                                CreateByteField (BUF0, \_SB.PCI0.LPCB.N393.FIR._CRS._Y1A._MAX, IOL1)
                                CreateByteField (BUF0, 0x05, IOH1)
                                CreateByteField (BUF0, \_SB.PCI0.LPCB.N393.FIR._CRS._Y1A._LEN, LEN0)
                                CreateWordField (BUF0, \_SB.PCI0.LPCB.N393.FIR._CRS._Y1B._INT, IRQW)
                                CreateByteField (BUF0, \_SB.PCI0.LPCB.N393.FIR._CRS._Y1C._DMA, DMA0)
                                Store (R60H, IOH0)
                                Store (R61H, IOL0)
                                Store (R60H, IOH1)
                                Store (R61H, IOL1)
                                Store (0x08, LEN0)
                                And (R70H, 0x0F, Local0)
                                If (Local0)
                                {
                                    ShiftLeft (One, Local0, IRQW)
                                }
                                Else
                                {
                                    Store (Zero, IRQW)
                                }

                                Store (R74H, Local0)
                                If (LEqual (Local0, 0x04))
                                {
                                    Store (Zero, DMA0)
                                }
                                Else
                                {
                                    ShiftLeft (One, Local0, DMA0)
                                }
                            }

                            Return (BUF0)
                        }

                        Method (_PRS, 0, Serialized)
                        {
                            Name (BUF0, ResourceTemplate ()
                            {
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x02E8,             // Range Minimum
                                        0x02E8,             // Range Maximum
                                        0x01,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {3}
                                    DMA (Compatibility, NotBusMaster, Transfer8_16, )
                                        {3}
                                }
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x02F8,             // Range Minimum
                                        0x02F8,             // Range Maximum
                                        0x01,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {3}
                                    DMA (Compatibility, NotBusMaster, Transfer8_16, )
                                        {3}
                                }
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x03E8,             // Range Minimum
                                        0x03E8,             // Range Maximum
                                        0x01,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {3}
                                    DMA (Compatibility, NotBusMaster, Transfer8_16, )
                                        {3}
                                }
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x03F8,             // Range Minimum
                                        0x03F8,             // Range Maximum
                                        0x01,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {3}
                                    DMA (Compatibility, NotBusMaster, Transfer8_16, )
                                        {3}
                                }
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x02E8,             // Range Minimum
                                        0x02E8,             // Range Maximum
                                        0x01,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {4}
                                    DMA (Compatibility, NotBusMaster, Transfer8_16, )
                                        {3}
                                }
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x02F8,             // Range Minimum
                                        0x02F8,             // Range Maximum
                                        0x01,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {4}
                                    DMA (Compatibility, NotBusMaster, Transfer8_16, )
                                        {3}
                                }
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x03E8,             // Range Minimum
                                        0x03E8,             // Range Maximum
                                        0x01,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {4}
                                    DMA (Compatibility, NotBusMaster, Transfer8_16, )
                                        {3}
                                }
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x03F8,             // Range Minimum
                                        0x03F8,             // Range Maximum
                                        0x01,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {4}
                                    DMA (Compatibility, NotBusMaster, Transfer8_16, )
                                        {3}
                                }
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x02E8,             // Range Minimum
                                        0x02E8,             // Range Maximum
                                        0x01,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {3}
                                    DMA (Compatibility, NotBusMaster, Transfer8_16, )
                                        {1}
                                }
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x02F8,             // Range Minimum
                                        0x02F8,             // Range Maximum
                                        0x01,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {3}
                                    DMA (Compatibility, NotBusMaster, Transfer8_16, )
                                        {1}
                                }
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x03E8,             // Range Minimum
                                        0x03E8,             // Range Maximum
                                        0x01,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {3}
                                    DMA (Compatibility, NotBusMaster, Transfer8_16, )
                                        {1}
                                }
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x03F8,             // Range Minimum
                                        0x03F8,             // Range Maximum
                                        0x01,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {3}
                                    DMA (Compatibility, NotBusMaster, Transfer8_16, )
                                        {1}
                                }
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x02E8,             // Range Minimum
                                        0x02E8,             // Range Maximum
                                        0x01,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {4}
                                    DMA (Compatibility, NotBusMaster, Transfer8_16, )
                                        {1}
                                }
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x02F8,             // Range Minimum
                                        0x02F8,             // Range Maximum
                                        0x01,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {4}
                                    DMA (Compatibility, NotBusMaster, Transfer8_16, )
                                        {1}
                                }
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x03E8,             // Range Minimum
                                        0x03E8,             // Range Maximum
                                        0x01,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {4}
                                    DMA (Compatibility, NotBusMaster, Transfer8_16, )
                                        {1}
                                }
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x03F8,             // Range Minimum
                                        0x03F8,             // Range Maximum
                                        0x01,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {4}
                                    DMA (Compatibility, NotBusMaster, Transfer8_16, )
                                        {1}
                                }
                                EndDependentFn ()
                            })
                            Return (BUF0)
                        }

                        Method (_SRS, 1, Serialized)
                        {
                            CreateByteField (Arg0, 0x02, IOLO)
                            CreateByteField (Arg0, 0x03, IOHI)
                            CreateWordField (Arg0, 0x09, IRQW)
                            CreateByteField (Arg0, 0x0C, DMA0)
                            Store (0x02, R07H)
                            Store (0x00, R30H)
                            Store (IOLO, R61H)
                            Store (IOHI, R60H)
                            FindSetRightBit (IRQW, Local0)
                            If (LNotEqual (IRQW, Zero))
                            {
                                Decrement (Local0)
                            }

                            Store (Local0, R70H)
                            FindSetRightBit (DMA0, Local0)
                            If (LNotEqual (DMA0, Zero))
                            {
                                Decrement (Local0)
                            }

                            Store (Local0, R74H)
                            And (IOD0, 0x8F, IOD0)
                            If (LEqual (IOHI, 0x03))
                            {
                                If (LEqual (IOLO, 0xF8))
                                {
                                    Or (IOD0, 0x00, IOD0)
                                }
                                Else
                                {
                                    Or (IOD0, 0x70, IOD0)
                                }
                            }
                            Else
                            {
                                If (LEqual (IOLO, 0xF8))
                                {
                                    Or (IOD0, 0x10, IOD0)
                                }
                                Else
                                {
                                    Or (IOD0, 0x50, IOD0)
                                }
                            }

                            Store (0x01, R30H)
                            Or (RF0H, 0x80, Local0)
                            Store (Local0, RF0H)
                        }

                        Method (_PS0, 0, Serialized)
                        {
                            Store (0x02, R07H)
                            Store (0x01, R30H)
                        }

                        Method (_PS3, 0, Serialized)
                        {
                            Store (0x02, R07H)
                            Store (0x00, R30H)
                        }
                    }
                }

                Device (KBD0)
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
                    Name (_HID, EisaId ("SYN0302"))
                    Name (_CID, Package (0x03)
                    {
                        0x00032E4F, 
                        0x02002E4F, 
                        0x130FD041
                    })
                    Name (_CRS, ResourceTemplate ()
                    {
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {12}
                    })
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
                    MAPV,   2
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

                OperationRegion (SMBI, SystemIO, 0x18C0, 0x10)
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
    }
}

