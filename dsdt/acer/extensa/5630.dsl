/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20081031
 *
 * Disassembly of 5630, Sun Mar 15 23:03:15 2009
 *
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x0000A5EA (42474)
 *     Revision         0x02
 *     Checksum         0xDE
 *     OEM ID           "Intel "
 *     OEM Table ID     "CANTIGA "
 *     OEM Revision     0x06040000 (100925440)
 *     Compiler ID      "MSFT"
 *     Compiler Version 0x03000000 (50331648)
 */
DefinitionBlock ("5630.aml", "DSDT", 2, "Intel ", "CANTIGA ", 0x06040000)
{
    External (PDC1)
    External (PDC0)
    External (CFGD)
    External (\_PR_.CPU0._PPC)
    External (\_SB_.PCI0.LPCB.LNKD)
    External (\_SB_.PCI0.LPCB.LNKC)
    External (\_SB_.PCI0.LPCB.LNKB)
    External (\_SB_.PCI0.LPCB.LNKA)

    Name (MXM2, Buffer (0x2B)
    {
        /* 0000 */    0x4D, 0x58, 0x4D, 0x5F, 0x02, 0x01, 0x23, 0x00, 
        /* 0008 */    0x30, 0x12, 0xB8, 0xFF, 0xF9, 0x3E, 0x00, 0x00, 
        /* 0010 */    0xFA, 0xFF, 0xFD, 0x3F, 0x20, 0x21, 0x0A, 0xF0, 
        /* 0018 */    0xF9, 0x5E, 0x01, 0x84, 0x03, 0x00, 0x12, 0x69, 
        /* 0020 */    0x00, 0x00, 0x03, 0x5A, 0x68, 0x01, 0x13, 0x5A, 
        /* 0028 */    0x68, 0x01, 0xF3
    })
    Mutex (MSMI, 0x07)
    Method (PHSR, 2, NotSerialized)
    {
        Acquire (MSMI, 0xFFFF)
        Store (Arg1, \_SB.INF)
        Store (Arg0, \_SB.BCMD)
        Store (Zero, \_SB.SMIC)
        Store (\_SB.INF, Local0)
        Release (MSMI)
        Return (Local0)
    }

    Method (HKEY, 1, NotSerialized)
    {
        PHSR (0x80, Arg0)
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
            PHSR (0x81, Arg0)
        }
    }

    Method (RBEC, 1, NotSerialized)
    {
        Return (PHSR (0x82, Arg0))
    }

    Method (WBEC, 2, NotSerialized)
    {
        Acquire (MSMI, 0xFFFF)
        Store (Arg1, \_SB.INF1)
        Store (Arg0, \_SB.INF)
        Store (0x83, \_SB.BCMD)
        Store (Zero, \_SB.SMIC)
        Release (MSMI)
    }

    Method (MBEC, 3, NotSerialized)
    {
        Acquire (MSMI, 0xFFFF)
        Store (Arg2, \_SB.INF2)
        Store (Arg1, \_SB.INF1)
        Store (Arg0, \_SB.INF)
        Store (0x84, \_SB.BCMD)
        Store (Zero, \_SB.SMIC)
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
        CreateDWordField (B2ED, 0x00, OEAX)
        CreateDWordField (B2ED, 0x04, OEBX)
        CreateDWordField (B2ED, 0x08, OECX)
        CreateDWordField (B2ED, 0x0C, OEDX)
        CreateDWordField (B2ED, 0x10, OFLG)
        Store (DECX, OECX)
        Store (DEDX, OEDX)
        If (LEqual (\_SB.AMW0.WMID, 0x01))
        {
            CreateDWordField (Arg1, 0x10, DESI)
            CreateDWordField (Arg1, 0x14, DEDI)
            CreateDWordField (B2ED, 0x14, OESI)
            CreateDWordField (B2ED, 0x18, OEDI)
            Store (DESI, OESI)
            Store (DEDI, OEDI)
        }

        If (LEqual (And (DEAX, 0xFFFF), 0x9630))
        {
            If (LEqual (And (DEBX, 0xFF), 0x06))
            {
                \_SB.AMW0.WB15 (B2ED, DEBX, DECX, DEDX, DESI, DEDI)
                Release (MSMI)
                Return (B2ED)
            }
        }

        If (LAnd (LEqual (DEAX, 0x9630), LEqual (DEBX, 0x01)))
        {
            Store (\_SB.AMW0.WCOD (), Local0)
            Store (Local0, OECX)
            If (LEqual (Local0, 0x00))
            {
                Store (0x01, OFLG)
            }
            Else
            {
                Store (Zero, OFLG)
            }

            Return (B2ED)
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

        Store (0x85, \_SB.BCMD)
        Store (Zero, \_SB.SMIC)
        Store (WNVA, OEAX)
        Store (WNVB, OEBX)
        Store (WNVC, OECX)
        Store (WNVD, OEDX)
        Store (WFLG, OFLG)
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
        Store (0x85, \_SB.BCMD)
        Store (Zero, \_SB.SMIC)
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

        If (LEqual (Local1, 0x05))
        {
            Store (WFLG, Local0)
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
        Store (0x86, SMIF)
        Store (Zero, TRP0)
        CreateDWordField (B3ED, 0x00, B3R0)
        CreateDWordField (B3ED, 0x08, B3R1)
        CreateDWordField (B3ED, 0x10, B3R2)
        CreateDWordField (B3ED, 0x18, B3R3)
        If (LEqual (Arg0, 0x00))
        {
            Store (0x00, B3ED)
            Store (WNVD, B3R0)
            Store (WNVC, B3R1)
            Store (WNVB, B3R2)
            Store (WNVA, B3R3)
        }

        If (LOr (LEqual (Arg0, 0x01), LEqual (Arg0, 0x02)))
        {
            Store (0x00, B3ED)
            Store (WNVA, B3R0)
            Store (WNVD, B3R1)
        }

        If (LEqual (Arg0, 0x03))
        {
            Store (0x00, B3ED)
            Store (WNVA, B3R0)
        }

        Release (MSMI)
        Return (B3ED)
    }

    Name (\BCLP, Package (0x0C)
    {
        0x64, 
        0x3C, 
        0x0A, 
        0x14, 
        0x1E, 
        0x28, 
        0x32, 
        0x3C, 
        0x46, 
        0x50, 
        0x5A, 
        0x64
    })
    Name (\MAXL, 0x0B)
    Method (BIAN, 1, NotSerialized)
    {
        If (LEqual (And (DID1, 0x0F00), 0x0400))
        {
            Notify (\_SB.PCI0.GFX0.DD01, Arg0)
        }

        If (LEqual (And (DID2, 0x0F00), 0x0400))
        {
            Notify (\_SB.PCI0.GFX0.DD02, Arg0)
        }

        If (LEqual (And (DID3, 0x0F00), 0x0400))
        {
            Notify (\_SB.PCI0.GFX0.DD03, Arg0)
        }

        If (LEqual (And (DID4, 0x0F00), 0x0400))
        {
            Notify (\_SB.PCI0.GFX0.DD04, Arg0)
        }

        If (LEqual (And (DID5, 0x0F00), 0x0400))
        {
            Notify (\_SB.PCI0.GFX0.DD05, Arg0)
        }
    }

    Name (SP2O, 0x4E)
    Name (SP1O, 0x164E)
    Name (IO1B, 0x0600)
    Name (IO1L, 0x70)
    Name (IO2B, 0x06B0)
    Name (IO2L, 0x20)
    Name (IO3B, 0x0290)
    Name (IO3L, 0x10)
    Name (MCHB, 0xFED10000)
    Name (MCHL, 0x4000)
    Name (EGPB, 0xFED19000)
    Name (EGPL, 0x1000)
    Name (DMIB, 0xFED18000)
    Name (DMIL, 0x1000)
    Name (IFPB, 0xFED13000)
    Name (IFPL, 0x1000)
    Name (PEBS, 0xE0000000)
    Name (PELN, 0x10000000)
    Name (TTTB, 0xFED20000)
    Name (TTTL, 0x00020000)
    Name (SMBS, 0x18C0)
    Name (PBLK, 0x0410)
    Name (PMBS, 0x0400)
    Name (PMLN, 0x80)
    Name (LVL2, 0x0414)
    Name (LVL3, 0x0415)
    Name (LVL4, 0x0416)
    Name (SMIP, 0xB2)
    Name (GPBS, 0x1180)
    Name (GPLN, 0x80)
    Name (APCB, 0xFEC00000)
    Name (APCL, 0x1000)
    Name (PM30, 0x0430)
    Name (SRCB, 0xFED1C000)
    Name (SRCL, 0x4000)
    Name (SUSW, 0xFF)
    Name (ACPH, 0xDE)
    Name (ASSB, 0x00)
    Name (AOTB, 0x00)
    Name (AAXB, 0x00)
    Name (PEHP, 0x01)
    Name (SHPC, 0x01)
    Name (PEPM, 0x01)
    Name (PEER, 0x01)
    Name (PECS, 0x01)
    Name (ITKE, 0x00)
    Name (TRTP, 0x01)
    Name (TRTD, 0x02)
    Name (TRTI, 0x03)
    Name (GCDD, 0x01)
    Name (DSTA, 0x0A)
    Name (DSLO, 0x0C)
    Name (DSLC, 0x0E)
    Name (PITS, 0x10)
    Name (SBCS, 0x12)
    Name (SALS, 0x13)
    Name (LSSS, 0x2A)
    Name (PSSS, 0x2B)
    Name (SOOT, 0x35)
    Name (ESCS, 0x48)
    Name (PDBR, 0x4D)
    Name (SMBL, 0x10)
    OperationRegion (GNVS, SystemMemory, 0x7BB9EDBC, 0x0100)
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
        WNVA,   32, 
        WNVB,   32, 
        WNVC,   32, 
        WNVD,   32, 
        WFLG,   32, 
        WNVS,   32, 
        WNVI,   32, 
        DTSE,   8, 
        DTS1,   8, 
        DTS2,   8, 
        DTSF,   8, 
        APIC,   8, 
        MPEN,   8, 
        PCP0,   8, 
        PCP1,   8, 
        PPCM,   8, 
        PPMF,   32, 
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
        KSV0,   32, 
        KSV1,   8, 
        BDSP,   8, 
        PTY1,   8, 
        PTY2,   8, 
        PSCL,   8, 
        TVF1,   8, 
        TVF2,   8, 
        GETM,   8, 
        PEGD,   8, 
                Offset (0x75), 
        DSTS,   8, 
                Offset (0x78), 
        TPMP,   8, 
        TPME,   8, 
                Offset (0x82), 
        GTF0,   56, 
        GTF2,   56, 
        IDEM,   8, 
        GTF1,   56, 
        BID,    8, 
                Offset (0xAA), 
        ASLB,   32, 
        IBTT,   8, 
        IPAT,   8, 
        ITVF,   8, 
        ITVM,   8, 
        IPSC,   8, 
        IBLC,   8, 
        IBIA,   8, 
        ISSC,   8, 
        I409,   8, 
        I509,   8, 
        I609,   8, 
        I709,   8, 
        IDMM,   8, 
        IDMS,   8, 
        IF1E,   8, 
        HVCO,   8, 
        NXD1,   32, 
        NXD2,   32, 
        NXD3,   32, 
        NXD4,   32, 
        NXD5,   32, 
        NXD6,   32, 
        NXD7,   32, 
        NXD8,   32, 
        GSMI,   8, 
        PAVP,   8, 
                Offset (0xEB), 
        DSEN,   8, 
        ECON,   8, 
        GPIC,   8, 
        CTYP,   8, 
        L01C,   8, 
        VFN0,   8, 
        VFN1,   8
    }

    Scope (\_SB)
    {
        Name (PR00, Package (0x18)
        {
            Package (0x04)
            {
                0x0003FFFF, 
                0x00, 
                LNKA, 
                0x00
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                0x01, 
                LNKB, 
                0x00
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                0x02, 
                LNKC, 
                0x00
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                0x03, 
                LNKD, 
                0x00
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                0x00, 
                LNKA, 
                0x00
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                0x00, 
                LNKA, 
                0x00
            }, 

            Package (0x04)
            {
                0x001FFFFF, 
                0x00, 
                LNKD, 
                0x00
            }, 

            Package (0x04)
            {
                0x001FFFFF, 
                0x01, 
                LNKD, 
                0x00
            }, 

            Package (0x04)
            {
                0x001FFFFF, 
                0x02, 
                LNKD, 
                0x00
            }, 

            Package (0x04)
            {
                0x001FFFFF, 
                0x03, 
                LNKA, 
                0x00
            }, 

            Package (0x04)
            {
                0x001DFFFF, 
                0x00, 
                LNKH, 
                0x00
            }, 

            Package (0x04)
            {
                0x001DFFFF, 
                0x01, 
                LNKB, 
                0x00
            }, 

            Package (0x04)
            {
                0x001DFFFF, 
                0x02, 
                LNKC, 
                0x00
            }, 

            Package (0x04)
            {
                0x001DFFFF, 
                0x03, 
                LNKA, 
                0x00
            }, 

            Package (0x04)
            {
                0x001AFFFF, 
                0x00, 
                LNKE, 
                0x00
            }, 

            Package (0x04)
            {
                0x001AFFFF, 
                0x01, 
                LNKE, 
                0x00
            }, 

            Package (0x04)
            {
                0x001AFFFF, 
                0x02, 
                LNKE, 
                0x00
            }, 

            Package (0x04)
            {
                0x001AFFFF, 
                0x03, 
                LNKA, 
                0x00
            }, 

            Package (0x04)
            {
                0x001BFFFF, 
                0x00, 
                LNKF, 
                0x00
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                0x00, 
                LNKA, 
                0x00
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                0x01, 
                LNKB, 
                0x00
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                0x02, 
                LNKC, 
                0x00
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                0x03, 
                LNKD, 
                0x00
            }, 

            Package (0x04)
            {
                0x0019FFFF, 
                0x00, 
                LNKB, 
                0x00
            }
        })
        Name (AR00, Package (0x18)
        {
            Package (0x04)
            {
                0x0003FFFF, 
                0x00, 
                0x00, 
                0x10
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                0x01, 
                0x00, 
                0x11
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                0x02, 
                0x00, 
                0x12
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                0x03, 
                0x00, 
                0x13
            }, 

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
                0x001FFFFF, 
                0x00, 
                0x00, 
                0x13
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
                0x02, 
                0x00, 
                0x13
            }, 

            Package (0x04)
            {
                0x001FFFFF, 
                0x03, 
                0x00, 
                0x10
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
                0x11
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
                0x001AFFFF, 
                0x00, 
                0x00, 
                0x14
            }, 

            Package (0x04)
            {
                0x001AFFFF, 
                0x01, 
                0x00, 
                0x14
            }, 

            Package (0x04)
            {
                0x001AFFFF, 
                0x02, 
                0x00, 
                0x14
            }, 

            Package (0x04)
            {
                0x001AFFFF, 
                0x03, 
                0x00, 
                0x10
            }, 

            Package (0x04)
            {
                0x001BFFFF, 
                0x00, 
                0x00, 
                0x15
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
                0x0019FFFF, 
                0x00, 
                0x00, 
                0x11
            }
        })
        Name (PR02, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                0x00, 
                LNKA, 
                0x00
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x01, 
                LNKB, 
                0x00
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKC, 
                0x00
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKD, 
                0x00
            }
        })
        Name (AR02, Package (0x04)
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
        Name (PR04, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                0x00, 
                LNKA, 
                0x00
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x01, 
                LNKB, 
                0x00
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKC, 
                0x00
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKD, 
                0x00
            }
        })
        Name (AR04, Package (0x04)
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
        Name (PR05, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                0x00, 
                LNKB, 
                0x00
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x01, 
                LNKC, 
                0x00
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKD, 
                0x00
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKA, 
                0x00
            }
        })
        Name (AR05, Package (0x04)
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
        Name (PR06, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                0x00, 
                LNKD, 
                0x00
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x01, 
                LNKA, 
                0x00
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKB, 
                0x00
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKC, 
                0x00
            }
        })
        Name (AR06, Package (0x04)
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
        Name (PR07, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                0x00, 
                LNKA, 
                0x00
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x01, 
                LNKB, 
                0x00
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKC, 
                0x00
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKD, 
                0x00
            }
        })
        Name (AR07, Package (0x04)
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
        Name (PR08, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                0x00, 
                LNKB, 
                0x00
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x01, 
                LNKC, 
                0x00
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKD, 
                0x00
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKA, 
                0x00
            }
        })
        Name (AR08, Package (0x04)
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
        Name (PR01, Package (0x05)
        {
            Package (0x04)
            {
                0x0009FFFF, 
                0x00, 
                LNKH, 
                0x00
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                0x00, 
                LNKG, 
                0x00
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                0x01, 
                LNKG, 
                0x00
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                0x02, 
                LNKG, 
                0x00
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                0x03, 
                LNKG, 
                0x00
            }
        })
        Name (AR01, Package (0x05)
        {
            Package (0x04)
            {
                0x0009FFFF, 
                0x00, 
                0x00, 
                0x17
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
                0x16
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                0x02, 
                0x00, 
                0x16
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                0x03, 
                0x00, 
                0x16
            }
        })
        Name (PRSA, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {3,4,5,6,7,10,11,12,14,15}
        })
        Alias (PRSA, PRSB)
        Alias (PRSA, PRSC)
        Alias (PRSA, PRSD)
        Alias (PRSA, PRSE)
        Alias (PRSA, PRSF)
        Alias (PRSA, PRSG)
        Alias (PRSA, PRSH)
        Device (PCI0)
        {
            Name (_HID, EisaId ("PNP0A08"))
            Name (_CID, EisaId ("PNP0A03"))
            Name (_ADR, 0x00)
            Method (^BN00, 0, NotSerialized)
            {
                Return (0x00)
            }

            Method (_BBN, 0, NotSerialized)
            {
                Return (BN00 ())
            }

            Name (_UID, 0x00)
            Method (_PRT, 0, NotSerialized)
            {
                If (PICM)
                {
                    Return (AR00)
                }

                Return (PR00)
            }

            OperationRegion (HBUS, PCI_Config, 0x40, 0xC0)
            Field (HBUS, DWordAcc, NoLock, Preserve)
            {
                EPEN,   1, 
                    ,   11, 
                EPBR,   20, 
                        Offset (0x08), 
                MHEN,   1, 
                    ,   13, 
                MHBR,   18, 
                        Offset (0x20), 
                PXEN,   1, 
                PXSZ,   2, 
                    ,   23, 
                PXBR,   6, 
                        Offset (0x28), 
                DIEN,   1, 
                    ,   11, 
                DIBR,   20, 
                        Offset (0x30), 
                IPEN,   1, 
                    ,   11, 
                IPBR,   20, 
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
                        Offset (0x62), 
                TUUD,   16, 
                        Offset (0x70), 
                    ,   4, 
                TLUD,   12, 
                        Offset (0x89), 
                    ,   3, 
                GTSE,   1, 
                        Offset (0x8A)
            }

            OperationRegion (MCHT, SystemMemory, 0xFED11000, 0xFF)
            Field (MCHT, ByteAcc, NoLock, Preserve)
            {
                        Offset (0x1E), 
                T0IS,   16, 
                        Offset (0x5E), 
                T1IS,   16, 
                        Offset (0xEF), 
                ESCS,   8
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
                    0xDFFFFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000000,         // Length
                    ,, _Y0D, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0xF0000000,         // Range Minimum
                    0xFEBFFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x0EC00000,         // Length
                    ,, _Y0E, AddressRangeMemory, TypeStatic)
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

                CreateDWordField (BUF0, \_SB.PCI0._Y0D._MIN, M1MN)
                CreateDWordField (BUF0, \_SB.PCI0._Y0D._MAX, M1MX)
                CreateDWordField (BUF0, \_SB.PCI0._Y0D._LEN, M1LN)
                CreateDWordField (BUF0, \_SB.PCI0._Y0E._MIN, M2MN)
                CreateDWordField (BUF0, \_SB.PCI0._Y0E._MAX, M2MX)
                CreateDWordField (BUF0, \_SB.PCI0._Y0E._LEN, M2LN)
                ShiftLeft (PXBR, 0x1A, M1MX)
                ShiftRight (0x10000000, PXSZ, Local0)
                Add (M1MX, Local0, M2MN)
                Add (Subtract (M2MX, M2MN), 0x01, M2LN)
                Subtract (M1MX, 0x01, M1MX)
                ShiftLeft (TLUD, 0x14, M1MN)
                Add (Subtract (M1MX, M1MN), 0x01, M1LN)
                Return (BUF0)
            }

            Device (PEGP)
            {
                Name (_ADR, 0x00010000)
                Method (_STA, 0, NotSerialized)
                {
                    If (IGDS)
                    {
                        Return (0x00)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }

                Device (VGA)
                {
                    Name (_ADR, 0x00)
                    Method (MXMI, 1, NotSerialized)
                    {
                        Return (0x21)
                    }

                    Method (MXMS, 1, NotSerialized)
                    {
                        Return (MXM2)
                    }

                    Method (_DOS, 1, NotSerialized)
                    {
                        Store (And (Arg0, 0x03), DSEN)
                    }

                    Method (_DOD, 0, NotSerialized)
                    {
                        Name (PEGT, Package (0x04)
                        {
                            0xFFFFFFFF, 
                            0xFFFFFFFF, 
                            0xFFFFFFFF, 
                            0xFFFFFFFF
                        })
                        Store (Or (0x00010000, 0x0100), Index (PEGT, 0x00))
                        Store (Or (0x00010000, 0x0200), Index (PEGT, 0x01))
                        Store (Or (0x00010000, 0x0110), Index (PEGT, 0x02))
                        Store (Or (0x00010000, 0x0210), Index (PEGT, 0x03))
                        Return (PEGT)
                    }

                    Device (CRT)
                    {
                        Name (_ADR, 0x0100)
                        Method (_DCS, 0, NotSerialized)
                        {
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
                        Name (_ADR, 0x0110)
                        Method (_DCS, 0, NotSerialized)
                        {
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

                        Method (_BCL, 0, NotSerialized)
                        {
                            Return (BCLP)
                        }

                        Method (_BCM, 1, NotSerialized)
                        {
                            Store (0x01, Local0)
                            Store (0x02, Local1)
                            While (Local0)
                            {
                                If (LEqual (Arg0, DerefOf (Index (BCLP, Local1))))
                                {
                                    Store (0x00, Local0)
                                }
                                Else
                                {
                                    Increment (Local1)
                                    If (LEqual (0x0B, Local1))
                                    {
                                        Store (0x00, Local0)
                                    }
                                }
                            }

                            Decrement (Local1)
                            Decrement (Local1)
                            If (\_SB.PCI0.LPCB.EC0.BNCM)
                            {
                                If (\_SB.PCI0.LPCB.EC0.ACST)
                                {
                                    Store (Local1, \_SB.PCI0.LPCB.EC0.BNAC)
                                }
                                Else
                                {
                                    Store (Local1, \_SB.PCI0.LPCB.EC0.BNDC)
                                }
                            }
                            Else
                            {
                                Store (Local1, \_SB.PCI0.LPCB.EC0.BNAC)
                            }
                        }

                        Method (_BQC, 0, NotSerialized)
                        {
                            If (\_SB.PCI0.LPCB.EC0.BNCM)
                            {
                                If (\_SB.PCI0.LPCB.EC0.ACST)
                                {
                                    Store (\_SB.PCI0.LPCB.EC0.BNAC, Local1)
                                }
                                Else
                                {
                                    Store (\_SB.PCI0.LPCB.EC0.BNDC, Local1)
                                }
                            }
                            Else
                            {
                                Store (\_SB.PCI0.LPCB.EC0.BNAC, Local1)
                            }

                            Increment (Local1)
                            Increment (Local1)
                            Store (DerefOf (Index (BCLP, Local1)), Local0)
                            Return (Local0)
                        }
                    }

                    Device (TV0)
                    {
                        Name (_ADR, 0x0200)
                        Method (_DCS, 0, NotSerialized)
                        {
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
                        Name (_ADR, 0x0210)
                        Method (_DCS, 0, NotSerialized)
                        {
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
                    Method (NVIF, 3, NotSerialized)
                    {
                        Store (Buffer (0x08) {}, Local1)
                        CreateDWordField (Local1, 0x00, STA0)
                        CreateDWordField (Local1, 0x04, DAT0)
                        Store (0x80000002, STA0)
                        Store (0x00, DAT0)
                        If (LEqual (Arg0, 0x01))
                        {
                            If (LEqual (Arg1, 0x00))
                            {
                                Store (0x00, STA0)
                                Store (0x01, DAT0)
                            }

                            Return (Local1)
                        }

                        If (LEqual (Arg0, 0x0B))
                        {
                            If (LEqual (Arg1, 0x00))
                            {
                                Store (0x00, STA0)
                            }

                            If (LEqual (Arg1, 0x03))
                            {
                                CreateWordField (Arg2, 0x00, CDID)
                                CreateWordField (Arg2, 0x02, CDST)
                                CreateWordField (Arg2, 0x04, LDID)
                                CreateWordField (Arg2, 0x06, LDST)
                                CreateWordField (Arg2, 0x08, HDID)
                                CreateWordField (Arg2, 0x0A, HDST)
                                CreateWordField (Arg2, 0x0C, TDID)
                                CreateWordField (Arg2, 0x0E, TDST)
                                Store (0x00, CSTE)
                                Store (0x00, CADL)
                                If (LEqual (CDID, 0x0100))
                                {
                                    If (And (0x04, CDST))
                                    {
                                        Or (CSTE, 0x0101, CSTE)
                                    }

                                    If (And (0x10, CDST))
                                    {
                                        Or (CADL, 0x0101, CADL)
                                    }
                                }

                                If (LEqual (LDID, 0x0110))
                                {
                                    If (And (0x04, LDST))
                                    {
                                        Or (CSTE, 0x0808, CSTE)
                                    }

                                    If (And (0x10, LDST))
                                    {
                                        Or (CADL, 0x0808, CADL)
                                    }
                                }

                                If (LEqual (HDID, 0x0210))
                                {
                                    If (And (0x04, HDST))
                                    {
                                        Or (CSTE, 0x0404, CSTE)
                                    }

                                    If (And (0x10, HDST))
                                    {
                                        Or (CADL, 0x0404, CADL)
                                    }
                                }

                                If (LEqual (TDID, 0x0200))
                                {
                                    If (And (0x04, TDST))
                                    {
                                        Or (CSTE, 0x0202, CSTE)
                                    }

                                    If (And (0x10, TDST))
                                    {
                                        Or (CADL, 0x0202, CADL)
                                    }
                                }
                            }

                            Return (Local1)
                        }

                        Return (Local1)
                    }

                    Scope (\_SB)
                    {
                        Device (WMI0)
                        {
                            Name (_HID, EisaId ("PNP0C14"))
                            Name (_UID, "NVIF")
                            Name (_WDG, Buffer (0x78)
                            {
                                /* 0000 */    0xF2, 0x9A, 0x79, 0xA1, 0x29, 0x94, 0x29, 0x45, 
                                /* 0008 */    0x92, 0x7E, 0xDF, 0xE1, 0x37, 0x36, 0xEE, 0xBA, 
                                /* 0010 */    0x41, 0x42, 0x01, 0x02, 0x21, 0x12, 0x90, 0x05, 
                                /* 0018 */    0x66, 0xD5, 0xD1, 0x11, 0xB2, 0xF0, 0x00, 0xA0, 
                                /* 0020 */    0xC9, 0x06, 0x29, 0x10, 0x42, 0x41, 0x01, 0x00, 
                                /* 0028 */    0xC3, 0x9A, 0x79, 0xA1, 0x29, 0x94, 0x29, 0x45, 
                                /* 0030 */    0x92, 0x7E, 0xDF, 0xE1, 0x37, 0x36, 0xEE, 0xBA, 
                                /* 0038 */    0xC3, 0x00, 0x00, 0x08, 0xC5, 0x9A, 0x79, 0xA1, 
                                /* 0040 */    0x29, 0x94, 0x29, 0x45, 0x92, 0x7E, 0xDF, 0xE1, 
                                /* 0048 */    0x37, 0x36, 0xEE, 0xBA, 0xC5, 0x00, 0x00, 0x08, 
                                /* 0050 */    0xCA, 0x9A, 0x79, 0xA1, 0x29, 0x94, 0x29, 0x45, 
                                /* 0058 */    0x92, 0x7E, 0xDF, 0xE1, 0x37, 0x36, 0xEE, 0xBA, 
                                /* 0060 */    0xCA, 0x00, 0x00, 0x08, 0xCB, 0x9A, 0x79, 0xA1, 
                                /* 0068 */    0x29, 0x94, 0x29, 0x45, 0x92, 0x7E, 0xDF, 0xE1, 
                                /* 0070 */    0x37, 0x36, 0xEE, 0xBA, 0xCB, 0x00, 0x00, 0x08
                            })
                            Name (WQBA, Buffer (0x1067)
                            {
                                /* 0000 */    0x46, 0x4F, 0x4D, 0x42, 0x01, 0x00, 0x00, 0x00, 
                                /* 0008 */    0x57, 0x10, 0x00, 0x00, 0x78, 0x4F, 0x00, 0x00, 
                                /* 0010 */    0x44, 0x53, 0x00, 0x01, 0x1A, 0x7D, 0xDA, 0x54, 
                                /* 0018 */    0x28, 0x43, 0xA7, 0x00, 0x01, 0x06, 0x18, 0x42, 
                                /* 0020 */    0x10, 0x3D, 0x10, 0x12, 0x46, 0x62, 0x02, 0xC9, 
                                /* 0028 */    0x82, 0x90, 0x14, 0x18, 0xF1, 0x18, 0xC6, 0x20, 
                                /* 0030 */    0x96, 0x04, 0x21, 0x07, 0x7C, 0x4C, 0x80, 0x10, 
                                /* 0038 */    0x08, 0xC9, 0x14, 0xE0, 0x5B, 0x80, 0x63, 0x01, 
                                /* 0040 */    0x86, 0x05, 0xC8, 0x16, 0x60, 0x19, 0x8A, 0x98, 
                                /* 0048 */    0x90, 0x00, 0x31, 0x34, 0x88, 0x38, 0x34, 0x84, 
                                /* 0050 */    0x10, 0x12, 0x01, 0x4B, 0x65, 0x8C, 0xC1, 0x10, 
                                /* 0058 */    0xDA, 0x4A, 0xD8, 0xB6, 0x61, 0xA9, 0x57, 0x01, 
                                /* 0060 */    0x36, 0x05, 0x98, 0x84, 0x44, 0xC9, 0x83, 0x41, 
                                /* 0068 */    0x8D, 0xC3, 0xFD, 0x09, 0xE4, 0x57, 0x00, 0x42, 
                                /* 0070 */    0x87, 0x33, 0x91, 0x41, 0x01, 0x4E, 0x11, 0x44, 
                                /* 0078 */    0x10, 0xC8, 0x23, 0xE0, 0xCE, 0x05, 0x08, 0x47, 
                                /* 0080 */    0xD1, 0x7C, 0xCE, 0xC1, 0x02, 0xE1, 0x51, 0x62, 
                                /* 0088 */    0xE0, 0x51, 0xB0, 0xD1, 0xCF, 0xA4, 0x45, 0x78, 
                                /* 0090 */    0x09, 0x45, 0xD1, 0x14, 0xA2, 0x24, 0x28, 0x17, 
                                /* 0098 */    0x41, 0xBA, 0x20, 0xA4, 0x74, 0x7C, 0x42, 0x28, 
                                /* 00A0 */    0x1D, 0x9A, 0x48, 0x1B, 0x26, 0x4A, 0xCE, 0x78, 
                                /* 00A8 */    0x20, 0x69, 0x44, 0x21, 0x1E, 0x67, 0x44, 0x06, 
                                /* 00B0 */    0x83, 0x95, 0x4B, 0x4E, 0x47, 0x6E, 0x81, 0x30, 
                                /* 00B8 */    0xA8, 0xC1, 0x83, 0x47, 0x0A, 0xA1, 0x3C, 0xC0, 
                                /* 00C0 */    0x28, 0xCA, 0x28, 0x50, 0x03, 0xF2, 0xE8, 0x3D, 
                                /* 00C8 */    0x78, 0xDC, 0xD4, 0x3C, 0x06, 0x0B, 0x82, 0x90, 
                                /* 00D0 */    0x8B, 0x63, 0x00, 0x4A, 0x39, 0xA0, 0x30, 0x4B, 
                                /* 00D8 */    0x06, 0xA7, 0x03, 0x64, 0x80, 0x7C, 0x10, 0x76, 
                                /* 00E0 */    0x0D, 0x28, 0xF3, 0x70, 0xF4, 0x54, 0x80, 0x1B, 
                                /* 00E8 */    0x94, 0xFF, 0xFF, 0x03, 0x7D, 0x21, 0x38, 0xF0, 
                                /* 00F0 */    0x52, 0x05, 0x98, 0x1D, 0xB8, 0xC6, 0xED, 0x53, 
                                /* 00F8 */    0xC0, 0x99, 0x1C, 0x44, 0xD3, 0x02, 0x74, 0x0B, 
                                /* 0100 */    0xF0, 0x0C, 0x49, 0x02, 0x41, 0xC8, 0xC9, 0xA8, 
                                /* 0108 */    0x50, 0xE7, 0x00, 0x8F, 0xD0, 0xDE, 0x05, 0x48, 
                                /* 0110 */    0x1C, 0x8D, 0x60, 0x4F, 0x23, 0x7C, 0xDC, 0x13, 
                                /* 0118 */    0x63, 0x03, 0x03, 0x8E, 0xD6, 0xC7, 0x45, 0xA6, 
                                /* 0120 */    0xD2, 0x99, 0x00, 0x65, 0x90, 0x24, 0xD2, 0xC0, 
                                /* 0128 */    0xD0, 0xE3, 0xB0, 0x48, 0x48, 0xCD, 0xAF, 0xE8, 
                                /* 0130 */    0x89, 0x41, 0x19, 0x19, 0xB0, 0x9E, 0xD2, 0x31, 
                                /* 0138 */    0x60, 0x46, 0xC6, 0x81, 0x9F, 0x00, 0x6A, 0x06, 
                                /* 0140 */    0xD6, 0x70, 0x1E, 0x1A, 0x7C, 0xC6, 0x30, 0x42, 
                                /* 0148 */    0x8C, 0x03, 0x62, 0xE2, 0xCE, 0x0F, 0x74, 0x28, 
                                /* 0150 */    0xF0, 0x15, 0x1F, 0x30, 0xC8, 0x15, 0xC2, 0xD3, 
                                /* 0158 */    0x3B, 0x98, 0x04, 0xB1, 0x1E, 0x40, 0xC0, 0x70, 
                                /* 0160 */    0x1A, 0x61, 0x0A, 0x27, 0x46, 0xB0, 0xCF, 0xE7, 
                                /* 0168 */    0xFF, 0x7F, 0x94, 0xA7, 0xC4, 0xCE, 0x1C, 0x47, 
                                /* 0170 */    0x64, 0x94, 0xE3, 0x0B, 0xF5, 0x12, 0xC2, 0x8E, 
                                /* 0178 */    0x00, 0x3E, 0x85, 0x80, 0x19, 0xE5, 0x3D, 0x85, 
                                /* 0180 */    0x9F, 0x43, 0xC0, 0x1E, 0xE4, 0x10, 0x82, 0x92, 
                                /* 0188 */    0x7E, 0x0E, 0x01, 0xA5, 0xC8, 0x73, 0x08, 0x0D, 
                                /* 0190 */    0x73, 0x0E, 0x41, 0x03, 0xFB, 0xE0, 0xF0, 0xAA, 
                                /* 0198 */    0x61, 0xED, 0xB8, 0x02, 0x79, 0x10, 0x01, 0xBC, 
                                /* 01A0 */    0xFF, 0xFF, 0x0F, 0x22, 0x80, 0xC3, 0x38, 0xE7, 
                                /* 01A8 */    0x04, 0xF4, 0x51, 0xCA, 0xD0, 0x6F, 0x0C, 0x07, 
                                /* 01B0 */    0xF3, 0x16, 0xE2, 0x0B, 0x10, 0xE6, 0xA0, 0x00, 
                                /* 01B8 */    0x9C, 0xCF, 0x08, 0x4F, 0x25, 0xE0, 0xB8, 0x02, 
                                /* 01C0 */    0x1C, 0xC1, 0xC9, 0x61, 0xAE, 0x24, 0xF6, 0x79, 
                                /* 01C8 */    0x2A, 0xD1, 0xC1, 0x02, 0x7F, 0x28, 0x01, 0x4E, 
                                /* 01D0 */    0xFF, 0xFF, 0x43, 0x09, 0xF8, 0x84, 0x93, 0x53, 
                                /* 01D8 */    0x20, 0x4B, 0x85, 0xD1, 0x91, 0xC4, 0x70, 0x5C, 
                                /* 01E0 */    0x26, 0x90, 0x54, 0x1C, 0x70, 0xE8, 0x71, 0x0D, 
                                /* 01E8 */    0x37, 0x12, 0x1F, 0xD7, 0x60, 0x9C, 0x77, 0xD8, 
                                /* 01F0 */    0x3C, 0xC3, 0x62, 0xC4, 0x83, 0xA3, 0x47, 0xF7, 
                                /* 01F8 */    0x88, 0xC0, 0xE6, 0x1C, 0xF7, 0xBD, 0xC0, 0xEE, 
                                /* 0200 */    0x27, 0xAD, 0xCB, 0x42, 0x88, 0xD6, 0x26, 0x22, 
                                /* 0208 */    0x84, 0x27, 0x9C, 0x20, 0x6D, 0xE1, 0xE8, 0x52, 
                                /* 0210 */    0x10, 0xA6, 0x31, 0x14, 0x41, 0x44, 0x88, 0x19, 
                                /* 0218 */    0x27, 0x4A, 0x73, 0x08, 0x1A, 0x71, 0x14, 0x43, 
                                /* 0220 */    0x44, 0x38, 0x81, 0x10, 0x27, 0x7B, 0x92, 0x41, 
                                /* 0228 */    0xC2, 0xC7, 0x08, 0x1B, 0x2D, 0x4A, 0xFB, 0x23, 
                                /* 0230 */    0x44, 0x10, 0xF8, 0x38, 0x86, 0x13, 0x35, 0x24, 
                                /* 0238 */    0x3A, 0x1C, 0x9F, 0x07, 0x0E, 0xEE, 0x51, 0xC2, 
                                /* 0240 */    0x87, 0x12, 0x1F, 0x1C, 0x0C, 0xF1, 0x32, 0xF4, 
                                /* 0248 */    0x1C, 0xE3, 0xA1, 0x7B, 0xDA, 0x47, 0x75, 0x3C, 
                                /* 0250 */    0x47, 0xE5, 0x1B, 0xC5, 0x21, 0x1D, 0x53, 0x6F, 
                                /* 0258 */    0xD3, 0xD0, 0x3C, 0x62, 0x9C, 0xCE, 0xD9, 0xC4, 
                                /* 0260 */    0x89, 0x11, 0x25, 0x58, 0x94, 0xC3, 0x89, 0xF5, 
                                /* 0268 */    0x52, 0x13, 0x22, 0xCA, 0x3B, 0xC0, 0x19, 0x79, 
                                /* 0270 */    0x72, 0xC6, 0x0F, 0x73, 0x44, 0x46, 0xF4, 0xA4, 
                                /* 0278 */    0xC2, 0x1C, 0x80, 0x47, 0xE9, 0x51, 0x61, 0x2F, 
                                /* 0280 */    0x11, 0x61, 0x30, 0x87, 0x1D, 0x9F, 0x02, 0x3C, 
                                /* 0288 */    0xF9, 0x57, 0x06, 0x5B, 0xBD, 0x38, 0x10, 0x90, 
                                /* 0290 */    0x03, 0x3A, 0xAE, 0x13, 0x3B, 0xAF, 0x10, 0x2F, 
                                /* 0298 */    0x3B, 0xC6, 0xA8, 0xFE, 0x4E, 0x42, 0x40, 0x8E, 
                                /* 02A0 */    0xED, 0x99, 0xC9, 0x03, 0x78, 0x5D, 0x88, 0xFA, 
                                /* 02A8 */    0xCA, 0xE0, 0x21, 0x60, 0x30, 0xC3, 0x60, 0x4E, 
                                /* 02B0 */    0x05, 0x3E, 0x3C, 0xF9, 0xFF, 0x0F, 0x19, 0x37, 
                                /* 02B8 */    0xD8, 0x81, 0xB2, 0x23, 0x0A, 0x3F, 0x4F, 0xBC, 
                                /* 02C0 */    0x88, 0x3C, 0x7B, 0x78, 0xFE, 0x46, 0x80, 0x31, 
                                /* 02C8 */    0xB5, 0x18, 0x3E, 0x47, 0x84, 0xC2, 0xA9, 0x03, 
                                /* 02D0 */    0xA1, 0x03, 0xC1, 0x88, 0x1D, 0x0B, 0xFA, 0x9C, 
                                /* 02D8 */    0xE8, 0x03, 0xC6, 0xA1, 0x3C, 0x78, 0xF8, 0xDE, 
                                /* 02E0 */    0xC1, 0x8E, 0x53, 0x1E, 0xCD, 0xB9, 0x9C, 0x95, 
                                /* 02E8 */    0xCF, 0x47, 0xB8, 0x6B, 0xC0, 0xB3, 0x48, 0x4C, 
                                /* 02F0 */    0xA3, 0x1D, 0x53, 0x64, 0x3E, 0x06, 0xCC, 0x69, 
                                /* 02F8 */    0xC0, 0x27, 0x47, 0x70, 0x9C, 0x24, 0xCE, 0xC4, 
                                /* 0300 */    0x17, 0x01, 0x1F, 0x25, 0x38, 0xD0, 0xB9, 0xF8, 
                                /* 0308 */    0x0A, 0xE2, 0x23, 0x08, 0x70, 0x3F, 0x48, 0x78, 
                                /* 0310 */    0x80, 0x70, 0x30, 0xA3, 0x9E, 0x45, 0x6C, 0x1F, 
                                /* 0318 */    0xD1, 0xB0, 0x62, 0x15, 0x1C, 0x46, 0x30, 0xF2, 
                                /* 0320 */    0x60, 0x74, 0x18, 0xC1, 0x49, 0x03, 0x12, 0x8C, 
                                /* 0328 */    0x87, 0x64, 0x11, 0xEB, 0xF0, 0x49, 0x94, 0x8E, 
                                /* 0330 */    0xD2, 0xB3, 0x85, 0x31, 0x0C, 0xEC, 0x29, 0x85, 
                                /* 0338 */    0xFF, 0xFF, 0x47, 0xCC, 0xCF, 0x60, 0x1E, 0xCF, 
                                /* 0340 */    0xE3, 0xC2, 0x4B, 0x68, 0x84, 0xE0, 0x81, 0x4F, 
                                /* 0348 */    0xF5, 0x71, 0xE0, 0xF0, 0xA2, 0x3F, 0x0F, 0xF8, 
                                /* 0350 */    0x0C, 0x01, 0x67, 0x00, 0xE0, 0x18, 0xCC, 0x23, 
                                /* 0358 */    0x04, 0x1B, 0x00, 0x9C, 0x31, 0xE1, 0x46, 0xED, 
                                /* 0360 */    0x11, 0x7A, 0x00, 0x78, 0xE4, 0x17, 0x84, 0x48, 
                                /* 0368 */    0x2F, 0x15, 0x06, 0x7A, 0xCE, 0x80, 0x7F, 0x4A, 
                                /* 0370 */    0xC0, 0x1D, 0x94, 0x7C, 0xFA, 0xF0, 0x20, 0xF0, 
                                /* 0378 */    0xE7, 0x87, 0x77, 0x09, 0x8F, 0xD2, 0x47, 0x1A, 
                                /* 0380 */    0x76, 0x2F, 0x78, 0x1B, 0x30, 0xE6, 0x29, 0x18, 
                                /* 0388 */    0x9E, 0x1F, 0x65, 0x7C, 0x90, 0x00, 0xC7, 0x7D, 
                                /* 0390 */    0xC4, 0xD7, 0x0A, 0x5F, 0x07, 0x7D, 0xF8, 0xF3, 
                                /* 0398 */    0x61, 0x00, 0x7F, 0x08, 0xF4, 0x49, 0x23, 0xCE, 
                                /* 03A0 */    0x43, 0x13, 0x9B, 0x1F, 0xEE, 0x88, 0x04, 0x58, 
                                /* 03A8 */    0x90, 0x77, 0x52, 0xA6, 0xFF, 0x7F, 0x20, 0x0B, 
                                /* 03B0 */    0x3A, 0x29, 0xD3, 0x51, 0x21, 0x68, 0x74, 0x40, 
                                /* 03B8 */    0xF6, 0x31, 0x02, 0x9C, 0x82, 0x0F, 0x00, 0xA0, 
                                /* 03C0 */    0x19, 0xE1, 0x23, 0x81, 0x4F, 0x70, 0x4F, 0x2C, 
                                /* 03C8 */    0x1E, 0x3F, 0xE0, 0x2B, 0xE4, 0xA9, 0x04, 0x15, 
                                /* 03D0 */    0xEB, 0x54, 0x82, 0x8E, 0x04, 0x24, 0x13, 0x47, 
                                /* 03D8 */    0x1B, 0xF4, 0x19, 0xCB, 0x27, 0x0D, 0x9F, 0xB8, 
                                /* 03E0 */    0x60, 0xCC, 0xEC, 0x3D, 0xCD, 0x27, 0x29, 0xDF, 
                                /* 03E8 */    0xB9, 0x30, 0x87, 0x2E, 0x70, 0x5D, 0x86, 0xDE, 
                                /* 03F0 */    0xA0, 0x5E, 0x74, 0x5E, 0x8A, 0x62, 0xBD, 0xEA, 
                                /* 03F8 */    0x84, 0x78, 0x9C, 0x7A, 0x8F, 0x3A, 0xBB, 0xA3, 
                                /* 0400 */    0x08, 0x11, 0xC5, 0x87, 0x2E, 0x2C, 0xD4, 0x6B, 
                                /* 0408 */    0x95, 0x0F, 0x5D, 0x30, 0xFE, 0xFF, 0x87, 0x2E, 
                                /* 0410 */    0x38, 0x27, 0x01, 0x8F, 0x9B, 0x0F, 0xCF, 0x67, 
                                /* 0418 */    0x10, 0x4F, 0xE6, 0xF4, 0x5E, 0x41, 0xDE, 0x0B, 
                                /* 0420 */    0x7C, 0x73, 0xF5, 0xF9, 0xD5, 0xB7, 0x02, 0x3E, 
                                /* 0428 */    0xF3, 0x58, 0x67, 0xE8, 0x23, 0x12, 0x1B, 0x33, 
                                /* 0430 */    0xEE, 0x84, 0x05, 0x9C, 0x8E, 0x51, 0x00, 0x2F, 
                                /* 0438 */    0x0E, 0x02, 0x3E, 0x46, 0x81, 0xE1, 0xD2, 0xF0, 
                                /* 0440 */    0x0C, 0x80, 0x7C, 0x1B, 0xE8, 0xFF, 0x7F, 0x2E, 
                                /* 0448 */    0xE0, 0x87, 0x16, 0x7E, 0x0E, 0x06, 0x97, 0x90, 
                                /* 0450 */    0xA3, 0x0B, 0x3D, 0x2C, 0xE2, 0x8E, 0xD3, 0xB0, 
                                /* 0458 */    0x0F, 0x1B, 0x98, 0x33, 0x0A, 0xF0, 0x3F, 0x57, 
                                /* 0460 */    0xE0, 0xA0, 0x71, 0x88, 0x2F, 0x13, 0xAF, 0xA8, 
                                /* 0468 */    0x1E, 0xCA, 0xF9, 0xE1, 0xCE, 0x0B, 0x0C, 0xEB, 
                                /* 0470 */    0xA5, 0xE4, 0x3D, 0x95, 0xDF, 0x1F, 0x62, 0x1C, 
                                /* 0478 */    0xF4, 0x41, 0x62, 0x07, 0xC1, 0xC3, 0x9D, 0x83, 
                                /* 0480 */    0x50, 0x71, 0xCE, 0x41, 0xE8, 0x28, 0x34, 0xB2, 
                                /* 0488 */    0x30, 0x7A, 0x7E, 0x0E, 0x42, 0x1D, 0x0A, 0xD9, 
                                /* 0490 */    0x39, 0x08, 0xCE, 0xE9, 0x00, 0x2B, 0x1F, 0xC6, 
                                /* 0498 */    0x0F, 0x2D, 0x1F, 0xB5, 0xE8, 0x61, 0xC8, 0x33, 
                                /* 04A0 */    0xC2, 0x18, 0xBD, 0x6C, 0x09, 0xDD, 0x57, 0x8D, 
                                /* 04A8 */    0xE3, 0x7B, 0x00, 0x62, 0x83, 0xE5, 0x23, 0x32, 
                                /* 04B0 */    0x84, 0xC7, 0xEE, 0xF3, 0x88, 0x8F, 0x08, 0x1E, 
                                /* 04B8 */    0x60, 0xC0, 0xFF, 0xFF, 0x11, 0x54, 0x05, 0xA1, 
                                /* 04C0 */    0xB3, 0xEC, 0xE9, 0xF8, 0xD8, 0x11, 0xE5, 0xD1, 
                                /* 04C8 */    0x00, 0xCE, 0x78, 0xF8, 0x81, 0xC6, 0x27, 0x0F, 
                                /* 04D0 */    0x70, 0xDC, 0x72, 0x60, 0x5C, 0x93, 0xC0, 0x70, 
                                /* 04D8 */    0x4C, 0x02, 0x1C, 0x84, 0x39, 0x26, 0xA1, 0xE4, 
                                /* 04E0 */    0x1F, 0x93, 0xD0, 0xD2, 0x81, 0x74, 0x84, 0xF7, 
                                /* 04E8 */    0xD9, 0x15, 0xEC, 0xC7, 0xA2, 0xE7, 0xA1, 0xE3, 
                                /* 04F0 */    0x79, 0x5B, 0x35, 0xCA, 0xA9, 0xD5, 0x76, 0x38, 
                                /* 04F8 */    0x22, 0x18, 0x2F, 0x0A, 0x91, 0x9E, 0x5D, 0x8D, 
                                /* 0500 */    0xE4, 0x03, 0x2C, 0x3B, 0x15, 0x19, 0x27, 0xCA, 
                                /* 0508 */    0x7B, 0x52, 0x54, 0x43, 0x3F, 0xCC, 0x3C, 0xEC, 
                                /* 0510 */    0x1A, 0xCA, 0x48, 0x21, 0x1F, 0x8E, 0xF0, 0x47, 
                                /* 0518 */    0x27, 0x58, 0xC3, 0x01, 0xCB, 0xFF, 0x7F, 0x38, 
                                /* 0520 */    0xE0, 0x3E, 0x1D, 0xE0, 0x86, 0xE3, 0xF3, 0x8B, 
                                /* 0528 */    0x4F, 0x5A, 0xB8, 0xA3, 0xBB, 0x0F, 0x4B, 0xEC, 
                                /* 0530 */    0x20, 0x11, 0xFE, 0xD9, 0xC0, 0x57, 0x70, 0xE3, 
                                /* 0538 */    0xBC, 0x13, 0xBC, 0x34, 0xBC, 0x65, 0xF8, 0x94, 
                                /* 0540 */    0x04, 0xF0, 0x63, 0x38, 0x5C, 0xD2, 0xB1, 0x02, 
                                /* 0548 */    0x25, 0xE2, 0x58, 0x81, 0x16, 0x00, 0x24, 0x0D, 
                                /* 0550 */    0xE7, 0x0B, 0x43, 0xA1, 0x0E, 0x31, 0x3E, 0xBA, 
                                /* 0558 */    0xF8, 0x70, 0xF6, 0x10, 0x03, 0x63, 0x64, 0x1C, 
                                /* 0560 */    0xCD, 0x23, 0xF3, 0xFF, 0x1F, 0xA5, 0xF7, 0xF1, 
                                /* 0568 */    0x0B, 0xF1, 0x05, 0xF9, 0x94, 0x61, 0x43, 0xBF, 
                                /* 0570 */    0x26, 0x70, 0x7B, 0x02, 0x14, 0x5D, 0x13, 0xA0, 
                                /* 0578 */    0x03, 0x3E, 0x39, 0x60, 0x5D, 0x9C, 0xE1, 0xD0, 
                                /* 0580 */    0x47, 0x55, 0xF0, 0x4C, 0xFC, 0x10, 0x30, 0x87, 
                                /* 0588 */    0x1F, 0x0F, 0x81, 0x1F, 0x09, 0x7C, 0x02, 0xF0, 
                                /* 0590 */    0xE1, 0x16, 0x1E, 0x38, 0xEE, 0x90, 0x0A, 0x78, 
                                /* 0598 */    0x96, 0x40, 0x4E, 0x8F, 0x0C, 0x0E, 0x7D, 0x78, 
                                /* 05A0 */    0xA0, 0x30, 0x66, 0xF1, 0x19, 0x0D, 0xEE, 0xFF, 
                                /* 05A8 */    0xFF, 0x8C, 0xC6, 0xCF, 0xED, 0xB8, 0x33, 0x8A, 
                                /* 05B0 */    0x6F, 0x5C, 0x11, 0xDE, 0x5F, 0xD8, 0x01, 0x86, 
                                /* 05B8 */    0x8D, 0xEF, 0xCD, 0xC5, 0x40, 0x4F, 0x2D, 0x31, 
                                /* 05C0 */    0x9E, 0x22, 0x7D, 0x71, 0x31, 0xC4, 0x69, 0x3D, 
                                /* 05C8 */    0x4A, 0xF2, 0x2B, 0x8C, 0xAF, 0x2E, 0x3E, 0x1A, 
                                /* 05D0 */    0x3C, 0xE9, 0xFB, 0x28, 0x69, 0xAC, 0x47, 0x49, 
                                /* 05D8 */    0x43, 0x45, 0x8B, 0xF5, 0xDA, 0x6F, 0xA0, 0x07, 
                                /* 05E0 */    0x18, 0x2E, 0xF4, 0x74, 0x41, 0x83, 0x9C, 0xB1, 
                                /* 05E8 */    0x50, 0x63, 0xF5, 0xD0, 0x7C, 0x1C, 0xF0, 0x35, 
                                /* 05F0 */    0xE0, 0x71, 0xC0, 0xF3, 0xF2, 0x65, 0x20, 0xC4, 
                                /* 05F8 */    0xCB, 0xC0, 0x23, 0xC0, 0xA9, 0xFB, 0x26, 0xF0, 
                                /* 0600 */    0xC0, 0xE2, 0x43, 0x82, 0x0F, 0x2F, 0x1E, 0xA6, 
                                /* 0608 */    0xD9, 0x7D, 0x6A, 0xE0, 0xA3, 0x33, 0x7A, 0xC4, 
                                /* 0610 */    0xE7, 0x21, 0x0F, 0x82, 0x1D, 0xF0, 0x7D, 0x5E, 
                                /* 0618 */    0xC0, 0x0E, 0xE8, 0x24, 0x9F, 0x05, 0x5E, 0xD7, 
                                /* 0620 */    0x9A, 0xBD, 0xA8, 0x91, 0x23, 0x97, 0xEF, 0x68, 
                                /* 0628 */    0x7C, 0x28, 0xCF, 0x65, 0x64, 0x50, 0xE8, 0xC3, 
                                /* 0630 */    0x85, 0x07, 0x05, 0xE7, 0xCC, 0x60, 0xE3, 0xE7, 
                                /* 0638 */    0x09, 0x41, 0x9D, 0x8C, 0x07, 0xC3, 0x46, 0x05, 
                                /* 0640 */    0xBC, 0x8E, 0x76, 0xB8, 0x73, 0x20, 0xCC, 0xDB, 
                                /* 0648 */    0x09, 0x07, 0x3B, 0x38, 0x38, 0x90, 0x8F, 0x19, 
                                /* 0650 */    0x86, 0x38, 0xB9, 0x30, 0x0F, 0x17, 0xF8, 0xFF, 
                                /* 0658 */    0xFF, 0x71, 0x10, 0x30, 0x75, 0x10, 0xF3, 0x99, 
                                /* 0660 */    0xC4, 0x10, 0x07, 0x89, 0x1F, 0x04, 0x0F, 0xB2, 
                                /* 0668 */    0x26, 0x1A, 0xF5, 0x70, 0x66, 0x18, 0x14, 0x8B, 
                                /* 0670 */    0xCF, 0x08, 0x3E, 0x16, 0xF0, 0x83, 0x8F, 0x27, 
                                /* 0678 */    0xF2, 0x60, 0xF6, 0x8C, 0xC2, 0x8F, 0x7C, 0x3E, 
                                /* 0680 */    0x18, 0xF0, 0xB3, 0x07, 0x38, 0x02, 0x9C, 0x3D, 
                                /* 0688 */    0x20, 0x5F, 0xC1, 0x5E, 0x38, 0x9E, 0x3C, 0x42, 
                                /* 0690 */    0x04, 0x79, 0xF2, 0xF0, 0x6D, 0xE3, 0xD9, 0xC3, 
                                /* 0698 */    0x70, 0x8F, 0x1D, 0x6F, 0x1F, 0x3E, 0x7B, 0x18, 
                                /* 06A0 */    0xE6, 0xD9, 0xC3, 0x68, 0x11, 0xA2, 0x3C, 0x1D, 
                                /* 06A8 */    0x3C, 0x7B, 0xB0, 0x53, 0x88, 0x11, 0x42, 0x1E, 
                                /* 06B0 */    0x6F, 0xD8, 0x97, 0x31, 0x06, 0xF2, 0xEC, 0xF1, 
                                /* 06B8 */    0x54, 0x74, 0xEE, 0xE7, 0xF3, 0x5A, 0x83, 0x27, 
                                /* 06C0 */    0x18, 0xE8, 0x00, 0x42, 0xE3, 0x0C, 0x09, 0x75, 
                                /* 06C8 */    0x04, 0xF0, 0x98, 0x7C, 0x20, 0xC3, 0x9D, 0x98, 
                                /* 06D0 */    0x3C, 0x46, 0x9F, 0x2A, 0xE0, 0xFE, 0xFF, 0x47, 
                                /* 06D8 */    0x0B, 0xE7, 0xA0, 0x10, 0xEF, 0x65, 0xE0, 0x31, 
                                /* 06E0 */    0xD9, 0x07, 0x1D, 0xF6, 0x98, 0xF2, 0xF1, 0x02, 
                                /* 06E8 */    0x7C, 0x11, 0xC6, 0x85, 0x3E, 0x4A, 0x78, 0xB0, 
                                /* 06F0 */    0xEF, 0x14, 0x1E, 0x61, 0x50, 0xDF, 0x8E, 0x5E, 
                                /* 06F8 */    0x80, 0x30, 0xE7, 0x0F, 0xE0, 0x15, 0x68, 0x44, 
                                /* 0700 */    0x68, 0x68, 0x36, 0x89, 0xE3, 0xC1, 0x8D, 0x1C, 
                                /* 0708 */    0x78, 0x9C, 0x33, 0x3C, 0x30, 0xF0, 0x1D, 0x42, 
                                /* 0710 */    0xC1, 0x31, 0x02, 0x76, 0xF0, 0xF0, 0x69, 0x83, 
                                /* 0718 */    0x5D, 0xA8, 0xD8, 0x79, 0xD6, 0xA7, 0x0A, 0x9F, 
                                /* 0720 */    0x1B, 0x7C, 0x21, 0x7B, 0xE0, 0xF2, 0x69, 0xE1, 
                                /* 0728 */    0xA9, 0x0A, 0xAC, 0xFF, 0xFF, 0x53, 0x15, 0x70, 
                                /* 0730 */    0x13, 0xF9, 0x6E, 0xF6, 0x69, 0x85, 0xCA, 0x82, 
                                /* 0738 */    0x41, 0x9D, 0x15, 0x7C, 0x28, 0xC1, 0x1F, 0x3E, 
                                /* 0740 */    0x7D, 0x28, 0x01, 0x6F, 0x58, 0x42, 0xA9, 0x38, 
                                /* 0748 */    0xAD, 0x18, 0x42, 0x56, 0x0E, 0x0B, 0xA8, 0x91, 
                                /* 0750 */    0x78, 0x5E, 0xAF, 0x08, 0xBE, 0x1B, 0xF9, 0x6A, 
                                /* 0758 */    0x60, 0xF4, 0x87, 0xC7, 0x27, 0x1F, 0x5F, 0xEF, 
                                /* 0760 */    0xD8, 0x98, 0x0E, 0xFE, 0xD9, 0x83, 0x1F, 0xE4, 
                                /* 0768 */    0x7C, 0x0C, 0xF4, 0x09, 0x01, 0xFE, 0x6D, 0xC9, 
                                /* 0770 */    0x47, 0x55, 0x5F, 0x4E, 0x4E, 0xDB, 0xA3, 0x81, 
                                /* 0778 */    0x35, 0x0C, 0x7E, 0x3B, 0x61, 0xC7, 0x7F, 0x8F, 
                                /* 0780 */    0x06, 0x58, 0xDF, 0x3B, 0xD9, 0x91, 0xCC, 0x08, 
                                /* 0788 */    0x8F, 0x0B, 0x0F, 0x06, 0x6C, 0x34, 0xF8, 0xFF, 
                                /* 0790 */    0xFF, 0x68, 0xC0, 0x7D, 0x0E, 0x80, 0x33, 0x1A, 
                                /* 0798 */    0xE0, 0x32, 0xC2, 0xA3, 0xC1, 0x9E, 0x19, 0x3C, 
                                /* 07A0 */    0x1A, 0x38, 0x3E, 0xCF, 0x0F, 0x52, 0x7D, 0xC8, 
                                /* 07A8 */    0xA6, 0x83, 0x01, 0x3E, 0xC7, 0x00, 0x38, 0x83, 
                                /* 07B0 */    0x01, 0x1E, 0x47, 0x5D, 0x9F, 0xD3, 0xC0, 0x76, 
                                /* 07B8 */    0x82, 0x60, 0x07, 0x15, 0xE0, 0xF2, 0xFF, 0x3F, 
                                /* 07C0 */    0xA8, 0x80, 0x53, 0xF4, 0x09, 0x0D, 0x74, 0x27, 
                                /* 07C8 */    0x1C, 0xF0, 0x8E, 0x84, 0x47, 0x78, 0x07, 0xF8, 
                                /* 07D0 */    0xFC, 0x42, 0x45, 0xC3, 0xA0, 0x8E, 0x30, 0xC0, 
                                /* 07D8 */    0x47, 0xCA, 0x38, 0xF4, 0xB3, 0xF1, 0x39, 0x00, 
                                /* 07E0 */    0x77, 0x2C, 0x00, 0xD7, 0x70, 0x0F, 0xE2, 0x1D, 
                                /* 07E8 */    0xF8, 0x4D, 0xEB, 0x0C, 0x0D, 0xF1, 0x64, 0x00, 
                                /* 07F0 */    0xEC, 0xC7, 0x83, 0x3B, 0x19, 0xC0, 0xFD, 0xFF, 
                                /* 07F8 */    0x9F, 0x0C, 0xF8, 0x51, 0x02, 0xDE, 0x39, 0x10, 
                                /* 0800 */    0x71, 0x1C, 0x40, 0x49, 0x3F, 0x11, 0x00, 0x35, 
                                /* 0808 */    0x41, 0x27, 0x02, 0x7A, 0xDC, 0x04, 0xE3, 0xE8, 
                                /* 0810 */    0xD8, 0x94, 0x5F, 0x21, 0x30, 0xA7, 0x47, 0x5F, 
                                /* 0818 */    0xD0, 0x1E, 0x0A, 0x00, 0xAB, 0x91, 0x17, 0x44, 
                                /* 0820 */    0x81, 0x1C, 0x12, 0x46, 0xA7, 0x76, 0x5C, 0x40, 
                                /* 0828 */    0x20, 0x9D, 0xF0, 0x3C, 0x34, 0x8B, 0x58, 0x8F, 
                                /* 0830 */    0x8F, 0x05, 0x74, 0xB4, 0x3E, 0x66, 0xE3, 0xFF, 
                                /* 0838 */    0xFF, 0x87, 0x62, 0x02, 0x8F, 0xE2, 0xF5, 0x38, 
                                /* 0840 */    0xF9, 0xA9, 0xCF, 0xA7, 0x03, 0x5F, 0x4C, 0x7C, 
                                /* 0848 */    0x06, 0xF0, 0x21, 0x81, 0x5F, 0x4C, 0xD8, 0xC5, 
                                /* 0850 */    0xE0, 0x79, 0xE8, 0x9D, 0xE7, 0xF5, 0xC0, 0xE3, 
                                /* 0858 */    0xC1, 0x1D, 0x17, 0xC9, 0x09, 0x98, 0xC2, 0xFB, 
                                /* 0860 */    0xEC, 0xE2, 0xC3, 0xAF, 0x0F, 0x0D, 0xEF, 0x3B, 
                                /* 0868 */    0x8F, 0x0A, 0xE1, 0xCF, 0xF3, 0xC9, 0xDC, 0x46, 
                                /* 0870 */    0x0F, 0x48, 0xE4, 0xCC, 0x67, 0x34, 0x13, 0xF8, 
                                /* 0878 */    0xFE, 0xE9, 0x21, 0x18, 0xC2, 0x87, 0x20, 0x63, 
                                /* 0880 */    0xBD, 0x2B, 0xFB, 0x24, 0xC4, 0xF6, 0x50, 0x15, 
                                /* 0888 */    0x84, 0x06, 0x7C, 0x7A, 0xBE, 0x26, 0x44, 0x79, 
                                /* 0890 */    0x28, 0xF2, 0x25, 0xC1, 0xD3, 0x8E, 0x17, 0x32, 
                                /* 0898 */    0x48, 0xD8, 0x47, 0x56, 0x6C, 0x8C, 0x11, 0xA1, 
                                /* 08A0 */    0x0E, 0xF3, 0x3E, 0x26, 0x79, 0x44, 0x9E, 0xC0, 
                                /* 08A8 */    0xD1, 0xF8, 0xF8, 0xC4, 0x8E, 0xB0, 0x6C, 0x4C, 
                                /* 08B0 */    0xC0, 0x70, 0x0C, 0x3E, 0x51, 0xE2, 0xCE, 0x1E, 
                                /* 08B8 */    0xBE, 0x2C, 0xBC, 0xA4, 0xFA, 0x7C, 0x8F, 0x9B, 
                                /* 08C0 */    0x93, 0x87, 0x04, 0xE3, 0x54, 0x80, 0x3B, 0x5E, 
                                /* 08C8 */    0xE0, 0x8E, 0x01, 0x3E, 0xEF, 0xC3, 0xBB, 0x15, 
                                /* 08D0 */    0x9C, 0xEA, 0x81, 0xBC, 0x60, 0x78, 0x00, 0x60, 
                                /* 08D8 */    0xF9, 0xFF, 0x0F, 0x80, 0x9F, 0x18, 0x02, 0x1D, 
                                /* 08E0 */    0x80, 0xAF, 0x17, 0x4F, 0x14, 0x8F, 0x14, 0xF1, 
                                /* 08E8 */    0x4E, 0xC0, 0xD0, 0xFC, 0xE0, 0x80, 0x1B, 0xA0, 
                                /* 08F0 */    0x8F, 0x11, 0x1E, 0x00, 0x1E, 0xF8, 0x28, 0x23, 
                                /* 08F8 */    0x9D, 0xB3, 0xEF, 0xFD, 0xD8, 0x41, 0xC1, 0x39, 
                                /* 0900 */    0x73, 0xE0, 0x7E, 0x06, 0x3E, 0x19, 0x78, 0x10, 
                                /* 0908 */    0xF8, 0xB3, 0xAB, 0x4F, 0x03, 0x1E, 0xB7, 0x09, 
                                /* 0910 */    0x3C, 0x2C, 0x38, 0x07, 0x50, 0x70, 0x00, 0xB1, 
                                /* 0918 */    0x6B, 0x01, 0xBF, 0x6F, 0xE0, 0x6F, 0x0D, 0x3E, 
                                /* 0920 */    0x93, 0x3E, 0x54, 0xB1, 0xE1, 0x61, 0x0F, 0xA0, 
                                /* 0928 */    0x80, 0x03, 0x39, 0x47, 0x21, 0x0A, 0x44, 0x60, 
                                /* 0930 */    0x74, 0x14, 0xC1, 0x85, 0x87, 0xD0, 0xD1, 0xC7, 
                                /* 0938 */    0x07, 0x0B, 0x9F, 0xA9, 0x71, 0x23, 0xF1, 0x00, 
                                /* 0940 */    0x9F, 0x98, 0x31, 0x20, 0xC7, 0x79, 0x2E, 0x67, 
                                /* 0948 */    0xF4, 0x5C, 0xF7, 0x50, 0xFD, 0x44, 0x80, 0x3B, 
                                /* 0950 */    0xCF, 0xF1, 0xFF, 0xFF, 0xF8, 0xE1, 0x8F, 0x81, 
                                /* 0958 */    0xCF, 0xE0, 0xB9, 0xE0, 0x7D, 0xC5, 0xB3, 0xF0, 
                                /* 0960 */    0xB8, 0x01, 0x07, 0xD1, 0xC6, 0x4D, 0xC3, 0x41, 
                                /* 0968 */    0x28, 0x0C, 0x0C, 0x6A, 0x10, 0xBE, 0x1D, 0x7B, 
                                /* 0970 */    0x60, 0xB8, 0xE3, 0x34, 0xBC, 0x29, 0x45, 0x3B, 
                                /* 0978 */    0xA6, 0x17, 0x8A, 0xB7, 0x06, 0x3C, 0xD2, 0xCB, 
                                /* 0980 */    0x0E, 0x66, 0xC0, 0xBE, 0x3F, 0x44, 0x7A, 0x4F, 
                                /* 0988 */    0xC1, 0xCC, 0xF1, 0x91, 0x83, 0x1F, 0xE2, 0xB1, 
                                /* 0990 */    0xD3, 0xF5, 0x84, 0x4F, 0xC2, 0x20, 0x3E, 0x60, 
                                /* 0998 */    0xF9, 0xB4, 0x05, 0xEB, 0xFE, 0x78, 0xA0, 0xCF, 
                                /* 09A0 */    0x18, 0x3E, 0x75, 0xB0, 0xD3, 0x96, 0x03, 0x43, 
                                /* 09A8 */    0xD2, 0xA3, 0x08, 0xEE, 0xB4, 0x05, 0x73, 0xFE, 
                                /* 09B0 */    0xBE, 0xB8, 0xBF, 0x37, 0x79, 0x50, 0x07, 0xF6, 
                                /* 09B8 */    0x44, 0x14, 0xE8, 0xF8, 0x9E, 0xE7, 0x3C, 0x52, 
                                /* 09C0 */    0xA3, 0xBC, 0x81, 0x84, 0x7A, 0x33, 0x60, 0x27, 
                                /* 09C8 */    0x30, 0xEC, 0xD1, 0x00, 0xDE, 0xFF, 0xFF, 0x68, 
                                /* 09D0 */    0x00, 0x1F, 0xE4, 0x05, 0x02, 0x7B, 0x3A, 0x00, 
                                /* 09D8 */    0x77, 0xB0, 0xA3, 0x01, 0x2A, 0xCA, 0xE9, 0x00, 
                                /* 09E0 */    0xD0, 0x17, 0x17, 0x92, 0x42, 0x3D, 0x1D, 0x80, 
                                /* 09E8 */    0x63, 0x22, 0xBE, 0xD1, 0x60, 0xA6, 0xE9, 0x49, 
                                /* 09F0 */    0x3C, 0x1D, 0xC4, 0x3A, 0x4F, 0x8F, 0xF0, 0x91, 
                                /* 09F8 */    0x8C, 0x1F, 0x0E, 0x80, 0xF3, 0xFF, 0xFF, 0x40, 
                                /* 0A00 */    0x03, 0xF9, 0x9D, 0xE8, 0xB3, 0x9C, 0x29, 0x0C, 
                                /* 0A08 */    0x83, 0x1A, 0x84, 0x83, 0x1C, 0x0E, 0x40, 0x33, 
                                /* 0A10 */    0xCA, 0x17, 0xB6, 0x07, 0x21, 0xDF, 0x09, 0x02, 
                                /* 0A18 */    0x9E, 0xAA, 0x4F, 0x06, 0xBE, 0x16, 0xE0, 0x60, 
                                /* 0A20 */    0x5E, 0xCA, 0x8C, 0x1C, 0xC3, 0xD3, 0x36, 0xA0, 
                                /* 0A28 */    0x71, 0xB1, 0x38, 0x3E, 0xB8, 0x32, 0x90, 0x38, 
                                /* 0A30 */    0xE7, 0x10, 0x2B, 0x48, 0x60, 0xDF, 0xF0, 0xB0, 
                                /* 0A38 */    0xE7, 0x04, 0xE0, 0x72, 0x1C, 0xF2, 0x39, 0x08, 
                                /* 0A40 */    0x7F, 0x28, 0x81, 0x0D, 0x7F, 0x6E, 0xFC, 0x88, 
                                /* 0A48 */    0x00, 0xB8, 0x18, 0x12, 0xEE, 0x34, 0x09, 0xEF, 
                                /* 0A50 */    0xFF, 0x7F, 0x9A, 0xC4, 0xC1, 0x19, 0xAB, 0xF8, 
                                /* 0A58 */    0x33, 0x17, 0x39, 0xC8, 0x78, 0x40, 0x4F, 0xC6, 
                                /* 0A60 */    0x1E, 0x27, 0x76, 0x10, 0x5C, 0xBA, 0x87, 0xB3, 
                                /* 0A68 */    0x00, 0x3D, 0x36, 0x48, 0x2C, 0x0C, 0x6A, 0x64, 
                                /* 0A70 */    0x0E, 0x78, 0x00, 0xD0, 0xB9, 0x01, 0x3C, 0x77, 
                                /* 0A78 */    0x04, 0x9F, 0x51, 0x7C, 0xE4, 0x30, 0xC4, 0xCB, 
                                /* 0A80 */    0x9A, 0x0F, 0x65, 0x71, 0x7D, 0x76, 0xE6, 0x87, 
                                /* 0A88 */    0x9C, 0x07, 0x06, 0x1F, 0x1E, 0x60, 0x1C, 0xDD, 
                                /* 0A90 */    0x38, 0xD0, 0xA9, 0xF9, 0x00, 0x0D, 0x03, 0xEC, 
                                /* 0A98 */    0x8D, 0xD6, 0x87, 0x1E, 0x1F, 0x26, 0x7C, 0x78, 
                                /* 0AA0 */    0xF0, 0x44, 0xF0, 0x53, 0x60, 0x57, 0x78, 0x63, 
                                /* 0AA8 */    0x45, 0xF1, 0x15, 0xE2, 0x41, 0xC2, 0xC8, 0xE7, 
                                /* 0AB0 */    0xE2, 0x73, 0xA2, 0xA1, 0x1F, 0xE8, 0xF8, 0x18, 
                                /* 0AB8 */    0x3C, 0x09, 0x63, 0x3D, 0x6C, 0xFA, 0xE8, 0x86, 
                                /* 0AC0 */    0xBB, 0x1E, 0xC4, 0x7A, 0x9D, 0xF1, 0x48, 0x3C, 
                                /* 0AC8 */    0x1F, 0xDF, 0x89, 0x82, 0x9C, 0x4D, 0x64, 0x4F, 
                                /* 0AD0 */    0xC2, 0xF3, 0xF3, 0x9D, 0xC6, 0xE3, 0x60, 0xD7, 
                                /* 0AD8 */    0xE6, 0x73, 0xF5, 0xB4, 0xD8, 0x1C, 0x60, 0x1D, 
                                /* 0AE0 */    0x35, 0x8C, 0x73, 0x64, 0x0C, 0xF9, 0xAD, 0x2F, 
                                /* 0AE8 */    0xA4, 0x6F, 0x1B, 0x46, 0xC7, 0x8D, 0xD1, 0xC7, 
                                /* 0AF0 */    0x25, 0x43, 0xFB, 0xA6, 0x63, 0x84, 0xA3, 0xF1, 
                                /* 0AF8 */    0xA0, 0x0D, 0xF1, 0x22, 0xEA, 0x39, 0x78, 0x30, 
                                /* 0B00 */    0xEC, 0x82, 0xC0, 0x6E, 0x00, 0x3E, 0x6C, 0x32, 
                                /* 0B08 */    0xA4, 0x33, 0x78, 0x02, 0xF0, 0xC4, 0xD8, 0x20, 
                                /* 0B10 */    0xD8, 0x10, 0xFE, 0xFF, 0x67, 0x86, 0x3D, 0xFA, 
                                /* 0B18 */    0x00, 0x23, 0x89, 0x16, 0x20, 0x6A, 0x38, 0x99, 
                                /* 0B20 */    0xD1, 0x53, 0x29, 0x3F, 0x52, 0x18, 0xDE, 0xC7, 
                                /* 0B28 */    0x05, 0x38, 0xF3, 0x78, 0xE3, 0xF0, 0x45, 0xEE, 
                                /* 0B30 */    0x7D, 0xD1, 0xA7, 0x26, 0x0B, 0x06, 0xD7, 0x49, 
                                /* 0B38 */    0x9A, 0x9C, 0x22, 0x40, 0x33, 0x0A, 0x18, 0x73, 
                                /* 0B40 */    0x0C, 0xDA, 0xD4, 0xF9, 0x85, 0xCE, 0xDB, 0x37, 
                                /* 0B48 */    0x00, 0x0F, 0xD7, 0x47, 0x05, 0x4F, 0xD7, 0x97, 
                                /* 0B50 */    0x56, 0x06, 0xF6, 0x0A, 0xC0, 0x5C, 0xC3, 0x68, 
                                /* 0B58 */    0x0A, 0x2F, 0x03, 0xE7, 0xED, 0x3B, 0x03, 0x3B, 
                                /* 0B60 */    0x24, 0x60, 0xCE, 0x0E, 0xD8, 0x63, 0x80, 0x41, 
                                /* 0B68 */    0xD8, 0x1C, 0x18, 0xB8, 0xE7, 0xE1, 0xB3, 0x81, 
                                /* 0B70 */    0xC7, 0xE7, 0x81, 0x18, 0xEE, 0x01, 0xC3, 0x57, 
                                /* 0B78 */    0x02, 0x4F, 0xE9, 0xFD, 0x06, 0x73, 0x5D, 0x80, 
                                /* 0B80 */    0x33, 0x16, 0x76, 0x60, 0xE0, 0xC7, 0x08, 0x5F, 
                                /* 0B88 */    0x49, 0x7C, 0x1E, 0xF4, 0x91, 0x82, 0xA9, 0x43, 
                                /* 0B90 */    0xD2, 0x7D, 0xD3, 0xF7, 0x13, 0xCF, 0xFB, 0x01, 
                                /* 0B98 */    0xE5, 0x89, 0xE0, 0x84, 0xDF, 0x05, 0x9E, 0x5D, 
                                /* 0BA0 */    0x0E, 0xFE, 0x31, 0x06, 0x43, 0xE0, 0xBB, 0xCB, 
                                /* 0BA8 */    0xD3, 0x0D, 0xF6, 0x50, 0xF0, 0x5E, 0x11, 0x2E, 
                                /* 0BB0 */    0x6E, 0xB3, 0x97, 0x15, 0x72, 0xC6, 0xF5, 0x3D, 
                                /* 0BB8 */    0x85, 0x4F, 0x2A, 0x81, 0xFF, 0xFF, 0xD2, 0xDF, 
                                /* 0BC0 */    0x01, 0x3A, 0x16, 0xE0, 0xCE, 0x0B, 0x3E, 0x16, 
                                /* 0BC8 */    0xC0, 0x39, 0xC8, 0x79, 0xC0, 0x38, 0x02, 0x8B, 
                                /* 0BD0 */    0x83, 0xD7, 0xAF, 0x89, 0x8C, 0xC0, 0xE7, 0x02, 
                                /* 0BD8 */    0x50, 0xCC, 0xEC, 0xE1, 0xC2, 0x77, 0x12, 0x78, 
                                /* 0BE0 */    0x07, 0x03, 0xCC, 0x15, 0x04, 0xC6, 0xCD, 0x04, 
                                /* 0BE8 */    0xCE, 0x09, 0x80, 0x5D, 0x57, 0xF8, 0x3D, 0x00, 
                                /* 0BF0 */    0xF6, 0x05, 0x84, 0x21, 0xB2, 0x4B, 0x88, 0xAF, 
                                /* 0BF8 */    0x0B, 0x70, 0x8E, 0x07, 0x98, 0xDB, 0x08, 0x3B, 
                                /* 0C00 */    0x24, 0xB0, 0x2B, 0x81, 0x4F, 0x58, 0x98, 0x69, 
                                /* 0C08 */    0x61, 0xEF, 0x24, 0x3E, 0x22, 0xFB, 0xAE, 0xEF, 
                                /* 0C10 */    0x79, 0x18, 0x9D, 0x1F, 0x4B, 0x18, 0x8E, 0xE7, 
                                /* 0C18 */    0xF5, 0x74, 0x85, 0x9D, 0x2D, 0x87, 0x38, 0x5B, 
                                /* 0C20 */    0x7E, 0x10, 0xE5, 0x97, 0x13, 0x0E, 0x8C, 0xB9, 
                                /* 0C28 */    0x00, 0x18, 0xC5, 0xA3, 0xF1, 0xE8, 0xE1, 0x40, 
                                /* 0C30 */    0x9D, 0xB5, 0xC7, 0x62, 0xA8, 0x43, 0x79, 0x7B, 
                                /* 0C38 */    0x36, 0xE2, 0x49, 0xF8, 0x58, 0x81, 0x99, 0x17, 
                                /* 0C40 */    0x9B, 0x33, 0x9B, 0x18, 0x66, 0x54, 0xB8, 0xAB, 
                                /* 0C48 */    0xC2, 0xFF, 0xFF, 0x85, 0x04, 0xFE, 0x41, 0x83, 
                                /* 0C50 */    0xDD, 0x01, 0x7C, 0x94, 0x61, 0xC7, 0x31, 0x4F, 
                                /* 0C58 */    0x82, 0x41, 0x46, 0x7A, 0x78, 0x61, 0xA7, 0x09, 
                                /* 0C60 */    0xF0, 0x1D, 0xAB, 0x70, 0xC7, 0x30, 0x98, 0x07, 
                                /* 0C68 */    0x7E, 0xDC, 0xC1, 0x09, 0xF6, 0x69, 0x0C, 0xB0, 
                                /* 0C70 */    0x78, 0xA6, 0xF0, 0x1D, 0xCF, 0xC7, 0x7A, 0x8F, 
                                /* 0C78 */    0x13, 0x3B, 0x08, 0x1E, 0xFB, 0xF4, 0x49, 0x4F, 
                                /* 0C80 */    0x84, 0x0E, 0x0A, 0x83, 0x3A, 0x14, 0x82, 0x15, 
                                /* 0C88 */    0x83, 0xFD, 0xFF, 0xCF, 0x54, 0xEC, 0xEC, 0xE5, 
                                /* 0C90 */    0x13, 0x37, 0xBF, 0xE9, 0x33, 0xA0, 0x67, 0x27, 
                                /* 0C98 */    0xDF, 0x7C, 0xD8, 0x79, 0x0C, 0x73, 0x24, 0xE4, 
                                /* 0CA0 */    0xF7, 0x86, 0xB3, 0xF0, 0x81, 0x84, 0xDD, 0x09, 
                                /* 0CA8 */    0xE1, 0x9C, 0xA0, 0x80, 0x4D, 0x6C, 0x48, 0x7A, 
                                /* 0CB0 */    0x58, 0x07, 0xC7, 0x79, 0x82, 0x1D, 0x06, 0x7C, 
                                /* 0CB8 */    0x02, 0x60, 0xE7, 0x74, 0x76, 0xC4, 0xF3, 0xD5, 
                                /* 0CC0 */    0xC3, 0x27, 0x57, 0x9F, 0xDD, 0x60, 0x9C, 0x47, 
                                /* 0CC8 */    0x01, 0x27, 0xD2, 0x0E, 0xA3, 0x28, 0x31, 0xE7, 
                                /* 0CD0 */    0x51, 0x20, 0x70, 0x56, 0x80, 0xF9, 0xFF, 0x3F, 
                                /* 0CD8 */    0x2B, 0x00, 0x3E, 0xA4, 0x9D, 0x47, 0xE9, 0xC1, 
                                /* 0CE0 */    0x1E, 0x1C, 0x27, 0x17, 0xEC, 0xC4, 0xD8, 0x19, 
                                /* 0CE8 */    0x01, 0x70, 0x71, 0x1F, 0x78, 0x66, 0x01, 0xDB, 
                                /* 0CF0 */    0xF9, 0x02, 0xBC, 0x23, 0xE1, 0x82, 0x8E, 0x0E, 
                                /* 0CF8 */    0x28, 0x09, 0xA7, 0x07, 0xD0, 0xFC, 0xFF, 0x4F, 
                                /* 0D00 */    0x0F, 0x80, 0x43, 0x41, 0xA7, 0x07, 0x3A, 0x9B, 
                                /* 0D08 */    0xA7, 0x07, 0xB0, 0x1E, 0x09, 0x0E, 0xF0, 0xC5, 
                                /* 0D10 */    0xED, 0x74, 0xDE, 0x02, 0x0C, 0xF1, 0x00, 0x01, 
                                /* 0D18 */    0x98, 0x18, 0x24, 0xEE, 0x00, 0x01, 0x8E, 0x43, 
                                /* 0D20 */    0x07, 0xBC, 0x11, 0x70, 0xC1, 0xA7, 0x06, 0x2A, 
                                /* 0D28 */    0x66, 0xF0, 0x92, 0x08, 0x43, 0xFF, 0xFF, 0x30, 
                                /* 0D30 */    0x1E, 0x96, 0x23, 0x1E, 0x1C, 0x00, 0x15, 0x48, 
                                /* 0D38 */    0x7D, 0xDD, 0x88, 0x29, 0xC2, 0x43, 0xE9, 0x73, 
                                /* 0D40 */    0x1F, 0xC3, 0xF1, 0xA1, 0xEB, 0xDD, 0xD0, 0x88, 
                                /* 0D48 */    0xEC, 0x14, 0x01, 0xFC, 0x64, 0x9D, 0x22, 0xE8, 
                                /* 0D50 */    0xD9, 0x0E, 0x8C, 0xB3, 0x64, 0x77, 0x84, 0x57, 
                                /* 0D58 */    0x13, 0xCC, 0xA5, 0x98, 0x1D, 0x24, 0x00, 0x2B, 
                                /* 0D60 */    0xFF, 0xFF, 0x83, 0x04, 0x70, 0x39, 0x92, 0xF8, 
                                /* 0D68 */    0xD0, 0xC8, 0x25, 0xC0, 0xA0, 0x58, 0x7C, 0x2E, 
                                /* 0D70 */    0xC0, 0x5F, 0x1E, 0xF0, 0x07, 0x5A, 0x06, 0x31, 
                                /* 0D78 */    0xEA, 0x10, 0xE9, 0xDC, 0x1F, 0x07, 0xC0, 0x00, 
                                /* 0D80 */    0x12, 0xFD, 0x91, 0xE1, 0xA8, 0xC2, 0x3C, 0xFA, 
                                /* 0D88 */    0x62, 0x14, 0x1E, 0x27, 0xE8, 0x29, 0x0D, 0x70, 
                                /* 0D90 */    0x22, 0x6F, 0xD4, 0x14, 0xC8, 0x63, 0xE7, 0x03, 
                                /* 0D98 */    0x43, 0x1C, 0x26, 0xE8, 0x70, 0xC1, 0x3B, 0xC2, 
                                /* 0DA0 */    0x67, 0x8E, 0x77, 0x5C, 0x36, 0x5C, 0xB0, 0xFD, 
                                /* 0DA8 */    0xFF, 0x87, 0x0B, 0xDC, 0xC6, 0x88, 0x3B, 0x48, 
                                /* 0DB0 */    0x80, 0x65, 0x3A, 0x9E, 0x22, 0x6E, 0x00, 0x98, 
                                /* 0DB8 */    0xF8, 0xEB, 0xF6, 0x10, 0x3C, 0x74, 0x89, 0x5E, 
                                /* 0DC0 */    0x12, 0x85, 0xF1, 0x3F, 0x5E, 0xE3, 0x20, 0xE7, 
                                /* 0DC8 */    0x08, 0x0E, 0xEC, 0x21, 0xB0, 0xB3, 0x0A, 0x06, 
                                /* 0DD0 */    0x8E, 0x1F, 0x02, 0x3C, 0xAA, 0xB7, 0xDB, 0xA7, 
                                /* 0DD8 */    0x61, 0x76, 0x0C, 0x33, 0x24, 0x1B, 0xA7, 0x87, 
                                /* 0DE0 */    0xC2, 0xCF, 0x15, 0x3E, 0xCC, 0xFA, 0x1C, 0x83, 
                                /* 0DE8 */    0x1F, 0x05, 0x43, 0xE3, 0xD0, 0xD8, 0x13, 0x0C, 
                                /* 0DF0 */    0x03, 0x7B, 0x34, 0x63, 0xE7, 0x09, 0x86, 0x7B, 
                                /* 0DF8 */    0x94, 0x4F, 0x00, 0xC7, 0xFF, 0x9A, 0xFA, 0x02, 
                                /* 0E00 */    0xC0, 0x09, 0xC2, 0x85, 0xC6, 0xC8, 0x80, 0xD0, 
                                /* 0E08 */    0xD8, 0x0F, 0xF9, 0x28, 0xCE, 0xDC, 0x04, 0xDD, 
                                /* 0E10 */    0x0F, 0x59, 0xC6, 0x04, 0x78, 0x43, 0x15, 0x42, 
                                /* 0E18 */    0x94, 0x67, 0x80, 0x27, 0x91, 0xB6, 0x50, 0x04, 
                                /* 0E20 */    0x1F, 0x24, 0x46, 0x94, 0x20, 0xAD, 0xA1, 0x50, 
                                /* 0E28 */    0x88, 0x20, 0x31, 0x8F, 0x3C, 0x4A, 0xF0, 0x98, 
                                /* 0E30 */    0x41, 0x42, 0x3F, 0x94, 0x04, 0x0A, 0x51, 0x1B, 
                                /* 0E38 */    0x8C, 0x10, 0xDE, 0x37, 0xC2, 0xB7, 0x3F, 0x08, 
                                /* 0E40 */    0x22, 0xF3, 0xA0, 0x24, 0x0D, 0x20, 0x8A, 0x34, 
                                /* 0E48 */    0x1A, 0xD4, 0x81, 0xC0, 0x63, 0xF7, 0x15, 0xCE, 
                                /* 0E50 */    0xE7, 0x11, 0x9F, 0x8F, 0xFC, 0xFF, 0x1F, 0xDD, 
                                /* 0E58 */    0xC1, 0x3D, 0x36, 0x3C, 0x51, 0xB3, 0x43, 0x3B, 
                                /* 0E60 */    0x39, 0x2A, 0xD0, 0x53, 0x00, 0xFE, 0x48, 0xE4, 
                                /* 0E68 */    0xE9, 0x1F, 0x3C, 0xFB, 0xBB, 0x1B, 0x8E, 0x0F, 
                                /* 0E70 */    0xD1, 0x47, 0x70, 0x4F, 0xE0, 0xA9, 0x9D, 0x01, 
                                /* 0E78 */    0xFA, 0xD0, 0x0C, 0xFF, 0xA0, 0xE7, 0x43, 0x33, 
                                /* 0E80 */    0x4E, 0xFE, 0x20, 0x50, 0x23, 0x33, 0xB4, 0x4F, 
                                /* 0E88 */    0x1A, 0xBE, 0x4D, 0xF9, 0xCC, 0x60, 0x02, 0x8B, 
                                /* 0E90 */    0xFD, 0xC9, 0xB3, 0xF1, 0x00, 0x81, 0x89, 0x3F, 
                                /* 0E98 */    0x6A, 0xF8, 0x66, 0xE0, 0xF9, 0xFA, 0x78, 0xE0, 
                                /* 0EA0 */    0x83, 0x12, 0x38, 0xCE, 0x0B, 0xBE, 0x7C, 0x78, 
                                /* 0EA8 */    0x04, 0x41, 0x1E, 0x41, 0xAC, 0x15, 0x44, 0xF7, 
                                /* 0EB0 */    0x81, 0x58, 0x4F, 0xF1, 0x6C, 0x10, 0x07, 0xC4, 
                                /* 0EB8 */    0x8E, 0x23, 0x80, 0x87, 0x99, 0x3C, 0x8E, 0x80, 
                                /* 0EC0 */    0xE9, 0xFF, 0x4F, 0xE0, 0x23, 0x10, 0xFC, 0x00, 
                                /* 0EC8 */    0x47, 0x11, 0xFD, 0x6D, 0x2C, 0x9E, 0x42, 0x36, 
                                /* 0ED0 */    0x1E, 0x04, 0x1E, 0x28, 0x0D, 0x0E, 0xA1, 0x31, 
                                /* 0ED8 */    0xC3, 0x0B, 0x7B, 0x5C, 0xA2, 0x10, 0x8E, 0x09, 
                                /* 0EE0 */    0xA1, 0x90, 0x43, 0xA2, 0x70, 0x8E, 0x05, 0x46, 
                                /* 0EE8 */    0x41, 0x7C, 0x4A, 0x30, 0xB2, 0x9D, 0x1C, 0x18, 
                                /* 0EF0 */    0x50, 0xE3, 0xF0, 0xC8, 0x0E, 0xC2, 0x97, 0xB5, 
                                /* 0EF8 */    0x07, 0x85, 0x37, 0x83, 0x13, 0x79, 0x0C, 0x31, 
                                /* 0F00 */    0xCC, 0x39, 0x59, 0x1C, 0x3C, 0x3D, 0x2A, 0xC0, 
                                /* 0F08 */    0xC7, 0x7D, 0x90, 0xF0, 0x04, 0xDE, 0xAD, 0x7C, 
                                /* 0F10 */    0x24, 0xC2, 0x1F, 0x15, 0xE0, 0x01, 0xF9, 0x62, 
                                /* 0F18 */    0xE0, 0xF1, 0x3C, 0x1C, 0xB0, 0x39, 0x1C, 0xBB, 
                                /* 0F20 */    0x47, 0xCE, 0xE0, 0xF9, 0xC1, 0xC3, 0xA3, 0xB3, 
                                /* 0F28 */    0xAC, 0x63, 0x01, 0x6A, 0x70, 0xBE, 0x1F, 0xBC, 
                                /* 0F30 */    0xC4, 0x78, 0xC6, 0xB8, 0x41, 0x1D, 0xA6, 0xC7, 
                                /* 0F38 */    0xE6, 0xF1, 0xE0, 0xCE, 0x81, 0x70, 0xCF, 0x00, 
                                /* 0F40 */    0xF0, 0x44, 0x9F, 0x77, 0x50, 0x32, 0x61, 0x50, 
                                /* 0F48 */    0xE7, 0x1D, 0xE0, 0xF0, 0xFF, 0x3F, 0xEF, 0x00, 
                                /* 0F50 */    0x4E, 0x4E, 0x07, 0xCF, 0x3B, 0x60, 0x17, 0xF6, 
                                /* 0F58 */    0x2C, 0x90, 0x87, 0xF3, 0x0E, 0x40, 0x91, 0xB8, 
                                /* 0F60 */    0x10, 0xFA, 0xFF, 0x1F, 0x47, 0x70, 0x03, 0xF1, 
                                /* 0F68 */    0x89, 0x82, 0x83, 0xBC, 0xD5, 0x78, 0x44, 0x2F, 
                                /* 0F70 */    0x8A, 0xA7, 0xFB, 0x52, 0x86, 0x0B, 0x35, 0x72, 
                                /* 0F78 */    0x7A, 0x48, 0xF4, 0x81, 0x83, 0x1F, 0x1F, 0x7C, 
                                /* 0F80 */    0xE0, 0x60, 0x27, 0x4D, 0x7E, 0xDE, 0xC0, 0x9C, 
                                /* 0F88 */    0x24, 0x71, 0xE7, 0x0D, 0x70, 0x0C, 0x07, 0xDE, 
                                /* 0F90 */    0x61, 0x05, 0x7C, 0xC7, 0x53, 0xB0, 0x1C, 0x93, 
                                /* 0F98 */    0x60, 0x8D, 0x08, 0xDE, 0x41, 0x09, 0x70, 0x39, 
                                /* 0FA0 */    0x4C, 0xFE, 0xFF, 0x1F, 0xA6, 0xC7, 0xC0, 0x15, 
                                /* 0FA8 */    0xDA, 0xF4, 0xA9, 0xD1, 0xA8, 0x55, 0x83, 0x32, 
                                /* 0FB0 */    0x35, 0xCA, 0x34, 0xA8, 0xD5, 0xA7, 0x52, 0x63, 
                                /* 0FB8 */    0xC6, 0x5C, 0x9D, 0x94, 0x7C, 0x70, 0xA6, 0x41, 
                                /* 0FC0 */    0x1E, 0x14, 0x02, 0xB1, 0x34, 0x0A, 0x81, 0x38, 
                                /* 0FC8 */    0x0E, 0x08, 0x15, 0xFA, 0xA2, 0x11, 0x88, 0x83, 
                                /* 0FD0 */    0x83, 0xD0, 0x28, 0xAF, 0x39, 0x81, 0x58, 0xD8, 
                                /* 0FD8 */    0x83, 0x44, 0x20, 0x8E, 0xAB, 0x06, 0x84, 0x09, 
                                /* 0FE0 */    0x77, 0x03, 0xC2, 0x84, 0xD8, 0x39, 0x36, 0xB0, 
                                /* 0FE8 */    0xC8, 0x20, 0x3A, 0x65, 0x58, 0x82, 0x1E, 0x10, 
                                /* 0FF0 */    0x26, 0x0A, 0x44, 0x80, 0x8E, 0x01, 0x44, 0x63, 
                                /* 0FF8 */    0x01, 0x51, 0x11, 0x7E, 0x00, 0x29, 0x08, 0x95, 
                                /* 1000 */    0x09, 0xA2, 0x21, 0x10, 0x43, 0x20, 0x2C, 0x02, 
                                /* 1008 */    0x08, 0x0D, 0x0F, 0x42, 0x65, 0x2B, 0x1A, 0x0E, 
                                /* 1010 */    0x05, 0xA1, 0x32, 0x1D, 0x81, 0xB0, 0xA8, 0x8F, 
                                /* 1018 */    0x23, 0x25, 0x00, 0x51, 0x88, 0x57, 0x41, 0x10, 
                                /* 1020 */    0x22, 0xEE, 0x11, 0x21, 0x10, 0x4B, 0xFD, 0x3B, 
                                /* 1028 */    0x08, 0xC4, 0xA1, 0x9E, 0x04, 0x02, 0x71, 0xD0, 
                                /* 1030 */    0xB7, 0xCC, 0x03, 0x2D, 0x7B, 0xC5, 0x04, 0x22, 
                                /* 1038 */    0x12, 0x1F, 0x53, 0x02, 0x72, 0xC8, 0xB7, 0x81, 
                                /* 1040 */    0x80, 0x1C, 0xCD, 0x1D, 0x08, 0x0B, 0x6D, 0x0F, 
                                /* 1048 */    0x84, 0x89, 0x78, 0x14, 0x68, 0x08, 0xE4, 0x67, 
                                /* 1050 */    0x10, 0x94, 0x04, 0x05, 0xA1, 0xE1, 0x9E, 0x1B, 
                                /* 1058 */    0x1A, 0x38, 0x71, 0x09, 0xC2, 0x62, 0x82, 0xD0, 
                                /* 1060 */    0x50, 0x8F, 0x39, 0x81, 0xF8, 0xFF, 0x0F
                            })
                            Method (WMAB, 3, NotSerialized)
                            {
                                If (LGreaterEqual (SizeOf (Arg2), 0x04))
                                {
                                    CreateDWordField (Arg2, 0x00, FUNC)
                                    Store (Zero, Local2)
                                    If (LGreaterEqual (SizeOf (Arg2), 0x08))
                                    {
                                        Store (Arg2, Local2)
                                    }

                                    CreateDWordField (Arg2, 0x04, SUBF)
                                    Store (Zero, Local2)
                                    If (LGreater (SizeOf (Arg2), 0x08))
                                    {
                                        Subtract (SizeOf (Arg2), 0x08, Local2)
                                        ShiftLeft (Local2, 0x03, Local2)
                                    }

                                    CreateField (Arg2, 0x40, Local2, ARGS)
                                    Return (\_SB.PCI0.PEGP.VGA.NVIF (FUNC, SUBF, ARGS))
                                }

                                Return (0x00)
                            }
                        }
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
                    If (SCIP ())
                    {
                        Store (NDID, Local0)
                        Store (0x00, NDID)
                        If (LNotEqual (DIDL, Zero))
                        {
                            Store (SDDL (DID1), DID1)
                        }

                        If (LNotEqual (DDL2, Zero))
                        {
                            Store (SDDL (DID2), DID2)
                        }

                        If (LNotEqual (DDL3, Zero))
                        {
                            Store (SDDL (DID3), DID3)
                        }

                        If (LNotEqual (DDL4, Zero))
                        {
                            Store (SDDL (DID4), DID4)
                        }

                        If (LNotEqual (DDL5, Zero))
                        {
                            Store (SDDL (DID5), DID5)
                        }

                        If (LEqual (NDID, 0x00))
                        {
                            Store (Local0, NDID)
                        }
                    }

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

                    If (LGreater (NDID, 0x04))
                    {
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
                        Store (Or (0x00010000, DID4), Index (TMP5, 0x04))
                        Return (TMP5)
                    }

                    Return (Package (0x01)
                    {
                        0x0400
                    })
                }

                Device (DD01)
                {
                    Method (_ADR, 0, Serialized)
                    {
                        If (LEqual (DID1, 0x00))
                        {
                            Return (0x01)
                        }
                        Else
                        {
                            Return (And (0xFFFF, DID1))
                        }
                    }

                    Method (_DCS, 0, NotSerialized)
                    {
                        If (SCIP ())
                        {
                            Return (CDDS (DID1))
                        }
                        Else
                        {
                            TRAP (\TRTI, \GCDD)
                            If (And (CSTE, 0x01))
                            {
                                Return (0x1F)
                            }

                            Return (0x1D)
                        }
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        If (SCIP ())
                        {
                            Return (NDDS (DID1))
                        }
                        Else
                        {
                            If (And (NSTE, 0x01))
                            {
                                Return (0x01)
                            }

                            Return (0x00)
                        }
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
                        If (LEqual (DID2, 0x00))
                        {
                            Return (0x02)
                        }
                        Else
                        {
                            Return (And (0xFFFF, DID2))
                        }
                    }

                    Method (_DCS, 0, NotSerialized)
                    {
                        If (SCIP ())
                        {
                            Return (CDDS (DID2))
                        }
                        Else
                        {
                            TRAP (\TRTI, \GCDD)
                            If (And (CSTE, 0x02))
                            {
                                Return (0x1F)
                            }

                            Return (0x1D)
                        }
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        If (SCIP ())
                        {
                            Return (NDDS (DID2))
                        }
                        Else
                        {
                            If (And (NSTE, 0x02))
                            {
                                Return (0x01)
                            }

                            Return (0x00)
                        }
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
                        If (LEqual (DID3, 0x00))
                        {
                            Return (0x03)
                        }
                        Else
                        {
                            Return (And (0xFFFF, DID3))
                        }
                    }

                    Method (_DCS, 0, NotSerialized)
                    {
                        If (LEqual (DID3, 0x00))
                        {
                            Return (0x0B)
                        }
                        Else
                        {
                            If (SCIP ())
                            {
                                Return (CDDS (DID3))
                            }
                            Else
                            {
                                TRAP (\TRTI, \GCDD)
                                If (And (CSTE, 0x04))
                                {
                                    Return (0x1F)
                                }

                                Return (0x1D)
                            }
                        }
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        If (SCIP ())
                        {
                            Return (NDDS (DID3))
                        }
                        Else
                        {
                            If (And (NSTE, 0x04))
                            {
                                Return (0x01)
                            }

                            Return (0x00)
                        }
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
                        If (LEqual (DID4, 0x00))
                        {
                            Return (0x04)
                        }
                        Else
                        {
                            Return (And (0xFFFF, DID4))
                        }
                    }

                    Method (_DCS, 0, NotSerialized)
                    {
                        If (LEqual (DID4, 0x00))
                        {
                            Return (0x0B)
                        }
                        Else
                        {
                            If (SCIP ())
                            {
                                Return (CDDS (DID4))
                            }
                            Else
                            {
                                TRAP (\TRTI, \GCDD)
                                If (And (CSTE, 0x08))
                                {
                                    Return (0x1F)
                                }

                                Return (0x1D)
                            }
                        }
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        If (SCIP ())
                        {
                            Return (NDDS (DID4))
                        }
                        Else
                        {
                            If (And (NSTE, 0x08))
                            {
                                Return (0x01)
                            }

                            Return (0x00)
                        }
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
                        If (LEqual (DID5, 0x00))
                        {
                            Return (0x05)
                        }
                        Else
                        {
                            Return (And (0xFFFF, DID5))
                        }
                    }

                    Method (_DCS, 0, NotSerialized)
                    {
                        If (LEqual (DID5, 0x00))
                        {
                            Return (0x0B)
                        }
                        Else
                        {
                            If (SCIP ())
                            {
                                Return (CDDS (DID5))
                            }
                            Else
                            {
                                TRAP (\TRTI, \GCDD)
                                If (And (CSTE, 0x10))
                                {
                                    Return (0x1F)
                                }

                                Return (0x1D)
                            }
                        }
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        If (SCIP ())
                        {
                            Return (NDDS (DID5))
                        }
                        Else
                        {
                            If (And (NSTE, 0x10))
                            {
                                Return (0x01)
                            }

                            Return (0x00)
                        }
                    }

                    Method (_DSS, 1, NotSerialized)
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE)
                        }
                    }
                }

                Method (SDDL, 1, NotSerialized)
                {
                    Increment (NDID)
                    Store (And (Arg0, 0x0F0F), Local0)
                    Or (0x80000000, Local0, Local1)
                    If (LEqual (DIDL, Local0))
                    {
                        Return (Local1)
                    }

                    If (LEqual (DDL2, Local0))
                    {
                        Return (Local1)
                    }

                    If (LEqual (DDL3, Local0))
                    {
                        Return (Local1)
                    }

                    If (LEqual (DDL4, Local0))
                    {
                        Return (Local1)
                    }

                    If (LEqual (DDL5, Local0))
                    {
                        Return (Local1)
                    }

                    If (LEqual (DDL6, Local0))
                    {
                        Return (Local1)
                    }

                    If (LEqual (DDL7, Local0))
                    {
                        Return (Local1)
                    }

                    If (LEqual (DDL8, Local0))
                    {
                        Return (Local1)
                    }

                    Return (0x00)
                }

                Method (CDDS, 1, NotSerialized)
                {
                    Store (And (Arg0, 0x0F0F), Local0)
                    If (LEqual (0x00, Local0))
                    {
                        Return (0x1D)
                    }

                    If (LEqual (CADL, Local0))
                    {
                        Return (0x1F)
                    }

                    If (LEqual (CAL2, Local0))
                    {
                        Return (0x1F)
                    }

                    If (LEqual (CAL3, Local0))
                    {
                        Return (0x1F)
                    }

                    If (LEqual (CAL4, Local0))
                    {
                        Return (0x1F)
                    }

                    If (LEqual (CAL5, Local0))
                    {
                        Return (0x1F)
                    }

                    If (LEqual (CAL6, Local0))
                    {
                        Return (0x1F)
                    }

                    If (LEqual (CAL7, Local0))
                    {
                        Return (0x1F)
                    }

                    If (LEqual (CAL8, Local0))
                    {
                        Return (0x1F)
                    }

                    If (LEqual (CADL, 0x00))
                    {
                        If (LEqual (And (Arg0, 0x0F0F), 0x0400))
                        {
                            Return (0x1F)
                        }
                    }

                    Return (0x1D)
                }

                Method (NDDS, 1, NotSerialized)
                {
                    Store (And (Arg0, 0x0F0F), Local0)
                    If (LEqual (0x00, Local0))
                    {
                        Return (0x00)
                    }

                    If (LEqual (NADL, Local0))
                    {
                        Return (0x01)
                    }

                    If (LEqual (NDL2, Local0))
                    {
                        Return (0x01)
                    }

                    If (LEqual (NDL3, Local0))
                    {
                        Return (0x01)
                    }

                    If (LEqual (NDL4, Local0))
                    {
                        Return (0x01)
                    }

                    If (LEqual (NDL5, Local0))
                    {
                        Return (0x01)
                    }

                    If (LEqual (NDL6, Local0))
                    {
                        Return (0x01)
                    }

                    If (LEqual (NDL7, Local0))
                    {
                        Return (0x01)
                    }

                    If (LEqual (NDL8, Local0))
                    {
                        Return (0x01)
                    }

                    If (LEqual (NADL, 0x00))
                    {
                        If (LEqual (And (Arg0, 0x0F0F), 0x0400))
                        {
                            Return (0x01)
                        }
                    }

                    Return (0x00)
                }

                Scope (\_SB.PCI0)
                {
                    OperationRegion (MCHP, PCI_Config, 0x40, 0xC0)
                    Field (MCHP, AnyAcc, NoLock, Preserve)
                    {
                                Offset (0x60), 
                        TASM,   10, 
                                Offset (0x62)
                    }
                }

                OperationRegion (IGDP, PCI_Config, 0x40, 0xC0)
                Field (IGDP, AnyAcc, NoLock, Preserve)
                {
                            Offset (0x12), 
                        ,   1, 
                    GIVD,   1, 
                        ,   2, 
                    GUMA,   3, 
                            Offset (0x14), 
                        ,   4, 
                    GMFN,   1, 
                            Offset (0x18), 
                            Offset (0xA4), 
                    ASLE,   8, 
                            Offset (0xA8), 
                    GSSE,   1, 
                    GSSB,   14, 
                    GSES,   1, 
                            Offset (0xB0), 
                        ,   12, 
                    CDVL,   1, 
                            Offset (0xB2), 
                            Offset (0xB5), 
                    LBPC,   8, 
                            Offset (0xBC), 
                    ASLS,   32
                }

                OperationRegion (IGDM, SystemMemory, ASLB, 0x2000)
                Field (IGDM, AnyAcc, NoLock, Preserve)
                {
                    SIGN,   128, 
                    SIZE,   32, 
                    OVER,   32, 
                    SVER,   256, 
                    VVER,   128, 
                    GVER,   128, 
                    MBOX,   32, 
                    DMOD,   32, 
                            Offset (0x100), 
                    DRDY,   32, 
                    CSTS,   32, 
                    CEVT,   32, 
                            Offset (0x120), 
                    DIDL,   32, 
                    DDL2,   32, 
                    DDL3,   32, 
                    DDL4,   32, 
                    DDL5,   32, 
                    DDL6,   32, 
                    DDL7,   32, 
                    DDL8,   32, 
                    CPDL,   32, 
                    CPL2,   32, 
                    CPL3,   32, 
                    CPL4,   32, 
                    CPL5,   32, 
                    CPL6,   32, 
                    CPL7,   32, 
                    CPL8,   32, 
                    CADL,   32, 
                    CAL2,   32, 
                    CAL3,   32, 
                    CAL4,   32, 
                    CAL5,   32, 
                    CAL6,   32, 
                    CAL7,   32, 
                    CAL8,   32, 
                    NADL,   32, 
                    NDL2,   32, 
                    NDL3,   32, 
                    NDL4,   32, 
                    NDL5,   32, 
                    NDL6,   32, 
                    NDL7,   32, 
                    NDL8,   32, 
                    ASLP,   32, 
                    TIDX,   32, 
                    CHPD,   32, 
                    CLID,   32, 
                    CDCK,   32, 
                    SXSW,   32, 
                    EVTS,   32, 
                    CNOT,   32, 
                    NRDY,   32, 
                            Offset (0x200), 
                    SCIE,   1, 
                    GEFC,   4, 
                    GXFC,   3, 
                    GESF,   8, 
                            Offset (0x204), 
                    PARM,   32, 
                    DSLP,   32, 
                            Offset (0x300), 
                    ARDY,   32, 
                    ASLC,   32, 
                    TCHE,   32, 
                    ALSI,   32, 
                    BCLP,   32, 
                    PFIT,   32, 
                    CBLV,   32, 
                    BCLM,   320, 
                    CPFM,   32, 
                    EPFM,   32, 
                    PLUT,   592, 
                    PFMB,   32, 
                    CCDV,   32, 
                    PCFT,   32, 
                            Offset (0x400), 
                    GVD1,   49152, 
                    PHED,   32, 
                    BDDC,   2048
                }

                Name (DBTB, Package (0x15)
                {
                    0x00, 
                    0x07, 
                    0x38, 
                    0x01C0, 
                    0x0E00, 
                    0x3F, 
                    0x01C7, 
                    0x0E07, 
                    0x01F8, 
                    0x0E38, 
                    0x0FC0, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x7000, 
                    0x7007, 
                    0x7038, 
                    0x71C0, 
                    0x7E00
                })
                Name (CDCT, Package (0x05)
                {
                    Package (0x02)
                    {
                        0xE4, 
                        0x0140
                    }, 

                    Package (0x02)
                    {
                        0xDE, 
                        0x014D
                    }, 

                    Package (0x02)
                    {
                        0xDE, 
                        0x014D
                    }, 

                    Package (0x02)
                    {
                        0x00, 
                        0x00
                    }, 

                    Package (0x02)
                    {
                        0xDE, 
                        0x014D
                    }
                })
                Name (SUCC, 0x01)
                Name (NVLD, 0x02)
                Name (CRIT, 0x04)
                Name (NCRT, 0x06)
                Method (GSCI, 0, Serialized)
                {
                    Method (GBDA, 0, Serialized)
                    {
                        If (LEqual (GESF, 0x00))
                        {
                            Store (0x0679, PARM)
                            Store (Zero, GESF)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x01))
                        {
                            Store (0x0240, PARM)
                            Store (Zero, GESF)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x04))
                        {
                            And (PARM, 0xEFFF0000, PARM)
                            And (PARM, ShiftLeft (DerefOf (Index (DBTB, IBTT)), 0x10), 
                                PARM)
                            Or (IBTT, PARM, PARM)
                            Store (Zero, GESF)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x05))
                        {
                            Store (IPSC, PARM)
                            Or (PARM, ShiftLeft (IPAT, 0x08), PARM)
                            Add (PARM, 0x0100, PARM)
                            Or (PARM, ShiftLeft (LIDS, 0x10), PARM)
                            Add (PARM, 0x00010000, PARM)
                            Or (PARM, ShiftLeft (IBIA, 0x14), PARM)
                            Store (Zero, GESF)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x06))
                        {
                            Store (ITVF, PARM)
                            Or (PARM, ShiftLeft (ITVM, 0x04), PARM)
                            Store (Zero, GESF)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x07))
                        {
                            Store (GIVD, PARM)
                            XOr (PARM, 0x01, PARM)
                            Or (PARM, ShiftLeft (GMFN, 0x01), PARM)
                            Or (PARM, ShiftLeft (0x03, 0x0B), PARM)
                            Or (PARM, ShiftLeft (IDMS, 0x11), PARM)
                            Or (ShiftLeft (DerefOf (Index (DerefOf (Index (CDCT, HVCO)), CDVL
                                )), 0x15), PARM, PARM)
                            Store (0x01, GESF)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x0A))
                        {
                            Store (0x00, PARM)
                            If (ISSC)
                            {
                                Or (PARM, 0x03, PARM)
                            }

                            Store (0x00, GESF)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x0B))
                        {
                            Store (KSV0, PARM)
                            Store (KSV1, GESF)
                            Return (SUCC)
                        }

                        Store (Zero, GESF)
                        Return (CRIT)
                    }

                    Method (SBCB, 0, Serialized)
                    {
                        If (LEqual (GESF, 0x00))
                        {
                            Store (0x00, PARM)
                            Store (Zero, GESF)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x01))
                        {
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x03))
                        {
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x04))
                        {
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x05))
                        {
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x06))
                        {
                            Store (And (PARM, 0x0F), ITVF)
                            Store (ShiftRight (And (PARM, 0xF0), 0x04), ITVM)
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x07))
                        {
                            If (LEqual (PARM, 0x00))
                            {
                                Store (CLID, Local0)
                                If (And (0x80000000, Local0))
                                {
                                    And (CLID, 0x0F, CLID)
                                    GLID (CLID)
                                }
                            }

                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x08))
                        {
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x09))
                        {
                            And (PARM, 0xFF, IBTT)
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x0A))
                        {
                            And (PARM, 0xFF, IPSC)
                            If (And (ShiftRight (PARM, 0x08), 0xFF))
                            {
                                And (ShiftRight (PARM, 0x08), 0xFF, IPAT)
                                Decrement (IPAT)
                            }

                            And (ShiftRight (PARM, 0x14), 0x07, IBIA)
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x0B))
                        {
                            And (ShiftRight (PARM, 0x01), 0x01, IF1E)
                            If (And (PARM, ShiftLeft (0x0F, 0x0D)))
                            {
                                And (ShiftRight (PARM, 0x0D), 0x0F, IDMS)
                            }
                            Else
                            {
                                And (ShiftRight (PARM, 0x11), 0x0F, IDMS)
                            }

                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x10))
                        {
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x11))
                        {
                            Store (ShiftLeft (LIDS, 0x08), PARM)
                            Add (PARM, 0x0100, PARM)
                            Store (Zero, GESF)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x12))
                        {
                            If (And (PARM, 0x01))
                            {
                                If (LEqual (ShiftRight (PARM, 0x01), 0x01))
                                {
                                    Store (0x01, ISSC)
                                }
                                Else
                                {
                                    Store (Zero, GESF)
                                    Return (CRIT)
                                }
                            }
                            Else
                            {
                                Store (0x00, ISSC)
                            }

                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x13))
                        {
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x14))
                        {
                            And (PARM, 0x0F, PAVP)
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        Store (Zero, GESF)
                        Return (SUCC)
                    }

                    If (LEqual (GEFC, 0x04))
                    {
                        Store (GBDA (), GXFC)
                    }

                    If (LEqual (GEFC, 0x06))
                    {
                        Store (SBCB (), GXFC)
                    }

                    Store (0x00, GEFC)
                    Store (0x01, SCIS)
                    Store (0x00, GSSE)
                    Store (0x00, SCIE)
                    Return (Zero)
                }

                Method (PDRD, 0, NotSerialized)
                {
                    If (LNot (DRDY))
                    {
                        Sleep (ASLP)
                    }

                    Return (LNot (DRDY))
                }

                Method (PSTS, 0, NotSerialized)
                {
                    If (LGreater (CSTS, 0x02))
                    {
                        Sleep (ASLP)
                    }

                    Return (LEqual (CSTS, 0x03))
                }

                Method (GNOT, 2, NotSerialized)
                {
                    If (PDRD ())
                    {
                        Return (0x01)
                    }

                    Store (Arg0, CEVT)
                    Store (0x03, CSTS)
                    If (LAnd (LEqual (CHPD, 0x00), LEqual (Arg1, 0x00)))
                    {
                        If (LOr (LGreater (OSYS, 0x07D0), LLess (OSYS, 0x07D6)))
                        {
                            Notify (\_SB.PCI0, Arg1)
                        }
                        Else
                        {
                            Notify (\_SB.PCI0.GFX0, Arg1)
                        }
                    }

                    Notify (\_SB.PCI0.GFX0, 0x80)
                    Return (0x00)
                }

                Method (GHDS, 1, NotSerialized)
                {
                    Store (Arg0, TIDX)
                    Return (GNOT (0x01, 0x00))
                }

                Method (GLID, 1, NotSerialized)
                {
                    Store (Arg0, CLID)
                    Return (GNOT (0x02, 0x00))
                }

                Method (GDCK, 1, NotSerialized)
                {
                    Store (Arg0, CDCK)
                    Return (GNOT (0x04, 0x00))
                }

                Method (PARD, 0, NotSerialized)
                {
                    If (LNot (ARDY))
                    {
                        Sleep (ASLP)
                    }

                    Return (LNot (ARDY))
                }

                Method (AINT, 2, NotSerialized)
                {
                    If (LNot (And (TCHE, ShiftLeft (0x01, Arg0))))
                    {
                        Return (0x01)
                    }

                    If (PARD ())
                    {
                        Return (0x01)
                    }

                    If (LEqual (Arg0, 0x02))
                    {
                        If (CPFM)
                        {
                            And (CPFM, 0x0F, Local0)
                            And (EPFM, 0x0F, Local1)
                            If (LEqual (Local0, 0x01))
                            {
                                If (And (Local1, 0x06))
                                {
                                    Store (0x06, PFIT)
                                }
                                Else
                                {
                                    If (And (Local1, 0x08))
                                    {
                                        Store (0x08, PFIT)
                                    }
                                    Else
                                    {
                                        Store (0x01, PFIT)
                                    }
                                }
                            }

                            If (LEqual (Local0, 0x06))
                            {
                                If (And (Local1, 0x08))
                                {
                                    Store (0x08, PFIT)
                                }
                                Else
                                {
                                    If (And (Local1, 0x01))
                                    {
                                        Store (0x01, PFIT)
                                    }
                                    Else
                                    {
                                        Store (0x06, PFIT)
                                    }
                                }
                            }

                            If (LEqual (Local0, 0x08))
                            {
                                If (And (Local1, 0x01))
                                {
                                    Store (0x01, PFIT)
                                }
                                Else
                                {
                                    If (And (Local1, 0x06))
                                    {
                                        Store (0x06, PFIT)
                                    }
                                    Else
                                    {
                                        Store (0x08, PFIT)
                                    }
                                }
                            }
                        }
                        Else
                        {
                            XOr (PFIT, 0x07, PFIT)
                        }

                        Or (PFIT, 0x80000000, PFIT)
                        Store (0x04, ASLC)
                    }
                    Else
                    {
                        If (LEqual (Arg0, 0x01))
                        {
                            Store (Divide (Multiply (Arg1, 0xFF), 0x64, ), BCLP)
                            Or (BCLP, 0x80000000, BCLP)
                            Store (0x02, ASLC)
                        }
                        Else
                        {
                            If (LEqual (Arg0, 0x00))
                            {
                                Store (Arg1, ALSI)
                                Store (0x01, ASLC)
                            }
                            Else
                            {
                                Return (0x01)
                            }
                        }
                    }

                    Store (0x00, LBPC)
                    Return (0x00)
                }

                Method (SCIP, 0, NotSerialized)
                {
                    If (LNotEqual (OVER, 0x00))
                    {
                        Return (LNot (GSMI))
                    }

                    Return (0x00)
                }

                Name (NDLC, 0x00)
                Method (SNDL, 1, NotSerialized)
                {
                    Store (0x00, NDLC)
                    Store (0x00, NADL)
                    Store (0x00, NDL2)
                    Store (0x00, NDL3)
                    Store (0x00, NDL4)
                    Store (0x00, NDL5)
                    If (And (Arg0, 0x08))
                    {
                        S2ND (0x0400)
                    }

                    If (And (Arg0, 0x01))
                    {
                        S2ND (0x0100)
                    }

                    If (And (Arg0, 0x02))
                    {
                        S2ND (0x0200)
                    }

                    If (And (Arg0, 0x04))
                    {
                        S2ND (0x0300)
                    }
                }

                Method (S2ND, 1, NotSerialized)
                {
                    Increment (NDLC)
                    If (LEqual (NDLC, 0x01))
                    {
                        Store (Arg0, NADL)
                    }

                    If (LEqual (NDLC, 0x02))
                    {
                        Store (Arg0, NDL2)
                    }

                    If (LEqual (NDLC, 0x03))
                    {
                        Store (Arg0, NDL3)
                    }

                    If (LEqual (NDLC, 0x04))
                    {
                        Store (Arg0, NDL4)
                    }

                    If (LEqual (NDLC, 0x05))
                    {
                        Store (Arg0, NDL5)
                    }
                }
            }

            Device (P0P1)
            {
                Name (_ADR, 0x001E0000)
                Name (_PRW, Package (0x02)
                {
                    0x0B, 
                    0x04
                })
                Method (_PRT, 0, NotSerialized)
                {
                    If (PICM)
                    {
                        Return (AR01)
                    }

                    Return (PR01)
                }
            }

            Device (LPCB)
            {
                Name (_ADR, 0x001F0000)
                Scope (\_SB)
                {
                    Scope (\_SB)
                    {
                        OperationRegion (SMI0, SystemIO, 0x0000FE00, 0x00000002)
                        Field (SMI0, AnyAcc, NoLock, Preserve)
                        {
                            SMIC,   8
                        }

                        OperationRegion (SMI1, SystemMemory, 0x7BB9EEBD, 0x00000090)
                        Field (SMI1, AnyAcc, NoLock, Preserve)
                        {
                            BCMD,   8, 
                            DID,    32, 
                            INFO,   1024
                        }

                        Field (SMI1, AnyAcc, NoLock, Preserve)
                        {
                                    AccessAs (ByteAcc, 0x00), 
                                    Offset (0x05), 
                            INF,    8, 
                            INF1,   8, 
                            INF2,   8
                        }
                    }

                    OperationRegion (\_SB.PCI0.LPCB.LPC1, PCI_Config, 0x40, 0xC0)
                    Field (\_SB.PCI0.LPCB.LPC1, AnyAcc, NoLock, Preserve)
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
                        PHRC,   8
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
                            CreateWordField (RTLA, \_SB.LNKA._CRS._Y0F._INT, IRQ0)
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
                            CreateWordField (RTLB, \_SB.LNKB._CRS._Y10._INT, IRQ0)
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
                            CreateWordField (RTLC, \_SB.LNKC._CRS._Y11._INT, IRQ0)
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
                            CreateWordField (RTLD, \_SB.LNKD._CRS._Y12._INT, IRQ0)
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
                            CreateWordField (RTLE, \_SB.LNKE._CRS._Y13._INT, IRQ0)
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
                            CreateWordField (RTLF, \_SB.LNKF._CRS._Y14._INT, IRQ0)
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
                            CreateWordField (RTLG, \_SB.LNKG._CRS._Y15._INT, IRQ0)
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
                            CreateWordField (RTLH, \_SB.LNKH._CRS._Y16._INT, IRQ0)
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
                }

                OperationRegion (LPC0, PCI_Config, 0x40, 0xC0)
                Field (LPC0, AnyAcc, NoLock, Preserve)
                {
                            Offset (0x40), 
                    IOD0,   8, 
                    IOD1,   8, 
                            Offset (0x60), 
                        ,   7, 
                    C4C3,   1, 
                            Offset (0xB0), 
                    RAEN,   1, 
                        ,   13, 
                    RCBA,   18
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
                        KCMD,   8, 
                                Offset (0x08), 
                        KDAT,   8, 
                                Offset (0x0A), 
                            ,   1, 
                        BLNK,   1, 
                        WLLD,   2, 
                        BTLD,   2, 
                                Offset (0x13), 
                        URTB,   8, 
                                Offset (0x52), 
                        WDEV,   1, 
                        BDEV,   1, 
                        GDEV,   1, 
                            ,   4, 
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
                        USBP,   1, 
                            ,   2, 
                        KEYW,   1, 
                        RTCW,   1, 
                        LIDW,   1, 
                        BL2W,   1, 
                        TPDW,   1, 
                                Offset (0x73), 
                        WWEN,   1, 
                                Offset (0x75), 
                        SWBL,   1, 
                        KLMA,   1, 
                            ,   1, 
                            ,   1, 
                            ,   1, 
                            ,   1, 
                            ,   1, 
                                Offset (0x76), 
                        SYSC,   4, 
                        SYSO,   4
                    }

                    Field (RAM, ByteAcc, Lock, Preserve)
                    {
                                Offset (0x7F), 
                        BNEN,   1, 
                        BNCM,   1, 
                        BNDM,   1, 
                        BNVE,   1, 
                                Offset (0x83), 
                        BNAC,   4, 
                        BNDC,   4
                    }

                    Field (RAM, ByteAcc, Lock, Preserve)
                    {
                                Offset (0x01), 
                        TIID,   8, 
                                Offset (0x10), 
                            ,   1, 
                        KTEE,   1, 
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
                            Store (0x05, SYSO)
                            If (LEqual (OSYS, 0x07D6))
                            {
                                Store (0x00, BNEN)
                            }
                        }

                        Store (0x01, \_SB.PCI0.GFX0.CLID)
                    }

                    Method (TINI, 0, NotSerialized)
                    {
                        Notify (\_PR.CPU0, 0x80)
                        Notify (\_PR.CPU1, 0x80)
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

                    Name (BREB, 0x00)
                    Name (EPMS, 0x00)
                    Name (WLLS, 0x00)
                    Name (WLES, 0x00)
                    Name (BTLS, 0x00)
                    Name (BTES, 0x00)
                    Name (WWES, 0x00)
                    Method (ECPS, 1, NotSerialized)
                    {
                        Store (Arg0, URTB)
                        Store (Arg0, SYSC)
                        Store (0x01, MUTE)
                        If (LOr (LEqual (Arg0, 0x03), LEqual (Arg0, 0x04)))
                        {
                            Store (BNEN, BREB)
                            Store (WEPM, EPMS)
                            Store (WLLD, WLLS)
                            Store (WLEN, WLES)
                            Store (BTLD, BTLS)
                            Store (BTEN, BTES)
                            Store (WWEN, WWES)
                            Store (0x00, WLEN)
                        }

                        If (LEqual (Arg0, 0x04))
                        {
                            Store (0x01, BLNK)
                        }
                    }

                    Method (ECWK, 1, NotSerialized)
                    {
                        Store (Arg0, URTB)
                        Store (Arg0, SYSO)
                        Store (0x00, MUTE)
                        TINI ()
                        Store (0xFF, B0ST)
                        Notify (BAT0, 0x81)
                        If (LOr (LEqual (Arg0, 0x03), LEqual (Arg0, 0x04)))
                        {
                            Store (BREB, BNEN)
                            Store (EPMS, WEPM)
                            Store (WLLS, WLLD)
                            Store (WLES, WLEN)
                            Store (BTLS, BTLD)
                            Store (BTES, BTEN)
                            Store (WWES, WWEN)
                        }

                        If (LEqual (Arg0, 0x03)) {}
                        If (LEqual (Arg0, 0x04)) {}
                        If (LOr (LEqual (Arg0, 0x04), LEqual (Arg0, 0x05))) {}
                    }

                    Method (HKDS, 1, NotSerialized)
                    {
                        If (LEqual (0x00, DSEN))
                        {
                            If (LEqual (PEGD, 0x03))
                            {
                                Notify (\_SB.PCI0.PEGP.VGA, 0xCB)
                                Sleep (0x03E8)
                            }
                            Else
                            {
                                PHSR (0x8C, 0x00)
                            }

                            If (LNotEqual (CADL, PADL))
                            {
                                Store (CADL, PADL)
                                If (LOr (LGreater (OSYS, 0x07D0), LLess (OSYS, 0x07D6)))
                                {
                                    Notify (\_SB.PCI0, 0x00)
                                }
                                Else
                                {
                                    If (IGDS)
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
                                If (IGDS)
                                {
                                    If (\ASLB)
                                    {
                                        \_SB.PCI0.GFX0.GHDS (0x00)
                                        Return (0x00)
                                    }
                                }

                                If (LEqual (PEGD, 0x03))
                                {
                                    If (LEqual (CSTE, 0x0101))
                                    {
                                        Store (0x00, Local0)
                                    }

                                    If (LEqual (CSTE, 0x0808))
                                    {
                                        Store (0x01, Local0)
                                    }

                                    If (LEqual (CSTE, 0x0909))
                                    {
                                        Store (0x02, Local0)
                                    }
                                }
                                Else
                                {
                                    Store (PHSR (0x8A, 0x00), Local0)
                                }

                                If (LEqual (Local0, 0x01))
                                {
                                    Store (0x00, Local1)
                                }

                                If (LEqual (Local0, 0x00))
                                {
                                    Store (0x02, Local1)
                                }

                                If (LEqual (Local0, 0x02))
                                {
                                    Store (0x01, Local1)
                                }

                                Store (Local1, Local0)
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

                            If (IGDS)
                            {
                                If (\ASLB)
                                {
                                    \_SB.PCI0.GFX0.SNDL (NSTE)
                                    \_SB.PCI0.GFX0.GHDS (0x00)
                                }
                                Else
                                {
                                    Notify (\_SB.PCI0.GFX0, 0x80)
                                }
                            }
                            Else
                            {
                                Notify (\_SB.PCI0.PEGP.VGA, 0x80)
                            }
                        }

                        If (LEqual (0x01, DSEN)) {}
                    }

                    Method (_Q19, 0, NotSerialized)
                    {
                        Store (0x19, P80H)
                        HKDS (0x10)
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

                    Method (_Q5C, 0, NotSerialized)
                    {
                        Store (0x5C, P80H)
                        If (\_SB.AMW0.FIRE)
                        {
                            \_SB.AMW0.ACRN (0x0D)
                        }
                    }

                    Method (_Q10, 0, NotSerialized)
                    {
                        Store (0x10, P80H)
                        If (\_SB.AMW0.FIRE)
                        {
                            \_SB.AMW0.ACRN (0x01)
                        }
                    }

                    Method (_Q1C, 0, NotSerialized)
                    {
                        Store (0x1C, P80H)
                        If (BNEN)
                        {
                            If (\_SB.AMW0.FIRE)
                            {
                                \_SB.AMW0.ACRN (0x03)
                            }
                        }
                        Else
                        {
                            If (IGDS)
                            {
                                \BIAN (0x86)
                            }
                            Else
                            {
                                Notify (\_SB.PCI0.PEGP.VGA.LCD, 0x86)
                            }
                        }
                    }

                    Method (_Q1D, 0, NotSerialized)
                    {
                        Store (0x1D, P80H)
                        If (BNEN)
                        {
                            If (\_SB.AMW0.FIRE)
                            {
                                \_SB.AMW0.ACRN (0x03)
                            }
                        }
                        Else
                        {
                            If (IGDS)
                            {
                                \BIAN (0x87)
                            }
                            Else
                            {
                                Notify (\_SB.PCI0.PEGP.VGA.LCD, 0x87)
                            }
                        }
                    }

                    Method (_Q23, 0, NotSerialized)
                    {
                        Store (0x23, P80H)
                        If (\_SB.AMW0.FIRE)
                        {
                            \_SB.AMW0.ACRN (0x02)
                        }
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
                        NTMR ()
                    }

                    Method (_Q34, 0, NotSerialized)
                    {
                        Store (0x34, P80H)
                        Store (0x01, KCSS)
                        NTMR ()
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

                    Method (_Q40, 0, NotSerialized)
                    {
                        Store (0x40, P80H)
                        Store (0xFF, B0ST)
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
                        Store (0xFF, B0ST)
                        Notify (\_SB.PCI0.LPCB.EC0.BAT0, 0x81)
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

                    Method (NTMR, 0, NotSerialized)
                    {
                        Notify (\_TZ.TZS0, 0x80)
                        Notify (\_TZ.TZS1, 0x80)
                    }

                    Method (_Q5D, 0, NotSerialized)
                    {
                        Store (0x5D, P80H)
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
                        If (Arg0)
                        {
                            Store (SM1F, Local0)
                        }
                        Else
                        {
                            Store (SM0F, Local0)
                        }

                        If (Local0)
                        {
                            And (Arg1, ShiftLeft (0x01, 0x03), Local0)
                            If (LEqual (Local0, 0x00))
                            {
                                Return (Arg3)
                            }
                        }

                        Acquire (BATM, 0xFFFF)
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
                        Release (BATM)
                        Return (Arg3)
                    }

                    Name (B0ST, 0xFF)
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
                            If (LEqual (B0ST, 0xFF))
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
                            }
                            Else
                            {
                                Store (B0ST, Local1)
                            }

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

                Scope (\_SB)
                {
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
                        Name (_WDG, Buffer (0x012C)
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
                            /* 0078 */    0x45, 0xDD, 0x23, 0x59, 0x80, 0x04, 0xD5, 0x4E, 
                            /* 0080 */    0xB6, 0x1A, 0xC9, 0xEC, 0x6C, 0x90, 0xE2, 0x6A, 
                            /* 0088 */    0x43, 0x39, 0x01, 0x02, 0x58, 0xF2, 0xF4, 0x6A, 
                            /* 0090 */    0x01, 0xB4, 0xFD, 0x42, 0xBE, 0x91, 0x3D, 0x4A, 
                            /* 0098 */    0xC2, 0xD7, 0xC0, 0xD3, 0x43, 0x41, 0x01, 0x02, 
                            /* 00A0 */    0xAC, 0x61, 0x1A, 0xCC, 0x56, 0x42, 0xA3, 0x41, 
                            /* 00A8 */    0xB9, 0xE0, 0x05, 0xA4, 0x45, 0xAD, 0xE2, 0xF5, 
                            /* 00B0 */    0xB2, 0x00, 0x01, 0x08, 0x53, 0x44, 0x8C, 0xE7, 
                            /* 00B8 */    0x27, 0x02, 0x61, 0x48, 0x9E, 0xDE, 0xF5, 0x60, 
                            /* 00C0 */    0x0B, 0x4A, 0x3D, 0x39, 0x43, 0x42, 0x01, 0x02, 
                            /* 00C8 */    0x7B, 0x4F, 0xE0, 0xAA, 0xC5, 0xB3, 0x65, 0x48, 
                            /* 00D0 */    0x95, 0xD6, 0x9F, 0xAC, 0x7F, 0xF3, 0xE9, 0x2B, 
                            /* 00D8 */    0x43, 0x43, 0x01, 0x02, 0x79, 0x4C, 0xF9, 0xCF, 
                            /* 00E0 */    0x77, 0x6C, 0xF7, 0x4A, 0xAC, 0x56, 0x7D, 0xD0, 
                            /* 00E8 */    0xCE, 0x01, 0xC9, 0x97, 0x43, 0x44, 0x01, 0x02, 
                            /* 00F0 */    0xC5, 0x2E, 0x77, 0x79, 0xB1, 0x04, 0xFD, 0x4B, 
                            /* 00F8 */    0x84, 0x3C, 0x61, 0xE7, 0xF7, 0x7B, 0x6C, 0xC9, 
                            /* 0100 */    0x43, 0x45, 0x01, 0x02, 0x4F, 0x06, 0x3A, 0x65, 
                            /* 0108 */    0x3A, 0xA2, 0x5F, 0x48, 0xB3, 0xD9, 0x13, 0xF6, 
                            /* 0110 */    0x53, 0x2A, 0x01, 0x82, 0x43, 0x46, 0x01, 0x02, 
                            /* 0118 */    0x91, 0x6B, 0x91, 0x36, 0x64, 0x1A, 0x83, 0x45, 
                            /* 0120 */    0x84, 0xD0, 0x53, 0x83, 0x0F, 0xB9, 0x10, 0x8D, 
                            /* 0128 */    0xB4, 0x00, 0x01, 0x08
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
                        Name (CBE1, Buffer (0x14)
                        {
                            /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                            /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                            /* 0010 */    0x00, 0x00, 0x00, 0x00
                        })
                        CreateDWordField (CBE1, 0x00, B1R0)
                        CreateDWordField (CBE1, 0x04, B1R4)
                        CreateDWordField (CBE1, 0x08, B1R8)
                        CreateDWordField (CBE1, 0x0C, B1RC)
                        CreateDWordField (CBE1, 0x10, B1ER)
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
                                    Offset (0x51), 
                            BLST,   1, 
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
                                    Offset (0x77), 
                                ,   3, 
                            LSTS,   1, 
                                    Offset (0x82), 
                            MSTP,   4, 
                                    Offset (0x83), 
                            CSTP,   4, 
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
                                    Offset (0x17), 
                            SMBS,   8, 
                            SPTL,   8, 
                                    Offset (0x1A), 
                            SADD,   8, 
                            SCOM,   8, 
                            SDTA,   16
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

                        OperationRegion (PCNT, SystemIO, 0x0410, 0x04)
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

                        Name (B0UC, Buffer (0x46)
                        {
                            /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                            /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                            /* 0010 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                            /* 0018 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                            /* 0020 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                            /* 0028 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                            /* 0030 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                            /* 0038 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                            /* 0040 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                        })
                        Method (WMC9, 3, NotSerialized)
                        {
                            Store (0xC9, P80H)
                            Store (0x00, BER2)
                            If (LEqual (Arg1, 0x01))
                            {
                                CreateDWordField (Arg2, 0x00, PE04)
                                If (LEqual (PE04, 0x00))
                                {
                                    Store (I15H (0x05, 0x9610, 0x0107, 0x00, 0x00), Local0)
                                }

                                If (LEqual (PE04, 0x01))
                                {
                                    Store (I15H (0x05, 0x9610, 0x0108, 0x00, 0x00), Local0)
                                }

                                If (And (Local0, 0x01))
                                {
                                    Store (0x00, BUF0)
                                }
                                Else
                                {
                                    Store (0x01, BUF0)
                                }

                                Return (CBE0)
                            }

                            If (LEqual (Arg1, 0x02))
                            {
                                CreateDWordField (Arg2, 0x00, PS04)
                                Store (WS2C (Arg2, 0x08), Local0)
                                If (LEqual (PS04, 0x00))
                                {
                                    I15H (0x05, 0x9610, 0x0207, Local0, 0x00)
                                }

                                If (LEqual (PS04, 0x01))
                                {
                                    I15H (0x05, 0x9610, 0x0208, Local0, 0x00)
                                }

                                Return (CBE0)
                            }

                            If (LEqual (Arg1, 0x03))
                            {
                                CreateDWordField (Arg2, 0x00, PC04)
                                Store (WS2C (Arg2, 0x08), Local0)
                                If (LEqual (PC04, 0x00))
                                {
                                    Store (I15H (0x05, 0x9610, 0x0307, Local0, 0x00), Local0)
                                }

                                If (LEqual (PC04, 0x01))
                                {
                                    Store (I15H (0x05, 0x9610, 0x0308, Local0, 0x00), Local0)
                                }

                                If (And (Local0, 0x01))
                                {
                                    Store (0x01, BUF0)
                                }
                                Else
                                {
                                    Store (0x00, BUF0)
                                }

                                Return (CBE0)
                            }

                            If (LEqual (Arg1, 0x04))
                            {
                                CreateDWordField (CBE1, 0x10, GB04)
                                Store (0x00, GB04)
                                I15H (0x05, 0x9610, 0x17, 0x00, 0x00)
                                RC2H (0x10)
                                Return (CBE1)
                            }

                            If (LEqual (Arg1, 0x05))
                            {
                                Store (WH2C (Arg2, 0x00), Local0)
                                I15H (0x05, 0x9610, 0x0117, 0x00, 0x00)
                                Return (CBE0)
                            }

                            If (LEqual (Arg1, 0x06))
                            {
                                CreateWordField (B0UC, 0x02, AT02)
                                Store (0x00, AT02)
                                CreateWordField (B0UC, 0x04, ATLN)
                                I15H (0x05, 0x9610, 0x25, 0x00, 0x00)
                                Store (RC2U (0x06), ATLN)
                                Return (B0UC)
                            }

                            If (LEqual (Arg1, 0x07))
                            {
                                CreateByteField (Arg2, 0x00, SA01)
                                If (SA01)
                                {
                                    Store (WS2C (Arg2, 0x02), Local0)
                                }
                                Else
                                {
                                    WRCB (0x00, 0x00)
                                }

                                I15H (0x05, 0x9610, 0x0125, 0x00, 0x00)
                                Return (CBE0)
                            }

                            If (LEqual (Arg1, 0x08))
                            {
                                Store (I15H (0x01, 0x9610, 0x2A, 0x00, 0x00), Local0)
                                And (Local0, 0xFF, Local0)
                                Store (Local0, BUF0)
                                Return (CBE0)
                            }

                            If (LEqual (Arg1, 0x09))
                            {
                                CreateByteField (Arg2, 0x00, SB01)
                                Store (I15H (0x01, 0x9610, 0x012A, SB01, 0x00), Local0)
                                Return (CBE0)
                            }

                            If (LEqual (Arg1, 0x0A))
                            {
                                Store (I15H (0x03, 0x9610, 0x18, 0x00, 0x00), Local0)
                                If (And (Local0, 0xFF))
                                {
                                    Store (0x00, BUF0)
                                }
                                Else
                                {
                                    Store (0x01, BUF0)
                                }

                                Return (CBE0)
                            }
                        }

                        Method (WS2C, 2, NotSerialized)
                        {
                            Store (SizeOf (Arg0), Local0)
                            Increment (Local0)
                            Name (STR1, Buffer (Local0) {})
                            Store (Arg0, STR1)
                            Store (Arg1, Local1)
                            Store (Zero, Local2)
                            While (LLess (Local1, Local0))
                            {
                                Store (DerefOf (Index (STR1, Local1)), Local3)
                                If (Local3)
                                {
                                    WRCB (Local2, Local3)
                                    Increment (Local2)
                                }

                                Increment (Local1)
                            }

                            If (LLess (Local2, 0x20))
                            {
                                WRCB (Local2, 0x00)
                            }

                            Return (Local2)
                        }

                        Method (WH2C, 2, NotSerialized)
                        {
                            Store (SizeOf (Arg0), Local0)
                            Increment (Local0)
                            Name (STR1, Buffer (Local0) {})
                            Store (Arg0, STR1)
                            Store (0x00, Local1)
                            Store (Zero, Local2)
                            While (LLess (Local1, Local0))
                            {
                                Store (DerefOf (Index (STR1, Local1)), Local3)
                                WRCB (Local2, Local3)
                                Increment (Local2)
                                Increment (Local1)
                                If (LEqual (Local3, 0xFF))
                                {
                                    Break
                                }
                            }

                            If (LLess (Local2, 0x20))
                            {
                                WRCB (Local2, 0xFF)
                            }

                            Return (Local2)
                        }

                        Method (RC2H, 1, NotSerialized)
                        {
                            Store (Arg0, Local0)
                            If (LGreaterEqual (Local0, 0x20))
                            {
                                Store (0x20, Local0)
                            }

                            Store (Zero, Local1)
                            While (LLess (Local1, Local0))
                            {
                                Store (RDCB (Local1), Local2)
                                Store (Local2, Index (CBE1, Local1))
                                Increment (Local1)
                                If (LEqual (Local2, 0xFF))
                                {
                                    Break
                                }
                            }

                            Return (Local1)
                        }

                        Method (RC2U, 1, NotSerialized)
                        {
                            Store (0x20, Local0)
                            While (Local0)
                            {
                                Decrement (Local0)
                                If (LNotEqual (RDCB (Local0), 0x20))
                                {
                                    Increment (Local0)
                                    Break
                                }
                            }

                            Store (Zero, Local1)
                            Store (Arg0, Local2)
                            While (LLess (Local1, Local0))
                            {
                                Store (RDCB (Local1), Local3)
                                Store (Local3, Index (B0UC, Local2))
                                Increment (Local2)
                                Store (0x00, Index (B0UC, Local2))
                                Increment (Local2)
                                If (LEqual (Local3, 0x00))
                                {
                                    Break
                                }

                                Increment (Local1)
                            }

                            If (LEqual (Local1, 0x00))
                            {
                                Increment (Local1)
                            }

                            ShiftLeft (Local1, 0x01, Local1)
                            Return (Local1)
                        }

                        Method (WRCB, 2, NotSerialized)
                        {
                            If (LGreaterEqual (Arg0, 0x20))
                            {
                                Return (0x00)
                            }

                            Acquire (MSMI, 0xFFFF)
                            Add (Arg0, 0x10, Local0)
                            Store (Local0, CINX)
                            Store (Arg1, CDAT)
                            Release (MSMI)
                        }

                        Method (RDCB, 1, NotSerialized)
                        {
                            If (LGreaterEqual (Arg0, 0x20))
                            {
                                Return (0x00)
                            }

                            Acquire (MSMI, 0xFFFF)
                            Add (Arg0, 0x10, Local0)
                            Store (Local0, CINX)
                            Store (CDAT, Local0)
                            Release (MSMI)
                            Return (Local0)
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

                            If (LEqual (Arg1, 0x0C)) {}
                            If (LEqual (Arg1, 0x0D))
                            {
                                Store (BLST, Local0)
                                Store (Local0, BUF0)
                                Return (CBE0)
                            }

                            Store (0x01, BER2)
                            Return (CBE0)
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

                            If (LEqual (Arg1, 0x03)) {}
                            If (LEqual (Arg1, 0x04)) {}
                            Store (0x01, BER2)
                            Return (CBE0)
                        }

                        Method (WMCC, 3, NotSerialized)
                        {
                            Store (0xCC, P80H)
                            Store (0x01, BER2)
                            Return (CBE0)
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
                                If (CD04)
                                {
                                    If (And (CFGD, 0x80))
                                    {
                                        Store (0x01, \_SB.PCI0.LPCB.C4C3)
                                    }
                                    Else
                                    {
                                        Store (0x00, \_SB.PCI0.LPCB.C4C3)
                                    }
                                }
                                Else
                                {
                                    Store (0x00, \_SB.PCI0.LPCB.C4C3)
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

                            If (LEqual (Arg1, 0x0A))
                            {
                                Store (0x01, BER2)
                                Return (CBE0)
                            }

                            If (LEqual (Arg1, 0x0B))
                            {
                                CreateDWordField (Arg2, 0x00, CDR0)
                                CreateDWordField (Arg2, 0x04, CDR4)
                                Store (0x00, CBE1)
                                If (LEqual (CDR4, 0x00))
                                {
                                    If (LEqual (CDR0, 0x00))
                                    {
                                        Store (0x01, B1RC)
                                        Return (CBE1)
                                    }

                                    If (LEqual (CDR0, 0x01))
                                    {
                                        Store (0x0D, B1R8)
                                        Store (0x06, B1R4)
                                        Store (0x00, B1R0)
                                        Return (CBE1)
                                    }

                                    Store (0x02, B1ER)
                                    Return (CBE1)
                                }

                                If (LEqual (CDR4, 0x01))
                                {
                                    If (LEqual (CDR0, 0x00))
                                    {
                                        Store (0x02, B1RC)
                                        Return (CBE1)
                                    }

                                    If (LEqual (CDR0, 0x01))
                                    {
                                        Store (0x0D, B1R8)
                                        Store (0x06, B1R4)
                                        Store (0x02, B1R0)
                                        Return (CBE1)
                                    }

                                    If (LEqual (CDR0, 0x02))
                                    {
                                        Store (0x0D, B1R8)
                                        Store (0x06, B1R4)
                                        Store (0x03, B1R0)
                                        Return (CBE1)
                                    }

                                    Store (0x02, B1ER)
                                    Return (CBE1)
                                }

                                If (LEqual (CDR4, 0x02))
                                {
                                    Store (0x02, B1ER)
                                    Return (CBE1)
                                }

                                If (LEqual (CDR4, 0x03))
                                {
                                    If (LEqual (CDR0, 0x00))
                                    {
                                        Store (0x01, B1RC)
                                        Return (CBE1)
                                    }

                                    If (LEqual (CDR0, 0x01))
                                    {
                                        Store (0x02, B1R8)
                                        Store (0x00, B1R4)
                                        Store (0x00, B1R0)
                                        Return (CBE1)
                                    }

                                    Store (0x02, B1ER)
                                    Return (CBE1)
                                }

                                Store (0x01, B1ER)
                                Return (CBE1)
                            }
                        }

                        Method (WMCE, 3, NotSerialized)
                        {
                            Store (0xCE, P80H)
                            CreateDWordField (Arg2, 0x00, CD04)
                            CreateByteField (Arg2, 0x00, CD01)
                            CreateByteField (Arg2, 0x04, CD02)
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
                                    Store (0x81, DAT0)
                                }
                                Else
                                {
                                    Store (0x80, DAT0)
                                }

                                Store (0xE9, CMD0)
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

                            If (LEqual (Arg1, 0x11))
                            {
                                Store (0x00, BER2)
                                Store (0x0258, BUF0)
                                Return (CBE0)
                            }

                            If (LEqual (Arg1, 0x12))
                            {
                                Store (0x00, BER2)
                                Store (0x21, BUF0)
                                Return (CBE0)
                            }

                            If (LEqual (Arg1, 0x13))
                            {
                                GBID (CD02)
                                If (BER2)
                                {
                                    Return (CBE0)
                                }

                                Acquire (\_SB.PCI0.LPCB.EC0.BATM, 0xFFFF)
                                Decrement (CD02)
                                Store (CD02, SMBS)
                                Store (0x16, SADD)
                                Store (CD01, SCOM)
                                Store (0x09, SPTL)
                                Store (0x00, Local0)
                                Store (0x02, BER2)
                                While (LLess (Local0, 0x64))
                                {
                                    If (LEqual (SPTL, 0x00))
                                    {
                                        Store (0x00, BER2)
                                        Store (SDTA, BUF0)
                                        Break
                                    }
                                    Else
                                    {
                                        Sleep (0x01)
                                        Increment (Local0)
                                    }
                                }

                                Release (\_SB.PCI0.LPCB.EC0.BATM)
                                Return (CBE0)
                            }

                            Store (0x01, BER2)
                            Return (CBE0)
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

                                If (LEqual (Arg0, 0x0C))
                                {
                                    Store (0x0900, Local0)
                                }

                                If (LEqual (Arg0, 0x0D))
                                {
                                    Store (0x0A00, Local0)
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

                                If (LEqual (Local1, 0x0900))
                                {
                                    Store (0x0900, Local0)
                                    If (LEqual (LSTS, 0x00))
                                    {
                                        Increment (Local0)
                                    }
                                }

                                If (LEqual (Local1, 0x0A00))
                                {
                                    Or (Local1, BLST, Local0)
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

                        Method (BLAP, 0, NotSerialized)
                        {
                            If (\_SB.AMW0.FIRE)
                            {
                                \_SB.AMW0.ACRN (0x03)
                            }
                        }

                        OperationRegion (KBIO, SystemIO, 0x6C, 0x01)
                        Field (KBIO, ByteAcc, Lock, Preserve)
                        {
                                ,   5, 
                            ECEP,   1
                        }

                        OperationRegion (RAMS, EmbeddedControl, 0x00, 0xFF)
                        Field (RAMS, ByteAcc, Lock, Preserve)
                        {
                            CMD1,   8, 
                                    Offset (0x08), 
                            DAT2,   8, 
                            DAT3,   8, 
                                    Offset (0x4E), 
                            SDID,   8
                        }

                        Method (WCOD, 0, NotSerialized)
                        {
                            Store (0x00, Local0)
                            If (ECEP)
                            {
                                If (\ECON)
                                {
                                    Store (SDID, Local0)
                                }
                            }

                            If (LEqual (Local0, 0x00))
                            {
                                Return (0x00)
                            }

                            If (LLess (Local0, 0x20))
                            {
                                While (One)
                                {
                                    Name (_T_0, 0x00)
                                    Store (And (Local0, 0xFF), _T_0)
                                    If (LEqual (_T_0, 0x10))
                                    {
                                        \_SB.PCI0.LPCB.EC0._Q10 ()
                                    }
                                    Else
                                    {
                                        If (LEqual (_T_0, 0x19))
                                        {
                                            \_SB.PCI0.LPCB.EC0._Q19 ()
                                        }
                                        Else
                                        {
                                            If (LEqual (_T_0, 0x1C))
                                            {
                                                \_SB.PCI0.LPCB.EC0._Q1C ()
                                            }
                                            Else
                                            {
                                                If (LEqual (_T_0, 0x1D))
                                                {
                                                    \_SB.PCI0.LPCB.EC0._Q1D ()
                                                }
                                            }
                                        }
                                    }

                                    Break
                                }
                            }
                            Else
                            {
                                If (LLess (Local0, 0x30))
                                {
                                    While (One)
                                    {
                                        Name (_T_1, 0x00)
                                        Store (And (Local0, 0xFF), _T_1)
                                        If (LEqual (_T_1, 0x23))
                                        {
                                            \_SB.PCI0.LPCB.EC0._Q23 ()
                                        }

                                        Break
                                    }
                                }
                                Else
                                {
                                    If (LLess (Local0, 0x40))
                                    {
                                        While (One)
                                        {
                                            Name (_T_2, 0x00)
                                            Store (And (Local0, 0xFF), _T_2)
                                            If (LEqual (_T_2, 0x32))
                                            {
                                                \_SB.PCI0.LPCB.EC0._Q32 ()
                                            }
                                            Else
                                            {
                                                If (LEqual (_T_2, 0x33))
                                                {
                                                    \_SB.PCI0.LPCB.EC0._Q33 ()
                                                }
                                                Else
                                                {
                                                    If (LEqual (_T_2, 0x34))
                                                    {
                                                        \_SB.PCI0.LPCB.EC0._Q34 ()
                                                    }
                                                    Else
                                                    {
                                                        If (LEqual (_T_2, 0x35))
                                                        {
                                                            \_SB.PCI0.LPCB.EC0._Q35 ()
                                                        }
                                                        Else
                                                        {
                                                            If (LEqual (_T_2, 0x36))
                                                            {
                                                                \_SB.PCI0.LPCB.EC0._Q36 ()
                                                            }
                                                            Else
                                                            {
                                                                If (LEqual (_T_2, 0x37))
                                                                {
                                                                    \_SB.PCI0.LPCB.EC0._Q37 ()
                                                                }
                                                                Else
                                                                {
                                                                    If (LEqual (_T_2, 0x38))
                                                                    {
                                                                        \_SB.PCI0.LPCB.EC0._Q38 ()
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
                                    Else
                                    {
                                        If (LLess (Local0, 0x50))
                                        {
                                            While (One)
                                            {
                                                Name (_T_3, 0x00)
                                                Store (And (Local0, 0xFF), _T_3)
                                                If (LEqual (_T_3, 0x40))
                                                {
                                                    \_SB.PCI0.LPCB.EC0._Q40 ()
                                                }
                                                Else
                                                {
                                                    If (LEqual (_T_3, 0x41))
                                                    {
                                                        \_SB.PCI0.LPCB.EC0._Q41 ()
                                                    }
                                                    Else
                                                    {
                                                        If (LEqual (_T_3, 0x48))
                                                        {
                                                            \_SB.PCI0.LPCB.EC0._Q48 ()
                                                        }
                                                        Else
                                                        {
                                                            If (LEqual (_T_3, 0x4C))
                                                            {
                                                                \_SB.PCI0.LPCB.EC0._Q4C ()
                                                            }
                                                            Else
                                                            {
                                                                If (LEqual (_T_3, 0x4D))
                                                                {
                                                                    \_SB.PCI0.LPCB.EC0._Q4D ()
                                                                }
                                                            }
                                                        }
                                                    }
                                                }

                                                Break
                                            }
                                        }
                                        Else
                                        {
                                            If (LLess (Local0, 0x60))
                                            {
                                                While (One)
                                                {
                                                    Name (_T_4, 0x00)
                                                    Store (And (Local0, 0xFF), _T_4)
                                                    If (LEqual (_T_4, 0x50))
                                                    {
                                                        \_SB.PCI0.LPCB.EC0._Q50 ()
                                                    }
                                                    Else
                                                    {
                                                        If (LEqual (_T_4, 0x51))
                                                        {
                                                            \_SB.PCI0.LPCB.EC0._Q51 ()
                                                        }
                                                        Else
                                                        {
                                                            If (LEqual (_T_4, 0x52))
                                                            {
                                                                \_SB.PCI0.LPCB.EC0._Q52 ()
                                                            }
                                                            Else
                                                            {
                                                                If (LEqual (_T_4, 0x53))
                                                                {
                                                                    \_SB.PCI0.LPCB.EC0._Q53 ()
                                                                }
                                                                Else
                                                                {
                                                                    If (LEqual (_T_4, 0x5C))
                                                                    {
                                                                        \_SB.PCI0.LPCB.EC0._Q5C ()
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }

                                                    Break
                                                }
                                            }
                                            Else
                                            {
                                                While (One)
                                                {
                                                    Name (_T_5, 0x00)
                                                    Store (And (Local0, 0xFF), _T_5)
                                                    If (LEqual (_T_5, 0x80))
                                                    {
                                                        \_SB.PCI0.LPCB.EC0._Q80 ()
                                                    }
                                                    Else
                                                    {
                                                        If (LEqual (_T_5, 0x81))
                                                        {
                                                            \_SB.PCI0.LPCB.EC0._Q81 ()
                                                        }
                                                        Else
                                                        {
                                                            If (LEqual (_T_5, 0x82))
                                                            {
                                                                \_SB.PCI0.LPCB.EC0._Q82 ()
                                                            }
                                                            Else
                                                            {
                                                                If (LEqual (_T_5, 0x83))
                                                                {
                                                                    \_SB.PCI0.LPCB.EC0._Q83 ()
                                                                }
                                                                Else
                                                                {
                                                                    If (LEqual (_T_5, 0x84))
                                                                    {
                                                                        \_SB.PCI0.LPCB.EC0._Q84 ()
                                                                    }
                                                                    Else
                                                                    {
                                                                        If (LEqual (_T_5, 0x85))
                                                                        {
                                                                            \_SB.PCI0.LPCB.EC0._Q85 ()
                                                                        }
                                                                        Else
                                                                        {
                                                                            If (LEqual (_T_5, 0x86))
                                                                            {
                                                                                \_SB.PCI0.LPCB.EC0._Q86 ()
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
                                        }
                                    }
                                }
                            }

                            Return (Local0)
                        }

                        OperationRegion (CMIO, SystemIO, 0x72, 0x02)
                        Field (CMIO, ByteAcc, Lock, Preserve)
                        {
                            CINX,   8, 
                            CDAT,   8
                        }

                        IndexField (CINX, CDAT, ByteAcc, NoLock, Preserve)
                        {
                                    Offset (0x10), 
                            CMX0,   32, 
                            CMX1,   32, 
                            CMX2,   32, 
                            CMX3,   32, 
                            CMX4,   32, 
                            CMX5,   32, 
                            CMX6,   32, 
                            CMX7,   32
                        }

                        Method (WB15, 6, NotSerialized)
                        {
                            CreateDWordField (Arg0, 0x00, OEAX)
                            CreateDWordField (Arg0, 0x04, OEBX)
                            CreateDWordField (Arg0, 0x08, OECX)
                            CreateDWordField (Arg0, 0x0C, OEDX)
                            CreateDWordField (Arg0, 0x10, OFLG)
                            CreateDWordField (Arg0, 0x14, OESI)
                            CreateDWordField (Arg0, 0x18, OEDI)
                            Store (0x01, OFLG)
                            ShiftRight (Arg1, 0x08, Local6)
                            And (Local6, 0xFF, Local6)
                            If (LEqual (Local6, 0x00))
                            {
                                Store (CMX0, OECX)
                                Store (CMX1, OEDX)
                                Store (CMX2, OESI)
                                Store (CMX3, OEDI)
                                Store (0x00, OFLG)
                                Return (0x00)
                            }

                            If (LEqual (Local6, 0x10))
                            {
                                Store (CMX4, OECX)
                                Store (CMX5, OEDX)
                                Store (CMX6, OESI)
                                Store (CMX7, OEDI)
                                Store (0x00, OFLG)
                                Return (0x00)
                            }

                            If (LEqual (Local6, 0x01))
                            {
                                Store (Arg2, CMX0)
                                Store (Arg3, CMX1)
                                Store (Arg4, CMX2)
                                Store (Arg5, CMX3)
                                Store (0x00, OFLG)
                                Return (0x00)
                            }

                            If (LEqual (Local6, 0x11))
                            {
                                Store (Arg2, CMX4)
                                Store (Arg3, CMX5)
                                Store (Arg4, CMX6)
                                Store (Arg5, CMX7)
                                Store (0x00, OFLG)
                                Return (0x00)
                            }
                        }
                    }

                    Device (AMW1)
                    {
                        Name (_HID, "*pnp0c14")
                        Name (_UID, "MXM2")
                        Name (_WDG, Buffer (0x3C)
                        {
                            /* 0000 */    0x3C, 0x5C, 0xCB, 0xF6, 0xAE, 0x9C, 0xBD, 0x4E, 
                            /* 0008 */    0xB5, 0x77, 0x93, 0x1E, 0xA3, 0x2A, 0x2C, 0xC0, 
                            /* 0010 */    0x4D, 0x58, 0x01, 0x02, 0x57, 0x93, 0x8A, 0xF2, 
                            /* 0018 */    0x4B, 0xCF, 0x1A, 0x4A, 0x88, 0x93, 0xBB, 0x1F, 
                            /* 0020 */    0x58, 0xEE, 0xA1, 0xAF, 0xD1, 0x00, 0x01, 0x08, 
                            /* 0028 */    0x21, 0x12, 0x90, 0x05, 0x66, 0xD5, 0xD1, 0x11, 
                            /* 0030 */    0xB2, 0xF0, 0x00, 0xA0, 0xC9, 0x06, 0x29, 0x10, 
                            /* 0038 */    0x58, 0x4D, 0x01, 0x00
                        })
                        Method (WMMX, 3, NotSerialized)
                        {
                            If (LGreaterEqual (SizeOf (Arg2), 0x04))
                            {
                                CreateDWordField (Arg2, 0x00, FUNC)
                                CreateDWordField (Arg2, 0x04, ARGS)
                                If (LEqual (FUNC, 0x494D584D))
                                {
                                    Return (\_SB.PCI0.PEGP.VGA.MXMI (ARGS))
                                }
                                Else
                                {
                                    If (LEqual (FUNC, 0x534D584D))
                                    {
                                        Return (\_SB.PCI0.PEGP.VGA.MXMS (ARGS))
                                    }
                                    Else
                                    {
                                        If (LEqual (FUNC, 0x584D584D))
                                        {
                                            If (LGreaterEqual (SizeOf (Arg2), 0x08))
                                            {
                                                Return (0x01)
                                            }
                                        }
                                    }
                                }
                            }

                            Return (0x00)
                        }

                        Name (WQXM, Buffer (0x029C)
                        {
                            /* 0000 */    0x46, 0x4F, 0x4D, 0x42, 0x01, 0x00, 0x00, 0x00, 
                            /* 0008 */    0x8B, 0x02, 0x00, 0x00, 0x0C, 0x08, 0x00, 0x00, 
                            /* 0010 */    0x44, 0x53, 0x00, 0x01, 0x1A, 0x7D, 0xDA, 0x54, 
                            /* 0018 */    0x18, 0xD2, 0x83, 0x00, 0x01, 0x06, 0x18, 0x42, 
                            /* 0020 */    0x10, 0x05, 0x10, 0x8A, 0xE6, 0x80, 0x42, 0x04, 
                            /* 0028 */    0x92, 0x43, 0xA4, 0x30, 0x30, 0x28, 0x0B, 0x20, 
                            /* 0030 */    0x86, 0x90, 0x0B, 0x26, 0x26, 0x40, 0x04, 0x84, 
                            /* 0038 */    0xBC, 0x0A, 0xB0, 0x29, 0xC0, 0x24, 0x88, 0xFA, 
                            /* 0040 */    0xF7, 0x87, 0x28, 0x09, 0x0E, 0x25, 0x04, 0x42, 
                            /* 0048 */    0x12, 0x05, 0x98, 0x17, 0xA0, 0x5B, 0x80, 0x61, 
                            /* 0050 */    0x01, 0xB6, 0x05, 0x98, 0x16, 0xE0, 0x18, 0x92, 
                            /* 0058 */    0x4A, 0x03, 0xA7, 0x04, 0x96, 0x02, 0x21, 0xA1, 
                            /* 0060 */    0x02, 0x94, 0x0B, 0xF0, 0x2D, 0x40, 0x3B, 0xA2, 
                            /* 0068 */    0x24, 0x0B, 0xB0, 0x0C, 0x23, 0x02, 0x8F, 0x82, 
                            /* 0070 */    0xA1, 0x71, 0x68, 0xEC, 0x30, 0x2C, 0x13, 0x4C, 
                            /* 0078 */    0x83, 0x38, 0x8C, 0xB2, 0x91, 0x45, 0x60, 0xDC, 
                            /* 0080 */    0x4E, 0x05, 0xC8, 0x15, 0x20, 0x4C, 0x80, 0x78, 
                            /* 0088 */    0x54, 0x61, 0x34, 0x07, 0x45, 0xE0, 0x42, 0x63, 
                            /* 0090 */    0x64, 0x40, 0xC8, 0xA3, 0x00, 0xAB, 0xA3, 0xD0, 
                            /* 0098 */    0xA4, 0x12, 0xD8, 0xBD, 0x00, 0x8D, 0x02, 0xB4, 
                            /* 00A0 */    0x09, 0x70, 0x28, 0x40, 0xA1, 0x00, 0x6B, 0x18, 
                            /* 00A8 */    0x72, 0x06, 0x21, 0x5B, 0xD8, 0xC2, 0x68, 0x50, 
                            /* 00B0 */    0x80, 0x45, 0x14, 0x8D, 0xE0, 0x2C, 0x2A, 0x9E, 
                            /* 00B8 */    0x93, 0x50, 0x02, 0xDA, 0x1B, 0x82, 0xF0, 0x8C, 
                            /* 00C0 */    0xD9, 0x18, 0x9E, 0x10, 0x83, 0x54, 0x86, 0x21, 
                            /* 00C8 */    0x88, 0xB8, 0x11, 0x8E, 0xA5, 0xFD, 0x41, 0x10, 
                            /* 00D0 */    0xF9, 0xAB, 0xD7, 0xB8, 0x1D, 0x69, 0x34, 0xA8, 
                            /* 00D8 */    0xB1, 0x26, 0x38, 0x76, 0x8F, 0xE6, 0x84, 0x3B, 
                            /* 00E0 */    0x17, 0x20, 0x7D, 0x6E, 0x02, 0x39, 0xBA, 0xD3, 
                            /* 00E8 */    0xA8, 0x73, 0xD0, 0x64, 0x78, 0x0C, 0x2B, 0xC1, 
                            /* 00F0 */    0x7F, 0x80, 0x4F, 0x01, 0x78, 0xD7, 0x80, 0x9A, 
                            /* 00F8 */    0xFE, 0xC1, 0x33, 0x41, 0x70, 0xA8, 0x21, 0x7A, 
                            /* 0100 */    0xD4, 0xE1, 0x4E, 0xE0, 0xBC, 0x8E, 0x84, 0x41, 
                            /* 0108 */    0x1C, 0xD1, 0x71, 0x63, 0x67, 0x75, 0x32, 0x07, 
                            /* 0110 */    0x5D, 0xAA, 0x00, 0xB3, 0x07, 0x00, 0x0D, 0x2E, 
                            /* 0118 */    0xC1, 0x69, 0x9F, 0x49, 0xE8, 0xF7, 0x80, 0xF3, 
                            /* 0120 */    0xE9, 0x79, 0x6C, 0x6C, 0x10, 0xA8, 0x91, 0xF9, 
                            /* 0128 */    0xFF, 0x0F, 0xED, 0x41, 0x9E, 0x56, 0xCC, 0x90, 
                            /* 0130 */    0xCF, 0x02, 0x87, 0xC5, 0xC4, 0x1E, 0x19, 0xE8, 
                            /* 0138 */    0x78, 0xC0, 0x7F, 0x00, 0x78, 0x34, 0x88, 0xF0, 
                            /* 0140 */    0x66, 0xE0, 0xF9, 0x9A, 0x60, 0x50, 0x08, 0x39, 
                            /* 0148 */    0x19, 0x0F, 0x4A, 0xCC, 0xF9, 0x80, 0xCC, 0x25, 
                            /* 0150 */    0xC4, 0x43, 0xC0, 0x31, 0xC4, 0x08, 0x7A, 0x46, 
                            /* 0158 */    0x45, 0x23, 0x6B, 0x22, 0x3E, 0x03, 0x78, 0xDC, 
                            /* 0160 */    0x96, 0x05, 0x42, 0x09, 0x0C, 0xEC, 0x73, 0xC3, 
                            /* 0168 */    0x3B, 0x84, 0x61, 0x71, 0xA3, 0x09, 0xEC, 0xF3, 
                            /* 0170 */    0x85, 0x05, 0x0E, 0x0A, 0x05, 0xEB, 0xBB, 0x42, 
                            /* 0178 */    0xCC, 0xE7, 0x81, 0xE3, 0x3C, 0x60, 0x0B, 0x9F, 
                            /* 0180 */    0x28, 0x01, 0x3E, 0x24, 0x8F, 0x06, 0xDE, 0x20, 
                            /* 0188 */    0xE1, 0x5B, 0x3F, 0x02, 0x10, 0xE0, 0x27, 0x06, 
                            /* 0190 */    0x13, 0x58, 0x1E, 0x30, 0x7A, 0x94, 0xF6, 0x2B, 
                            /* 0198 */    0x00, 0x21, 0xF8, 0x8B, 0xC5, 0x53, 0xC0, 0xEB, 
                            /* 01A0 */    0x40, 0x84, 0x63, 0x81, 0x29, 0x72, 0x6C, 0x68, 
                            /* 01A8 */    0x78, 0x7E, 0x70, 0x88, 0x1E, 0xF5, 0x5C, 0xC2, 
                            /* 01B0 */    0x1F, 0x4D, 0x94, 0x53, 0x38, 0x1C, 0x1F, 0x39, 
                            /* 01B8 */    0x8C, 0x10, 0xFE, 0x49, 0xE3, 0xC9, 0xC3, 0x9A, 
                            /* 01C0 */    0xEF, 0x00, 0x9A, 0xD2, 0x5B, 0xC0, 0xFB, 0x83, 
                            /* 01C8 */    0x47, 0x80, 0x11, 0x20, 0xE1, 0x68, 0x82, 0x89, 
                            /* 01D0 */    0x7C, 0x3A, 0x01, 0xD5, 0xFF, 0xFF, 0x74, 0x02, 
                            /* 01D8 */    0xB8, 0xBA, 0x01, 0x14, 0x37, 0x6A, 0x9D, 0x49, 
                            /* 01E0 */    0x7C, 0x2C, 0xF1, 0xAD, 0xE4, 0xBC, 0x43, 0xC5, 
                            /* 01E8 */    0x7F, 0x93, 0x78, 0x3A, 0xF1, 0x34, 0x1E, 0x4C, 
                            /* 01F0 */    0x42, 0x44, 0x89, 0x18, 0x21, 0xA2, 0xEF, 0x27, 
                            /* 01F8 */    0x46, 0x08, 0x15, 0x31, 0x6C, 0xA4, 0x37, 0x80, 
                            /* 0200 */    0xE7, 0x13, 0xE3, 0x84, 0x08, 0xF4, 0x74, 0xC2, 
                            /* 0208 */    0x42, 0x3E, 0x34, 0xA4, 0xE1, 0x74, 0x02, 0x50, 
                            /* 0210 */    0xE0, 0xFF, 0x7F, 0x3A, 0x81, 0x1F, 0xF5, 0x74, 
                            /* 0218 */    0x82, 0x1E, 0xAE, 0x4F, 0x19, 0x18, 0xE4, 0x03, 
                            /* 0220 */    0xF2, 0xA9, 0xC3, 0xF7, 0x1F, 0x13, 0xF8, 0x78, 
                            /* 0228 */    0xC2, 0x45, 0x1D, 0x4F, 0x50, 0xA7, 0x07, 0x1F, 
                            /* 0230 */    0x4F, 0xD8, 0x19, 0xE1, 0x2C, 0x1E, 0x03, 0x7C, 
                            /* 0238 */    0x3A, 0xC1, 0xDC, 0x13, 0x7C, 0x3A, 0x01, 0xDB, 
                            /* 0240 */    0x68, 0x60, 0x1C, 0x4F, 0xC0, 0x77, 0x74, 0xC1, 
                            /* 0248 */    0x1D, 0x4F, 0xC0, 0x30, 0x18, 0x18, 0xE7, 0x13, 
                            /* 0250 */    0xE0, 0x31, 0x5E, 0xDC, 0x31, 0xC0, 0x43, 0xE0, 
                            /* 0258 */    0x03, 0x78, 0xDC, 0x38, 0x3D, 0x2B, 0x9D, 0x14, 
                            /* 0260 */    0xF2, 0x24, 0xC2, 0x07, 0x85, 0x39, 0xB0, 0xE0, 
                            /* 0268 */    0x14, 0xDA, 0xF4, 0xA9, 0xD1, 0xA8, 0x55, 0x83, 
                            /* 0270 */    0x32, 0x35, 0xCA, 0x34, 0xA8, 0xD5, 0xA7, 0x52, 
                            /* 0278 */    0x63, 0xC6, 0xCE, 0x19, 0x0E, 0xF8, 0x10, 0xD0, 
                            /* 0280 */    0x89, 0xC0, 0xF2, 0x9E, 0x0D, 0x02, 0xB1, 0x0C, 
                            /* 0288 */    0x0A, 0x81, 0x58, 0xFA, 0xAB, 0x45, 0x20, 0x0E, 
                            /* 0290 */    0x0E, 0xA2, 0xFF, 0x3F, 0x88, 0x23, 0xD2, 0x0A, 
                            /* 0298 */    0xC4, 0xFF, 0x7F, 0x7F
                        })
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
                            0x18, 
                            0x03
                        })
                    }

                    Device (SLPB)
                    {
                        Name (_HID, EisaId ("PNP0C0E"))
                        Name (_PRW, Package (0x02)
                        {
                            0x18, 
                            0x03
                        })
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
                        EisaId ("SYN0300"), 
                        EisaId ("SYN0002"), 
                        EisaId ("PNP0F13")
                    })
                    Name (_CRS, ResourceTemplate ()
                    {
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {12}
                    })
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
                            0xFFC00000,         // Address Base
                            0x00400000,         // Address Length
                            )
                    })
                }

                Device (HPET)
                {
                    Name (_HID, EisaId ("PNP0103"))
                    Name (_CID, EisaId ("PNP0C01"))
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
                            0x0068,             // Range Minimum
                            0x0068,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            )
                        IO (Decode16,
                            0x0480,             // Range Minimum
                            0x0480,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0xFFFF,             // Range Minimum
                            0xFFFF,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0xFFFF,             // Range Minimum
                            0xFFFF,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0400,             // Range Minimum
                            0x0400,             // Range Maximum
                            0x01,               // Alignment
                            0x80,               // Length
                            )
                        IO (Decode16,
                            0x1180,             // Range Minimum
                            0x1180,             // Range Maximum
                            0x01,               // Alignment
                            0x80,               // Length
                            )
                        IO (Decode16,
                            0xFE00,             // Range Minimum
                            0xFE00,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xFF800000,         // Address Base
                            0x00001000,         // Address Length
                            )
                    })
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
            }

            Device (USB0)
            {
                Name (_ADR, 0x001D0000)
                OperationRegion (U1CS, PCI_Config, 0xC4, 0x04)
                Field (U1CS, DWordAcc, NoLock, Preserve)
                {
                    U1EN,   2
                }

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

                Name (_PRW, Package (0x02)
                {
                    0x03, 
                    0x03
                })
            }

            Device (USB1)
            {
                Name (_ADR, 0x001D0001)
                OperationRegion (U1CS, PCI_Config, 0xC4, 0x04)
                Field (U1CS, DWordAcc, NoLock, Preserve)
                {
                    U1EN,   2
                }

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

                Name (_PRW, Package (0x02)
                {
                    0x04, 
                    0x03
                })
            }

            Device (USB2)
            {
                Name (_ADR, 0x001D0002)
                OperationRegion (U1CS, PCI_Config, 0xC4, 0x04)
                Field (U1CS, DWordAcc, NoLock, Preserve)
                {
                    U1EN,   2
                }

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

                Name (_PRW, Package (0x02)
                {
                    0x0C, 
                    0x03
                })
            }

            Device (USBR)
            {
                Name (_ADR, 0x001D0003)
                OperationRegion (U1CS, PCI_Config, 0xC4, 0x04)
                Field (U1CS, DWordAcc, NoLock, Preserve)
                {
                    U1EN,   2
                }

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

                Name (_PRW, Package (0x02)
                {
                    0x20, 
                    0x03
                })
            }

            Device (EHC1)
            {
                Name (_ADR, 0x001D0007)
                Name (_PRW, Package (0x02)
                {
                    0x0D, 
                    0x03
                })
            }

            Device (USB3)
            {
                Name (_ADR, 0x001A0000)
                OperationRegion (U1CS, PCI_Config, 0xC4, 0x04)
                Field (U1CS, DWordAcc, NoLock, Preserve)
                {
                    U1EN,   2
                }

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

                Name (_PRW, Package (0x02)
                {
                    0x0E, 
                    0x03
                })
            }

            Device (USB4)
            {
                Name (_ADR, 0x001A0001)
                OperationRegion (U1CS, PCI_Config, 0xC4, 0x04)
                Field (U1CS, DWordAcc, NoLock, Preserve)
                {
                    U1EN,   2
                }

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

                Name (_PRW, Package (0x02)
                {
                    0x05, 
                    0x03
                })
            }

            Device (USB5)
            {
                Name (_ADR, 0x001A0002)
                OperationRegion (U1CS, PCI_Config, 0xC4, 0x04)
                Field (U1CS, DWordAcc, NoLock, Preserve)
                {
                    U1EN,   2
                }

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

                Name (_PRW, Package (0x02)
                {
                    0x20, 
                    0x03
                })
            }

            Device (EHC2)
            {
                Name (_ADR, 0x001A0007)
                Name (_PRW, Package (0x02)
                {
                    0x0D, 
                    0x03
                })
            }

            Device (HDEF)
            {
                Name (_ADR, 0x001B0000)
                OperationRegion (HDAR, PCI_Config, 0x4C, 0x10)
                Field (HDAR, WordAcc, NoLock, Preserve)
                {
                    DCKA,   1, 
                            Offset (0x01), 
                    DCKM,   1, 
                        ,   6, 
                    DCKS,   1, 
                            Offset (0x08), 
                        ,   15, 
                    PMES,   1
                }

                Name (_PRW, Package (0x02)
                {
                    0x0D, 
                    0x03
                })
                Name (HDWA, 0x00)
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
                OperationRegion (PXCS, PCI_Config, 0x40, 0xC0)
                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                            Offset (0x12), 
                        ,   13, 
                    LASX,   1, 
                            Offset (0x1A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                            Offset (0x1B), 
                    LSCX,   1, 
                            Offset (0x20), 
                            Offset (0x22), 
                    PSPX,   1, 
                            Offset (0x9C), 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }

                Device (PXSX)
                {
                    Name (_ADR, 0x00)
                    Name (_PRW, Package (0x02)
                    {
                        0x11, 
                        0x05
                    })
                }

                Method (_PRT, 0, NotSerialized)
                {
                    If (PICM)
                    {
                        Return (AR04)
                    }

                    Return (PR04)
                }
            }

            Device (RP02)
            {
                Name (_ADR, 0x001C0001)
                OperationRegion (PXCS, PCI_Config, 0x40, 0xC0)
                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                            Offset (0x12), 
                        ,   13, 
                    LASX,   1, 
                            Offset (0x1A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                            Offset (0x1B), 
                    LSCX,   1, 
                            Offset (0x20), 
                            Offset (0x22), 
                    PSPX,   1, 
                            Offset (0x9C), 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }

                Device (PXSX)
                {
                    Name (_ADR, 0x00)
                }

                Method (_PRT, 0, NotSerialized)
                {
                    If (PICM)
                    {
                        Return (AR05)
                    }

                    Return (PR05)
                }
            }

            Device (RP03)
            {
                Name (_ADR, 0x001C0002)
                OperationRegion (PXCS, PCI_Config, 0x40, 0xC0)
                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                            Offset (0x12), 
                        ,   13, 
                    LASX,   1, 
                            Offset (0x1A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                            Offset (0x1B), 
                    LSCX,   1, 
                            Offset (0x20), 
                            Offset (0x22), 
                    PSPX,   1, 
                            Offset (0x9C), 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }

                Device (PXSX)
                {
                    Name (_ADR, 0x00)
                }

                Method (_PRT, 0, NotSerialized)
                {
                    If (PICM)
                    {
                        Return (AR06)
                    }

                    Return (PR06)
                }
            }

            Device (RP04)
            {
                Name (_ADR, 0x001C0003)
                OperationRegion (PXCS, PCI_Config, 0x40, 0xC0)
                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                            Offset (0x12), 
                        ,   13, 
                    LASX,   1, 
                            Offset (0x1A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                            Offset (0x1B), 
                    LSCX,   1, 
                            Offset (0x20), 
                            Offset (0x22), 
                    PSPX,   1, 
                            Offset (0x9C), 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }

                Device (PXSX)
                {
                    Name (_ADR, 0x00)
                }

                Method (_PRT, 0, NotSerialized)
                {
                    If (PICM)
                    {
                        Return (AR07)
                    }

                    Return (PR07)
                }
            }

            Device (RP05)
            {
                Name (_ADR, 0x001C0004)
                OperationRegion (PXCS, PCI_Config, 0x40, 0xC0)
                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                            Offset (0x12), 
                        ,   13, 
                    LASX,   1, 
                            Offset (0x1A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                            Offset (0x1B), 
                    LSCX,   1, 
                            Offset (0x20), 
                            Offset (0x22), 
                    PSPX,   1, 
                            Offset (0x9C), 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }

                Device (PXSX)
                {
                    Name (_ADR, 0x00)
                }

                Name (PXSX._RMV, 0x01)
                Method (_PRT, 0, NotSerialized)
                {
                    If (PICM)
                    {
                        Return (AR08)
                    }

                    Return (PR08)
                }
            }

            Device (RP06)
            {
                Name (_ADR, 0x001C0005)
                OperationRegion (PXCS, PCI_Config, 0x40, 0xC0)
                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                            Offset (0x12), 
                        ,   13, 
                    LASX,   1, 
                            Offset (0x1A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                            Offset (0x1B), 
                    LSCX,   1, 
                            Offset (0x20), 
                            Offset (0x22), 
                    PSPX,   1, 
                            Offset (0x9C), 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }

                Device (PXSX)
                {
                    Name (_ADR, 0x00)
                }
            }

            Device (GLAN)
            {
                Name (_ADR, 0x00190000)
                Name (_PRW, Package (0x02)
                {
                    0x0D, 
                    0x05
                })
            }
        }
    }

    Scope (\_PR)
    {
        Processor (CPU0, 0x00, 0x00000410, 0x06) {}
        Processor (CPU1, 0x01, 0x00000410, 0x06) {}
        Processor (CPU2, 0x02, 0x00000410, 0x06) {}
        Processor (CPU3, 0x03, 0x00000410, 0x06) {}
    }

    Mutex (MUTX, 0x00)
    OperationRegion (PRT0, SystemIO, 0x80, 0x04)
    Field (PRT0, DWordAcc, Lock, Preserve)
    {
        P80H,   32
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

    OperationRegion (SPRT, SystemIO, 0xB2, 0x02)
    Field (SPRT, ByteAcc, Lock, Preserve)
    {
        SSMP,   8
    }

    Method (\_PIC, 1, NotSerialized)
    {
        Store (Arg0, GPIC)
        Store (Arg0, PICM)
    }

    Method (_PTS, 1, NotSerialized)
    {
        Store (Arg0, P80H)
        \_SB.PCI0.LPCB.EC0.ECPS (Arg0)
        If (LEqual (Arg0, 0x03))
        {
            If (LAnd (DTSE, MPEN))
            {
                TRAP (\TRTD, 0x1E)
            }
        }

        If (LEqual (Arg0, 0x05)) {}
        PHSR (0x88, Arg0)
    }

    Method (_WAK, 1, NotSerialized)
    {
        Store (Arg0, P80H)
        \_SB.PCI0.LPCB.EC0.ECWK (Arg0)
        If (LOr (LEqual (Arg0, 0x03), LEqual (Arg0, 0x04)))
        {
            If (LAnd (DTSE, MPEN))
            {
                TRAP (\TRTD, 0x14)
            }

            If (And (CFGD, 0x01000000))
            {
                If (LAnd (And (CFGD, 0xF0), LAnd (LEqual (OSYS, 0x07D1), 
                    LNot (And (PDC0, 0x10)))))
                {
                    TRAP (\TRTP, \ESCS)
                }
            }

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

            If (LEqual (RP5D, 0x00))
            {
                Notify (\_SB.PCI0.RP05, 0x00)
            }
        }

        Return (Package (0x02)
        {
            0x00, 
            0x00
        })
    }

    Method (GETB, 3, Serialized)
    {
        Multiply (Arg0, 0x08, Local0)
        Multiply (Arg1, 0x08, Local1)
        CreateField (Arg2, Local0, Local1, TBF3)
        Return (TBF3)
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

    Method (TRAP, 2, Serialized)
    {
        Store (Arg1, SMIF)
        If (LEqual (Arg0, \TRTP))
        {
            Store (0x00, TRPI)
        }

        If (LEqual (Arg0, \TRTD))
        {
            Store (Arg1, DTSF)
            Store (0x00, TRPD)
            Return (DTSF)
        }

        If (LEqual (Arg0, \TRTI))
        {
            Store (0x00, TRP0)
        }

        Return (SMIF)
    }

    Scope (\_SB.PCI0)
    {
        Method (_INI, 0, NotSerialized)
        {
            Store (0x07D0, OSYS)
            If (CondRefOf (\_OSI, Local0))
            {
                If (\_OSI ("Linux"))
                {
                    Store (0x03E8, OSYS)
                }

                If (\_OSI ("Windows 2001"))
                {
                    Store (0x07D1, OSYS)
                }

                If (\_OSI ("Windows 2001 SP1"))
                {
                    Store (0x07D1, OSYS)
                }

                If (\_OSI ("Windows 2001 SP2"))
                {
                    Store (0x07D2, OSYS)
                }

                If (\_OSI ("Windows 2006"))
                {
                    Store (0x07D6, OSYS)
                }

                If (LAnd (MPEN, LEqual (OSYS, 0x07D1)))
                {
                    TRAP (\TRTP, \ESCS)
                }

                TRAP (\TRTI, \SOOT)
            }
        }
    }

    Scope (\)
    {
        Name (PICM, 0x00)
    }

    Scope (\_TZ)
    {
        Name (TBSE, 0x0AAC)
        Name (CRT0, 0x00)
        Name (PSV0, 0x00)
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

                If (Local1)
                {
                    Add (PSV0, 0x01, Local0)
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

            Method (_PSL, 0, Serialized)
            {
                If (MPEN)
                {
                    Return (Package (0x02)
                    {
                        \_PR.CPU0, 
                        \_PR.CPU1
                    })
                }

                Return (Package (0x01)
                {
                    \_PR.CPU0
                })
            }

            Method (_PSV, 0, NotSerialized)
            {
                If (\ECON)
                {
                    Store (0x20, \_SB.PCI0.LPCB.EC0.TIID)
                    Store (\_SB.PCI0.LPCB.EC0.TSP0, Local0)
                }
                Else
                {
                    WBEC (0x01, 0x20)
                    Store (RBEC (0xD0), Local0)
                }

                If (LOr (LGreaterEqual (Local0, 0x80), LLess (Local0, 0x1E)))
                {
                    Store (0x5A, Local0)
                }

                Store (Local0, PSV0)
                Return (C2K (Local0))
            }

            Name (_TC1, 0x00)
            Name (_TC2, 0x32)
            Name (_TSP, 0x00)
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
    }

    Scope (\_SB.PCI0)
    {
        Device (PDRC)
        {
            Name (_HID, EisaId ("PNP0C02"))
            Name (_UID, 0x01)
            Name (BUF0, ResourceTemplate ()
            {
                Memory32Fixed (ReadWrite,
                    0x00000000,         // Address Base
                    0x00004000,         // Address Length
                    _Y18)
                Memory32Fixed (ReadWrite,
                    0x00000000,         // Address Base
                    0x00004000,         // Address Length
                    _Y19)
                Memory32Fixed (ReadWrite,
                    0x00000000,         // Address Base
                    0x00001000,         // Address Length
                    _Y1A)
                Memory32Fixed (ReadWrite,
                    0x00000000,         // Address Base
                    0x00001000,         // Address Length
                    _Y1B)
                Memory32Fixed (ReadWrite,
                    0x00000000,         // Address Base
                    0x00000000,         // Address Length
                    _Y1C)
                Memory32Fixed (ReadWrite,
                    0xFED20000,         // Address Base
                    0x00020000,         // Address Length
                    )
            })
            Method (_CRS, 0, Serialized)
            {
                CreateDWordField (BUF0, \_SB.PCI0.PDRC._Y18._BAS, RBR0)
                ShiftLeft (\_SB.PCI0.LPCB.RCBA, 0x0E, RBR0)
                CreateDWordField (BUF0, \_SB.PCI0.PDRC._Y19._BAS, MBR0)
                ShiftLeft (\_SB.PCI0.MHBR, 0x0E, MBR0)
                CreateDWordField (BUF0, \_SB.PCI0.PDRC._Y1A._BAS, DBR0)
                ShiftLeft (\_SB.PCI0.DIBR, 0x0C, DBR0)
                CreateDWordField (BUF0, \_SB.PCI0.PDRC._Y1B._BAS, EBR0)
                ShiftLeft (\_SB.PCI0.EPBR, 0x0C, EBR0)
                CreateDWordField (BUF0, \_SB.PCI0.PDRC._Y1C._BAS, XBR0)
                ShiftLeft (\_SB.PCI0.PXBR, 0x1A, XBR0)
                CreateDWordField (BUF0, \_SB.PCI0.PDRC._Y1C._LEN, XSZ0)
                ShiftRight (0x10000000, \_SB.PCI0.PXSZ, XSZ0)
                Return (BUF0)
            }
        }
    }

    Method (BRTN, 1, Serialized)
    {
        If (LEqual (And (DID1, 0x0F00), 0x0400))
        {
            Notify (\_SB.PCI0.GFX0.DD01, Arg0)
        }

        If (LEqual (And (DID2, 0x0F00), 0x0400))
        {
            Notify (\_SB.PCI0.GFX0.DD02, Arg0)
        }

        If (LEqual (And (DID3, 0x0F00), 0x0400))
        {
            Notify (\_SB.PCI0.GFX0.DD03, Arg0)
        }

        If (LEqual (And (DID4, 0x0F00), 0x0400))
        {
            Notify (\_SB.PCI0.GFX0.DD04, Arg0)
        }

        If (LEqual (And (DID5, 0x0F00), 0x0400))
        {
            Notify (\_SB.PCI0.GFX0.DD05, Arg0)
        }
    }

    Scope (\)
    {
        OperationRegion (IO_T, SystemIO, 0x0480, 0x10)
        Field (IO_T, ByteAcc, NoLock, Preserve)
        {
            TRPI,   16, 
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

        OperationRegion (IO_D, SystemIO, 0x0900, 0x04)
        Field (IO_D, ByteAcc, NoLock, Preserve)
        {
            TRPD,   8
        }

        OperationRegion (IO_H, SystemIO, 0x0400, 0x04)
        Field (IO_H, ByteAcc, NoLock, Preserve)
        {
            TRPH,   8
        }

        OperationRegion (PMIO, SystemIO, \PMBS, 0x80)
        Field (PMIO, ByteAcc, NoLock, Preserve)
        {
                    Offset (0x28), 
                ,   2, 
            SPST,   1, 
                    Offset (0x42), 
                ,   1, 
            GPEC,   1, 
                    Offset (0x64), 
                ,   9, 
            SCIS,   1, 
                    Offset (0x66)
        }

        OperationRegion (GPIO, SystemIO, \GPBS, 0x3C)
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
            GL02,   8, 
                ,   3, 
            GP27,   1, 
            GP28,   1, 
                    Offset (0x10), 
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
                ,   5, 
                ,   1, 
                    Offset (0x39), 
            GL05,   8, 
            GL06,   8, 
            GL07,   8
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
                ,   1, 
            SATD,   1, 
            SMBD,   1, 
            HDAD,   1, 
                    Offset (0x341A), 
            RP1D,   1, 
            RP2D,   1, 
            RP3D,   1, 
            RP4D,   1, 
            RP5D,   1, 
            RP6D,   1
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
    }

    Scope (\_SB.PCI0)
    {
        Device (SAT0)
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

        Device (SAT1)
        {
            Name (_ADR, 0x001F0005)
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

            OperationRegion (SMBI, SystemIO, 0x1C00, 0x10)
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

            Method (SWRW, 3, Serialized)
            {
                If (STRT ())
                {
                    Return (0x00)
                }

                Store (0x00, I2CE)
                Store (0xBF, HSTS)
                Store (Arg0, TXSA)
                Store (Arg1, HCOM)
                And (Arg2, 0xFF, DAT0)
                And (ShiftRight (Arg2, 0x08), 0xFF, DAT1)
                Store (0x4C, HCON)
                If (COMP ())
                {
                    Or (HSTS, 0xFF, HSTS)
                    Return (0x01)
                }

                Return (0x00)
            }

            Method (SRDW, 2, Serialized)
            {
                If (STRT ())
                {
                    Return (0xFFFF)
                }

                Store (0x00, I2CE)
                Store (0xBF, HSTS)
                Store (Or (Arg0, 0x01), TXSA)
                Store (Arg1, HCOM)
                Store (0x4C, HCON)
                If (COMP ())
                {
                    Or (HSTS, 0xFF, HSTS)
                    Return (Or (ShiftLeft (DAT1, 0x08), DAT0))
                }

                Return (0xFFFFFFFF)
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

    Scope (\_GPE)
    {
        Method (_L01, 0, NotSerialized)
        {
            Add (L01C, 0x01, L01C)
            P8XH (0x00, 0x01)
            P8XH (0x01, L01C)
            If (LAnd (LEqual (RP1D, 0x00), \_SB.PCI0.RP01.HPSX))
            {
                Sleep (0x64)
                If (\_SB.PCI0.RP01.PDCX)
                {
                    Store (0x01, \_SB.PCI0.RP01.PDCX)
                    Store (0x01, \_SB.PCI0.RP01.HPSX)
                    Notify (\_SB.PCI0.RP01, 0x00)
                }
                Else
                {
                    Store (0x01, \_SB.PCI0.RP01.HPSX)
                }
            }

            If (LAnd (LEqual (RP2D, 0x00), \_SB.PCI0.RP02.HPSX))
            {
                Sleep (0x64)
                If (\_SB.PCI0.RP02.PDCX)
                {
                    Store (0x01, \_SB.PCI0.RP02.PDCX)
                    Store (0x01, \_SB.PCI0.RP02.HPSX)
                    Notify (\_SB.PCI0.RP02, 0x00)
                }
                Else
                {
                    Store (0x01, \_SB.PCI0.RP02.HPSX)
                }
            }

            If (LAnd (LEqual (RP3D, 0x00), \_SB.PCI0.RP03.HPSX))
            {
                Sleep (0x64)
                If (\_SB.PCI0.RP03.PDCX)
                {
                    Store (0x01, \_SB.PCI0.RP03.PDCX)
                    Store (0x01, \_SB.PCI0.RP03.HPSX)
                    Notify (\_SB.PCI0.RP03, 0x00)
                }
                Else
                {
                    Store (0x01, \_SB.PCI0.RP03.HPSX)
                }
            }

            If (LAnd (LEqual (RP4D, 0x00), \_SB.PCI0.RP04.HPSX))
            {
                Sleep (0x64)
                If (\_SB.PCI0.RP04.PDCX)
                {
                    Store (0x01, \_SB.PCI0.RP04.PDCX)
                    Store (0x01, \_SB.PCI0.RP04.HPSX)
                    Notify (\_SB.PCI0.RP04, 0x00)
                }
                Else
                {
                    Store (0x01, \_SB.PCI0.RP04.HPSX)
                }
            }

            If (LAnd (LEqual (RP5D, 0x00), \_SB.PCI0.RP05.HPSX))
            {
                Sleep (0x64)
                If (\_SB.PCI0.RP05.PDCX)
                {
                    Store (0x01, \_SB.PCI0.RP05.PDCX)
                    Store (0x01, \_SB.PCI0.RP05.HPSX)
                    Notify (\_SB.PCI0.RP05, 0x00)
                }
                Else
                {
                    Store (0x01, \_SB.PCI0.RP05.HPSX)
                }
            }

            If (LAnd (LEqual (RP6D, 0x00), \_SB.PCI0.RP06.HPSX))
            {
                Sleep (0x64)
                If (\_SB.PCI0.RP06.PDCX)
                {
                    Store (0x01, \_SB.PCI0.RP06.PDCX)
                    Store (0x01, \_SB.PCI0.RP06.HPSX)
                    Notify (\_SB.PCI0.RP06, 0x00)
                }
                Else
                {
                    Store (0x01, \_SB.PCI0.RP06.HPSX)
                }
            }
        }

        Method (_L06, 0, NotSerialized)
        {
            If (LAnd (\_SB.PCI0.GFX0.GSSE, LNot (GSMI)))
            {
                \_SB.PCI0.GFX0.GSCI ()
            }
            Else
            {
                Store (0x01, SCIS)
            }
        }

        Method (_L07, 0, NotSerialized)
        {
            Store (0x20, \_SB.PCI0.SBUS.HSTS)
        }

        Method (_L18, 0, NotSerialized)
        {
            Store (0x18, P80H)
            Notify (\_SB.SLPB, 0x02)
        }

        Method (_L09, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.RP01, 0x02)
            Notify (\_SB.PCI0.RP02, 0x02)
            Notify (\_SB.PCI0.RP03, 0x02)
            Notify (\_SB.PCI0.RP04, 0x02)
            Notify (\_SB.PCI0.RP05, 0x02)
            Notify (\_SB.PCI0.RP06, 0x02)
        }

        Method (_L0B, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.P0P1, 0x02)
        }

        Method (_L03, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.USB0, 0x02)
        }

        Method (_L04, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.USB1, 0x02)
        }

        Method (_L0C, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.USB2, 0x02)
        }

        Method (_L20, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.USBR, 0x02)
            Notify (\_SB.PCI0.USB5, 0x02)
        }

        Method (_L0D, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.EHC1, 0x02)
            Notify (\_SB.PCI0.EHC2, 0x02)
            Notify (\_SB.PCI0.HDEF, 0x02)
            Notify (\_SB.PCI0.GLAN, 0x02)
        }

        Method (_L0E, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.USB3, 0x02)
        }

        Method (_L05, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.USB4, 0x02)
        }
    }

    Name (\_S0, Package (0x04)
    {
        0x00, 
        0x00, 
        0x00, 
        0x00
    })
    Name (\_S3, Package (0x04)
    {
        0x05, 
        0x00, 
        0x00, 
        0x00
    })
    Name (\_S4, Package (0x04)
    {
        0x06, 
        0x00, 
        0x00, 
        0x00
    })
    Name (\_S5, Package (0x04)
    {
        0x07, 
        0x00, 
        0x00, 
        0x00
    })
}

